//
//  PickerPopUpPresenterProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation
protocol PickerPopUpPresenterProtocol: AnyObject {
    var router: PickerPopUpRouterProtocol! {set get}
    func configureView()
    func didTapDone()
}
