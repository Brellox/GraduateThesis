//
//  DatePickerDelegate.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation
protocol DatePickerDelegate: AnyObject {
    func pickerData(id: Int, date: Date)
}
