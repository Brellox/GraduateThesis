//
//  UIViewControllerExtension.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 04.06.2022.
//

import UIKit

extension UIViewController {
    
    func hideKeyBoardOnTap(){
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
        
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func showToast(message: String, interval: Double, complition: (()->Void)? = nil){
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor(named: "AccentColor")
        alert.view.alpha = 1
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + interval) {
            alert.dismiss(animated: true, completion: nil)
            if let c = complition {
                c()
            }
        }
    }
    
    func textSize(text: String, font: UIFont, collectionView: UICollectionView) -> CGSize {
            var f = collectionView.bounds
            f.size.height = 9999.0
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            label.font = font
            var s = label.sizeThatFits(f.size)
            s.height = max(54.0, s.height)
            return s
        }
}
