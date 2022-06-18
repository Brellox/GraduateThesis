//
//  AnswerTableViewCell.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 17.05.2022.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stateButt: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(from answer: Answer){
        self.containerView.layer.cornerRadius = 12
        self.nameLabel.text = answer.student
        self.taskLabel.text = answer.taskType == .EXERCISE ? "Задача" : "Вопрос"
        switch answer.answerState{
        case .CHECKING:
            self.stateButt.tintColor = R.color.examRedactColour()
            self.stateButt.setImage(UIImage(systemName: "clock"), for: .normal)
        case .SENT:
            self.stateButt.tintColor = R.color.examYellowColour()
            self.stateButt.setImage(UIImage(systemName: "exclamationmark.circle"), for: .normal)
        case .RATED:
            self.stateButt.tintColor = R.color.darkgreenColour()
            self.stateButt.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        case .IN_PROGRESS:
            self.stateButt.tintColor = R.color.pinkColour()
            self.stateButt.setImage(UIImage(systemName: "clock"), for: .normal)
        case .NO_RATING:
            self.stateButt.tintColor = R.color.examRedactColour()
            self.stateButt.setImage(UIImage(systemName: "clock"), for: .normal)
        case .NO_ANSWER:
            self.stateButt.tintColor = R.color.redColour()
            self.stateButt.setImage(UIImage(systemName: "x.circle"), for: .normal)
        }
    }
    
    static var uiNib: UINib{
        get{
            return UINib(nibName: String.init(describing: self), bundle:  nil)
        }
    }
    
    static var cellIdentifierForReg: String{
        get {
            return String.init(describing: self)
        }
    }
    
}
