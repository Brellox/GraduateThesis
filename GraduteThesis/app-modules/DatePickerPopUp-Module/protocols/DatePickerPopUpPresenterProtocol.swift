//
//  DatePickerPopUpPresenterProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation
protocol DatePickerPopUpPresenterProtocol: AnyObject {
    var router: DatePickerPopUpRouterProtocol! {set get}
    func configureView()
    func didTapDone()
}
