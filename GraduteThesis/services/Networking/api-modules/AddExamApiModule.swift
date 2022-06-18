//
//  AddExamApiModule.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class AddExamApiModule: APIClientBase, RequestManagerDelegate{
    
    private weak var delegate: AddExamApiDelegate?
    private let requestManager: RequestManager
    
    init( _delegate: AddExamApiDelegate) {
        requestManager = RequestManager.init()
        super.init()
        self.delegate = _delegate
        requestManager.delegate = self
        self.setDecoderBase64()
    }
    
    
    func getGroups(){
        requestManager.get(method: "/groups") { _data in
            do {
                if let list = try? self.decoder.decode([Group].self, from: _data){
                    self.delegate?.groupList(list: list)
                }
            }
        }
    }
    func getDisciplines(){
        requestManager.get(method: "/discipline") { _data in
            do {
                if let list = try? self.decoder.decode([Discipline].self, from: _data){
                    self.delegate?.disciplineList(list: list)
                }
            }
        }
    }
    
    func getExam(id: Int){
        requestManager.get(method:"/exams/\(id)") { _data in
            do{
                if let exam = try?self.decoder.decode(ExamBean.self, from: _data){
                    self.delegate?.showExam(exam: exam)
                }
            }
        }
    }
    
    func postExam(name: String, discipline: Int, groups: [Int]){
        let userpost_data: [String: Any] = [
            "name" : name,
            "disciplineId" : discipline,
            "oneGroup" : groups.count == 1 ? true : false,
            "groupId" : groups.count == 1 ? groups[0] : groups
        ]
        requestManager.post(method: "/exams", postData: userpost_data) { _data in
            do{
                if let _ = try JSONSerialization.jsonObject(with: _data) as? [String : Any]{
                    self.delegate?.postExamResult(success: true)
                }
            }catch{
                self.delegate?.postExamResult(success: false)
            }
        }
    }
    
    func updateExam(name: String, discipline: Int, groups: [Int]){
        let userpost_data: [String: Any] = [
            "name" : name,
            "disciplineId" : discipline,
            "oneGroup" : groups.count == 1 ? true : false,
            "groupId" : groups.count == 1 ? groups[0] : groups
        ]
        requestManager.put(method: "/exams", postData: userpost_data) { _data in
            do{
                if let _ = try JSONSerialization.jsonObject(with: _data) as? [String : Any]{
                    self.delegate?.postExamResult(success: true)
                }
            }catch{
                self.delegate?.postExamResult(success: false)
            }
        }
    }
    
    func updateExamState(id: Int){
        let state_data: [String: Any] = [
            "id" : id,
            "state": ExamState.READY.rawValue
        ]
        requestManager.put(method: "/exams/state", postData: state_data) { _data in
            do{
                if let _ = try JSONSerialization.jsonObject(with: _data) as? [String : Any]{
                    self.delegate?.postExamResult(success: true)
                }
            }catch{
                self.delegate?.postExamResult(success: false)
            }
        }
    }
        
    func error_back(message: String) {
        
    }
    
    func result_data(data: Data) {
        
    }
    
}
