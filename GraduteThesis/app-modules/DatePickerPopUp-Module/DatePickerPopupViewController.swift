//
//  DatePickerPopupViewController.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import UIKit
class DatePickerPopUpViewController: UIViewController, DatePickerPopUpViewProtocol {
    
    var presenter: DatePickerPopUpPresenterProtocol!
    let configurator: DatePickerPopUpConfiguratorProtocol = DatePickerPopUpConfigurator()
    weak var delegate: DatePickerDelegate?
    var id: Int?

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func didTapRedyButt(_ sender: Any) {
        print(self.datePicker.date)
        delegate?.pickerData(id: self.id!, date: self.datePicker.date)
        self.presenter.didTapDone()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
}
