//
//  ImageUploader.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import UIKit
import Alamofire
import SVProgressHUD

typealias HTTPHeaders = [String: String]

final class ImageUploader {

    let uploadImage: UIImage?
    let number: Int
    let boundary = "example.boundary.\(ProcessInfo.processInfo.globallyUniqueString)"
    let fieldName = "file"
    var endpointMETHOD: String? = nil
    var endpointURI: URL{
        get{
            return .init(string: Keys.url_s.main_url + self.endpointMETHOD!)!
        }
    }

    var parameters: Parameters? {
        return [
            "number": number,
            "key": "file"
        ]
    }
    var headers: HTTPHeaders {
        return [
            "Content-Type": "multipart/form-data; boundary=\(boundary)",
            "Accept": "application/json"
        ]
    }

    init(uploadImage: UIImage, number: Int, method: String) {
        self.uploadImage = uploadImage
        self.number = number
        self.endpointMETHOD = method
    }
    
    
    
//    func upload( params: [String: Any]) {
//        let urlString = "\(Keys.url_s.main_url)/user/avatar"
//        let token = MainData.shared.access_token!
//        let headers: HTTPHeaders = [
//            "Content-type": "multipart/form-data; boundary=\(boundary)",
//            "Accept": "application/json",
//            "Authorization": "Bearer \(token)"
//
//        ]
//        print(token)
//        print("===============")
//        print(headers)
//        let imageData = uploadImage.jpegData(compressionQuality: 1)!
//        let mimeType = imageData.mimeType!
//        let data = createHttpBody(binaryData: imageData, mimeType: mimeType)
//        AF.upload(
//            multipartFormData: { multipartFormData in
//                multipartFormData.append(data, withName: UUID().uuidString, fileName: "\(UUID().uuidString).jpeg", mimeType: mimeType)
//            },
//            to: urlString, //URL Here
//            method: .post,
//            headers: headers)
//            .responseJSON { (resp) in
//                defer{SVProgressHUD.dismiss()}
//                print("resp is \(resp)")
//            }
//    }
    
    func uploadImage(completionHandler: @escaping (ImageUploadResult) -> Void) {
        let imageData = uploadImage!.jpegData(compressionQuality: 1)!
        let mimeType = imageData.mimeType!
        print(mimeType)

        var request = URLRequest(url: endpointURI, method: "POST", headers: headers)
        request.httpBody = createHttpBody(binaryData: imageData, mimeType: mimeType, ext: "jpeg")
        if let token = MainData.shared.access_token{
            request.addValue(token, forHTTPHeaderField: "Authorization")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode ?? 0
            if let data = data, case (200..<300) = statusCode {
                do {
                    let value = try Response(from: data, statusCode: statusCode)
                    completionHandler(.success(value))
                } catch {
                    let _error = ResponseError(statusCode: statusCode, error: AnyError(error))
                    completionHandler(.failure(_error))
                }
            }
//            let tmpError = error ?? NSError(domain: "Unknown", code: 499, userInfo: nil)
//            let _error = ResponseError(statusCode: statusCode, error: AnyError(tmpError as! Error))
//            completionHandler(.failure(_error))
        }
        task.resume()
    }
    
    
    private func createHttpBody(binaryData: Data, mimeType: String, ext: String) -> Data {
        var postContent = "--\(boundary)\r\n"
        let fileName = "\(UUID().uuidString).\(ext)"
        let fileType = "\(mimeType)"
        postContent += "Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"; filetype =\"\(fileType)\"\\r\n"
        postContent += "Content-Type: multipart/form-data\r\n\r\n"

        var data = Data()
        guard let postData = postContent.data(using: .utf8) else { return data }
        data.append(postData)
        data.append(binaryData)

        if let parameters = parameters {
            var content = ""
            parameters.forEach {
                content += "\r\n--\(boundary)\r\n"
                content += "Content-Disposition: form-data; name=\"file\"\r\n\r\n"
                content += "\($0.value)"
            }
            if let postData = content.data(using: .utf8) { data.append(postData) }
        }

        guard let endData = "\r\n--\(boundary)--\r\n".data(using: .utf8) else { return data }
        data.append(endData)
        return data
    }
}

