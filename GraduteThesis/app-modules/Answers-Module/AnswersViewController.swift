//
//  AnswersViewController.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import UIKit
class AnswersViewController: UIViewController, AnswersViewProtocol {
    
    @IBOutlet weak var answerTable: UITableView!
    var presenter: AnswersPresenterProtocol!
    let configurator: AnswersConfiguratorProtocol = AnswersConfigurator()

    var examId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        self.getFull()
        self.configureTable()
    }
    
    func configureTable(){
        self.answerTable.register(AnswerTableViewCell.uiNib, forCellReuseIdentifier: AnswerTableViewCell.cellIdentifierForReg)
        self.answerTable.delegate = self
        self.answerTable.dataSource = self
        self.answerTable.separatorStyle = .none
    }
    func setupNavigation(){
        self.title = "Ответы от студентов"
    }
    @IBAction func finishExam(_ sender: Any) {
    }
    
    private func getFull(){
        guard let id = examId else {return}
        self.presenter.getFullExam(id: id)
    }
}

extension AnswersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.answerTable.dequeueReusableCell(withIdentifier: AnswerTableViewCell.cellIdentifierForReg, for: indexPath) as! AnswerTableViewCell
        cell.setContent(from: self.presenter.answers[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}

extension AnswersViewController: AnswerApiDelegate{
    func fullExamResult(exam: FullExam) {
        self.presenter.fullExam = exam
        self.presenter.configureAnswers()
        DispatchQueue.main.async {
            self.answerTable.reloadData()
        }
    }
}
