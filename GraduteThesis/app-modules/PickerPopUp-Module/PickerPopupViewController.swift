//
//  PickerPopupViewController.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import UIKit
class PickerPopUpViewController: UIViewController, PickerPopUpViewProtocol {
    
    var presenter: PickerPopUpPresenterProtocol!
    let configurator: PickerPopUpConfiguratorProtocol = PickerPopUpConfigurator()
    weak var delegate: PickerDelegate?

    var list: [Discipline] = [] 
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func didTapRedyButt(_ sender: Any) {
        
        delegate?.pickerData(discipline: self.picker.selectedRow(inComponent: 0))
        self.presenter.didTapDone()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        picker.delegate = self
        picker.dataSource = self
    }
    
}

extension PickerPopUpViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row].name
    }
    
    
}
