//
//  AnswerApiModule.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 11.06.2022.
//

import Foundation

class AnswerApiModule: APIClientBase, RequestManagerDelegate{
    
    private weak var delegate: AnswerApiDelegate?
    private let requestManager: RequestManager
    
    init( _delegate: AnswerApiDelegate) {
        requestManager = RequestManager.init()
        super.init()
        self.delegate = _delegate
        requestManager.delegate = self
        self.setDecoderBase64()
    }
    
    func getInfo(id: Int){
        requestManager.get(method: "/exams/\(id)/full?level=3") { _data in
            do {
                if let exam = try? self.decoder.decode(FullExam.self, from: _data){
                    self.delegate?.fullExamResult(exam: exam)
                }
        }
    }
    }
        
    func error_back(message: String) {
        
    }
    
    func result_data(data: Data) {
        
    }
    
}
