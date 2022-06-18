//
//  ExamTableViewCell.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 16.05.2022.
//

import UIKit

class ExamTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    var delegate: ExamCellDelegate?
    var model: ExamBean?
    static let identifier = "ExamTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func cellButtPressed(_ sender: Any) {
        guard let m = self.model else {return}
        switch m.state{
        case .FINISHED:
            self.delegate?.restartButtPressed(id: m.id)
        default:
            self.delegate?.deleteButtPressed(id: m.id)
        }
    
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func getDate(stamp: Int) -> String{
        let result = NSDate(timeIntervalSince1970: TimeInterval(stamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let date: Date = result as Date
        return dateFormatter.string(from: date)
    }
    
    func setContent(from model: ExamBean){
        self.titleLabel.text = model.name
        switch model.state{
        case .REDACTION:
            self.backgroundColor = R.color.examRedactColour()
            self.cellButton.setBackgroundImage(R.image.trash(), for: .normal)
            self.subtitleLabel.text = "Редактируется"
        case .TIME_SET:
            self.backgroundColor = R.color.examYellowColour()
            self.subtitleLabel.text = getDate(stamp: model.start)
        case .READY:
            self.backgroundColor = R.color.examGreenColour()
            self.cellButton.setBackgroundImage(R.image.trash(), for: .normal)
            self.subtitleLabel.text = "Назначьте время сдачи"
        case .PROGRESS:
            self.backgroundColor = R.color.examOngoingColour()
            let date = getDate(stamp: model.start)
            self.cellButton.isHidden = true
            self.subtitleLabel.text = "Идет с \(date)"
        case .FINISHED:
            self.backgroundColor = R.color.examFinishedColour()
            let date = getDate(stamp: model.end)
            self.cellButton.setBackgroundImage(R.image.repeat(), for: .normal)
            self.subtitleLabel.text = "Закончился: \(date)"
        case .CLOSED:
            self.backgroundColor = R.color.examClosedColour()
            self.cellButton.isHidden = true
            self.subtitleLabel.text = "Закрыт"
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
    
    override func prepareForReuse() {
        self.titleLabel.text = ""
        self.subtitleLabel.text = ""
        self.cellButton.isHidden = false
    }
}

protocol ExamCellDelegate: AnyObject{
    func deleteButtPressed(id: Int)
    func restartButtPressed(id: Int)
}
