//
//  AlterExamViewController.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import UIKit
class AlterExamViewController: UIViewController, AlterExamViewProtocol {
    
    var presenter: AlterExamPresenterProtocol!
    let configurator: AlterExamConfiguratorProtocol = AlterExamConfigurator()
    
    var currentExam: Int?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var disciplineField: UITextField!
    
    @IBOutlet weak var tagView: CloudTagView!
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var groupLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        self.setNavigation()
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyboardCon))
        containerView.addGestureRecognizer(tap)
        DispatchQueue.global().async {
            self.presenter.getGroups()
            self.presenter.getDisciplines()
            self.getExam()
        }
        tagView.delegate = self
    }
    
    private func getExam(){
        guard let id = self.currentExam else {return}
        self.presenter.getExam(id: id)
    }
    private func setNavigation(){
        self.title = "Редактирование экзамена"
    }
    @IBAction func toggleSwitched(_ sender: Any) {
        DispatchQueue.main.async {
            self.tagView.isHidden = self.toggle.isOn
            self.groupLabel.isHidden = self.toggle.isOn
        }
       
    }
    @IBAction func saveButtTapped(_ sender: Any) {
        if(self.titleField.text != "" && self.disciplineField.text != ""){
            self.presenter.updateExam(name: self.titleField.text!, discipline: self.presenter.selectedDiscipline!)
        } else{
            DispatchQueue.main.async {
                self.showToast(message: "Заполните все поля", interval: 1.5, complition: nil)
            }
        }
    }
    @IBAction func allowanceTapped(_ sender: Any) {
        guard let id = self.currentExam else {return}
        if(self.titleField.text != "" && self.disciplineField.text != ""){
            self.presenter.updateExamState(id: id)
        } else{
            DispatchQueue.main.async {
                self.showToast(message: "Заполните все поля", interval: 1.5, complition: nil)
            }
        }
    }
    
    @IBAction func disButtTapped(_ sender: Any) {
        self.presenter.goToPicker()
    }
    
    @objc func dismissKeyboardCon(){
        view.endEditing(true)
    }
}

extension AlterExamViewController: AddExamApiDelegate{

    func groupList(list: [Group]) {
        var groups: [GroupModel] = []
        for group in list {
            groups.append(GroupModel(from: group))
        }
        self.presenter.groups = groups
    }
    func disciplineList(list: [Discipline]) {
        self.presenter.disciplines = list
    }
    
    func showExam(exam: ExamBean) {
        DispatchQueue.main.async {
            self.titleField.text = exam.name
        }
        for (index,group) in self.presenter.groups.enumerated(){
            if group.id == exam.groupId{
                self.presenter.groups[index].isSelected = true
            }
        }
        DispatchQueue.main.async {
            for (index,group) in self.presenter.groups.enumerated() {
                let tag = TagView(text: group.name, index: index)
                tag.iconImage = nil
                tag.backgroundColor = group.isSelected ? R.color.greenColour() : R.color.backgroundColour()
                self.tagView.tags.append(tag)
            }
        }
        for discipline in self.presenter.disciplines{
            if discipline.id == exam.disciplineId{
                DispatchQueue.main.async {
                    self.disciplineField.text = discipline.name
                }
                self.presenter.selectedDiscipline = discipline.id
            }
        }
    }
    
    func postExamResult(success: Bool) {
        if success{
            self.presenter.goBack()
        } else {
            DispatchQueue.main.async {
                self.showToast(message: "Не удалось обновить экзамен", interval: 1.5)
            }
        }
    }
}

extension AlterExamViewController: TagViewDelegate{
    
    func tagTouched(_ tag: TagView) {
        self.presenter.groups[tag.index].isSelected = !self.presenter.groups[tag.index].isSelected
        DispatchQueue.main.async {
            tag.backgroundColor = self.presenter.groups[tag.index].isSelected ? R.color.greenColour() : R.color.backgroundColour()
        }
    }
}

extension AlterExamViewController: PickerDelegate{
    func pickerData(discipline: Int) {
        DispatchQueue.main.async {
            self.disciplineField.text = self.presenter.disciplines[discipline].name
            self.presenter.selectedDiscipline = self.presenter.disciplines[discipline].id
        }
    }


}
