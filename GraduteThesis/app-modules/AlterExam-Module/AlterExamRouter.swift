//
//  AlterExamRouter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

class AlterExamRouter: AlterExamRouterProtocol{
    
    weak var viewController: AlterExamViewController!
    
    init(viewController: AlterExamViewController) {
        self.viewController = viewController
    }
    
    func goToPicker(){
        let pVc = self.viewController.storyboard?.instantiateViewController(withIdentifier: "PickerPopUpViewController") as! PickerPopUpViewController
        pVc.delegate = self.viewController
        pVc.list = self.viewController.presenter.disciplines
        self.viewController.present(pVc, animated: true, completion: nil)
    }
    
    func goBack(){
        DispatchQueue.main.async{
            self.viewController.navigationController?.popViewController(animated: true)
        }
    }
}
