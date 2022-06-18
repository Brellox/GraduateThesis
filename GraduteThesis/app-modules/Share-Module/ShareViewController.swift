//
//  ShareViewController.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 16.05.2022.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.layer.cornerRadius = 25
    }

    @IBAction func didTapShare() {
        //Create a picker specifying file type and mode
        let dPic = UIDocumentPickerViewController(documentTypes: [String(kUTTypePNG)], in: .import)
        dPic.delegate = self
        dPic.allowsMultipleSelection = false
        dPic.modalPresentationStyle = .fullScreen
        present(dPic, animated: true, completion: nil)
    }

    extension TaskAnswerViewController: UIDocumentPickerDelegate {
        
        public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard controller.documentPickerMode == .import, let url = urls.first, let image = UIImage(contentsOfFile: url.path) else { return }
            
            documentImport(image)
            controller.dismiss(animated: true)
        }
        
        public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            controller.dismiss(animated: true)
        }
    }

}

