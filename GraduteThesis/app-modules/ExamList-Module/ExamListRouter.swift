//
//  ExamListRouter.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation
import UIKit

class ExamListRouter: ExamListRouterProtocol {
    
    weak var viewController: ExamListViewController!
    
    init(viewController: ExamListViewController) {
        self.viewController = viewController
    }
    
    func logInCheck(success: Bool){
        if !success
        {
            let LIVC = self.viewController.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            let navVC = UINavigationController(rootViewController: LIVC)
            navVC.modalPresentationStyle = .overFullScreen
            DispatchQueue.main.async {
                self.viewController.present(navVC, animated: false, completion: nil)
            }
            
        }
    }
    
    func goToAddExam(){
        let addVC = self.viewController.storyboard?.instantiateViewController(withIdentifier: "AddExamViewController") as! AddExamViewController
        self.viewController.navigationController?.pushViewController(addVC, animated: true)
    }
    
    func alterExam(id: Int){
        let alterVC = self.viewController.storyboard?.instantiateViewController(withIdentifier: "AlterExamViewController") as! AlterExamViewController
        alterVC.currentExam = id
        self.viewController.navigationController?.pushViewController(alterVC, animated: true)
    }
    
    func goToDatePicker(id: Int){
        let dpVC = self.viewController.storyboard?.instantiateViewController(withIdentifier: "DatePickerPopUpViewController") as! DatePickerPopUpViewController
        dpVC.delegate = self.viewController
        dpVC.id = id
        self.viewController.present(dpVC, animated: true, completion: nil)
    }
    
    func showDelAlert(id: Int){
        let alert = UIAlertController.init(title: "Удалить экзамен?", message: nil, preferredStyle: .alert)
        let act = UIAlertAction.init(title: "Отмена", style: .cancel, handler: { (act) in
            
        })
        alert.addAction(act)
        let act2 = UIAlertAction.init(title: "Удалить", style: .destructive, handler: { (act) in
            self.viewController.presenter.deleteExam(id: id)
        })
        
        alert.addAction(act2)
        self.viewController.present(alert, animated: true, completion: nil)
    }
    
    func showStartAlert(id: Int){
        let alert = UIAlertController.init(title: "Начать экзамен?", message: nil, preferredStyle: .alert)
        let act = UIAlertAction.init(title: "Отмена", style: .cancel, handler: { (act) in
        })
        alert.addAction(act)
        let act2 = UIAlertAction.init(title: "Начать", style: .default, handler: { (act) in
            self.viewController.presenter.startExam(id: id)
        })
        
        alert.addAction(act2)
        self.viewController.present(alert, animated: true, completion: nil)
    }
    
    func goToExam(id: Int){
        let eVC = self.viewController.storyboard?.instantiateViewController(withIdentifier: "AnswersViewController") as! AnswersViewController
        eVC.examId = id
        self.viewController.navigationController?.pushViewController(eVC, animated: true)
    }
}
