//
//  AddExamViewController.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import UIKit

class AddExamViewController: UIViewController, AddExamViewProtocol {
    
    var presenter: AddExamPresenterProtocol!
    let configurator: AddExamConfiguratorProtocol = AddExamConfigurator()
    
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
        self.presenter.getGroups()
        tagView.delegate = self
        self.presenter.getDisciplines()
    }
    
    
    private func setNavigation(){
        self.title = "Добавление экзамена"
    }
    @IBAction func toggleSwitched(_ sender: Any) {
        DispatchQueue.main.async {
            self.tagView.isHidden = self.toggle.isOn
            self.groupLabel.isHidden = self.toggle.isOn
        }
       
    }
    
    @IBAction func disButtTapped(_ sender: Any) {
        self.presenter.goToPicker()
    }
    @IBAction func addButtTap(_ sender: Any) {
        if(self.titleField.text != "" && self.disciplineField.text != ""){
            self.presenter.postExam(name: self.titleField.text!, discipline: self.presenter.selectedDiscipline!)
        } else{
            DispatchQueue.main.async {
                self.showToast(message: "Заполните все поля", interval: 1.5, complition: nil)
            }
        }
    }
    

    @objc func dismissKeyboardCon(){
        view.endEditing(true)
    }

}

extension AddExamViewController: AddExamApiDelegate{

    func groupList(list: [Group]) {
        var groups: [GroupModel] = []
        for group in list {
            groups.append(GroupModel(from: group))
        }
        self.presenter.groups = groups
        DispatchQueue.main.async {
            for (index,group) in groups.enumerated() {
                let tag = TagView(text: group.name, index: index)
                tag.iconImage = nil
                tag.backgroundColor = group.isSelected ? R.color.greenColour() : R.color.backgroundColour()
                self.tagView.tags.append(tag)
            }
        }
       

    }
    func disciplineList(list: [Discipline]) {
        self.presenter.disciplines = list
    }
    
    func postExamResult(success: Bool) {
        if success{
            self.presenter.goBack()
        } else {
            DispatchQueue.main.async {
                self.showToast(message: "Не удалось разместить экзамен", interval: 1.5)
            }
        }
    }
}



extension AddExamViewController: PickerDelegate{
    func pickerData(discipline: Int) {
        DispatchQueue.main.async {
            self.disciplineField.text = self.presenter.disciplines[discipline].name
            self.presenter.selectedDiscipline = self.presenter.disciplines[discipline].id
        }
    }


}

extension AddExamViewController: TagViewDelegate{
    
    func tagTouched(_ tag: TagView) {
        self.presenter.groups[tag.index].isSelected = !self.presenter.groups[tag.index].isSelected
        DispatchQueue.main.async {
            tag.backgroundColor = self.presenter.groups[tag.index].isSelected ? R.color.greenColour() : R.color.backgroundColour()
        }
    }
}
