//
//  LogInViewController.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import UIKit

class LogInViewController: UIViewController, LogInViewProtocol {
    
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var hidePasswordButton: UIButton!
    @IBOutlet var containerView: UIView!
    
    var presenter: LogInPresenterProtocol!
    let configurator: LogInConfiguratorProtocol = LogInConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
        self.setNavigation()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyboardCon))
        containerView.addGestureRecognizer(tap)
    }
    
    
    
    private func setNavigation(){
        self.title = "Авторизация"
        
    }
    @IBAction func logInAction(_ sender: Any) {
        if(self.mailField.text != "" && self.passField.text != ""){
            self.presenter.logUser(login: self.mailField.text!, pass: self.passField.text!)
        } else{
            DispatchQueue.main.async {
                self.showToast(message: "Заполните все поля", interval: 1.5, complition: nil)
            }
        }
    }
    
    @IBAction func hideShowPasswordAction(_ sender: Any) {
        passField.isSecureTextEntry = !passField.isSecureTextEntry
        hidePasswordButton.setImage(passField.isSecureTextEntry ? R.image.eyecross() : R.image.eye(), for: .normal)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboardCon(){
        view.endEditing(true)
    }
}

extension LogInViewController: AuthApiDelegate{
    func loginResult(success: Bool, error_message: String?) {
        if success{
            self.presenter.goToApp()
        } else {
            DispatchQueue.main.async {
                self.showToast(message: error_message ?? "Error", interval: 1.5, complition: nil)
            }
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == mailField{
            self.passField.becomeFirstResponder()
        }else{
            self.dismissKeyboard()
        }
        return true
    }

}



