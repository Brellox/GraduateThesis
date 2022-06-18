//
//  ExamApiModule.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

class ExamApiModule: APIClientBase, RequestManagerDelegate{
    
    private weak var delegate: ExamApiDelegate?
    private let requestManager: RequestManager
    
    init( _delegate: ExamApiDelegate) {
        requestManager = RequestManager.init()
        super.init()
        self.delegate = _delegate
        requestManager.delegate = self
        self.setDecoderBase64()
    }
    
    
    func getExamList(){
        requestManager.get(method: "/exams") { _data in
            do {
                if let list = try? self.decoder.decode([ExamBean].self, from: _data){
                    print(list)
                    self.delegate?.examList(list: list)
                }
            }
        }
    }
    
    func deleteExam(id: Int){
        requestManager.delete(method: "/exams/\(id)", postData: nil) { _data in
            if _data.isEmpty{
                self.delegate?.showResult(success: true, message: nil)
            }else{
                self.delegate?.showResult(success: false, message: "Не удалось удалить экзамен")
            }
        }
    }
    
    func setExamTime(id: Int, start: Int){
        let state_data: [String: Any] = [
            "id" : id,
            "start" : start,
            "state": ExamState.TIME_SET.rawValue
        ]
        requestManager.put(method: "/exams/state", postData: state_data) { _data in
            if let _ = try? self.decoder.decode(ExamBean.self, from: _data){
                self.delegate?.showResult(success: true, message: nil)
            }else{
                self.delegate?.showResult(success: false, message: "Не удалось установить время")
            }
        }
    }
    
    func startExam(id: Int){
        let start = Int(Date().timeIntervalSince1970)
        let state_data: [String: Any] = [
            "id" : id,
            "start" : start,
            "state": ExamState.PROGRESS.rawValue
        ]
        requestManager.put(method: "/exams/state", postData: state_data) { _data in
            if let _ = try? self.decoder.decode(ExamBean.self, from: _data){
                self.delegate?.showResult(success: true, message: nil)
            }else{
                self.delegate?.showResult(success: false, message: "Не удалось начать экзамен")
            }
        }
    }
    
    func postFBToken(){
        guard let token = MainData.shared.device_token else {return}
        let post_data : [String: Any] = [
            "token" : token
        ]
        requestManager.post(method: "/account/firebase-token", postData: post_data) { _data in
            if _data.isEmpty{
                print("success")
            }
        }
    }
        
    func error_back(message: String) {
        
    }
    
    func result_data(data: Data) {
        
    }
    
}
