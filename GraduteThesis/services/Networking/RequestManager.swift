//
//  RequestManager.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation


class RequestManager {
    
    weak var delegate: RequestManagerDelegate?
    let config = URLSessionConfiguration.default
    
    init(d: RequestManagerDelegate) {
        self.delegate = d
      //  self.config.protocolClasses?.insert(NetProtocol.self, at: 0)
        self.config.httpAdditionalHeaders = self.additionalHeaders
    }
    
    init(){
      //  self.config.protocolClasses?.insert(NetProtocol.self, at: 0)
        self.config.httpAdditionalHeaders = self.additionalHeaders
    }
    
    private let additionalHeaders = {
        return [
            "Accept": "application/json",
            "User-Agent": "",
            "cache-control": "no-cache"
        ]
    }()
    
    public enum HTTPMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }
    
    private let build_main_url = { (method: String)-> URL in
        return URL(string: Keys.url_s.main_url + method)!
    }
    
    
    private func createRequest(url: URL, httpMethod: HTTPMethod) -> URLRequest{
        
        var request = URLRequest.init(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = MainData.shared.access_token{
            request.addValue(token, forHTTPHeaderField: "X-Access-Token")
        } else{
            request.addValue(MainData.shared.loginBase!, forHTTPHeaderField: "X-Authentication")
        }
        return request
    }
    
    private func runTask(method: String, postData: [String: Any]? = nil, httpMethod: HTTPMethod = .GET, success_run: @escaping (Data) -> Void){
        let session = URLSession.init(configuration: config)
        var request: URLRequest = {
            return createRequest(url: build_main_url(method), httpMethod: httpMethod)
        }()
        
        if let _post_data = postData {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: _post_data, options: .prettyPrinted)
            } catch let error {
               print(error.localizedDescription)
            }
            
        }
        
        let task = session.dataTask(with: request){(data, request, error) in
            do{
                if let d = data {
                    success_run(d)
                } else {
//                    success_run(["a": "b"] as [String: AnyObject])
                }
                
            }catch{
//                success_run(["a": "b"] as [String: AnyObject])
            }
        }
        
        task.resume()
        
    }
    
    func get(method: String, success_run: @escaping (Data) -> Void){
        self.runTask(method: method, success_run: success_run)
    }
    
    func post(method: String, postData: [String: Any]?, loginBase: String? = nil, success_run: @escaping (Data) -> Void){
        self.runTask(method: method, postData: postData, httpMethod: .POST, success_run: success_run)
    }
    
    func put(method: String, postData: [String: Any]?, success_run: @escaping (Data) -> Void){
        self.runTask(method: method, postData: postData, httpMethod: .PUT, success_run: success_run)
    }
    
    func delete(method: String, postData: [String: String]?, success_run: @escaping (Data) -> Void){
        self.runTask(method: method, postData: postData, httpMethod: .DELETE, success_run: success_run)
    }
    
    
}

