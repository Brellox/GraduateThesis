//
//  ExamListViewController.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation
import UIKit

class ExamListViewController: UIViewController, ExamListViewProtocol {
    
    var presenter: ExamListPresenterProtocol!
    let configurator: ExamListConfiguratorProtocol = ExamListConfigurator()
    
    @IBOutlet weak var finishedButt: UIButton!
    @IBOutlet weak var activeButt: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var examTable: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        self.setNavigation()
        self.configureTable()
        refreshControl.addTarget(self, action: #selector(refreshExams(_:)), for: .valueChanged)
        self.examTable.refreshControl = refreshControl
        self.presenter.postFBToken()
        //print(MainData.shared.storegeManager.access_token!)
        //self.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        if MainData.shared.storegeManager.access_token == nil{
            self.presenter.logInCheck(success: false)
        } else{
            self.presenter.getExams()
        }
    }
 
    @objc private func refreshExams(_ sender: Any) {
        self.presenter.getExams()
    }
    
    private func setNavigation(){
        self.title = "Экзамены"
        let logout =  UIBarButtonItem(image: R.image.logout(),
                                     style: .done,
                                     target: self,
                                     action: #selector(didTapLogout))
        logout.tintColor = .black
        self.navigationItem.rightBarButtonItem = logout
        
    }
    
    private func configureTable(){
        self.examTable.delegate = self
        self.examTable.dataSource = self
        
        self.examTable.register(ExamTableViewCell.uiNib, forCellReuseIdentifier: ExamTableViewCell.cellIdentifierForReg)
    }
    
    private func configureView(){
        self.addButton.setTitle("", for: .normal)
        self.addButton.tintColor = R.color.buttColour()
    }
    
    @objc func didTapLogout(){
        MainData.shared.storegeManager.access_token = nil
        self.presenter.logInCheck(success: false)
        
    }
    @IBAction func didTapAddExam(_ sender: Any) {
        self.presenter.goToAddExam()
    }
    
}


extension ExamListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExamTableViewCell.cellIdentifierForReg, for: indexPath) as! ExamTableViewCell
        cell.setContent(from: self.presenter.data[indexPath.row])
        cell.model = self.presenter.data[indexPath.row]
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = self.presenter.data[indexPath.row].id
        switch self.presenter.data[indexPath.row].state{
        case .REDACTION:
            self.presenter.alterExam(id: id)
        case .TIME_SET:
            self.presenter.showStartAlert(id: id)
        case .READY:
            self.presenter.goToDatePicker(id: id)
        case .PROGRESS:
            self.presenter.goToExam(id: id)
        case .FINISHED:
            self.presenter.goToExam(id: id)
        case .CLOSED:
            self.presenter.goToExam(id: id)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}

extension ExamListViewController: ExamApiDelegate{
    func examList(list: [ExamBean]) {
        self.presenter.data = list
        DispatchQueue.main.async {
            self.examTable.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func showResult(success: Bool, message: String?) {
        if success{
            DispatchQueue.main.async {
                self.presenter.getExams()
                self.examTable.reloadData()
            }
        }else{
            DispatchQueue.main.async {
                self.showToast(message: message!, interval: 1.5)
            }
        }
    }
}

extension ExamListViewController: ExamCellDelegate{
    func deleteButtPressed(id: Int) {
        self.presenter.showDelAlert(id: id)
    }
    
    func restartButtPressed(id: Int) {
        
    }
    
    
}


extension ExamListViewController: DatePickerDelegate{
    func pickerData(id: Int, date: Date) {
        self.presenter.setExamTime(id: id, time: date.timeIntervalSince1970)
    }
    
    
}
