//
//  TaskAnswerViewController.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 01.06.2022.
//

import UIKit

class TaskAnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @IBOutlet weak var uppercontent: UIView!
    @IBOutlet weak var bottomcontent: UIView!

    @IBAction func testShit(_ sender: Any) {
        let aaa = self.storyboard?.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
        present(aaa, animated: true)
    }
    @IBAction func keyshit(_ sender: Any) {
    }
    
}
