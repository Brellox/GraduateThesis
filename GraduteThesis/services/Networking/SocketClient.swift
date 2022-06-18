//
//  SocketClient.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation
import SocketIO


class SocketClient{
    
    public static let shared = SocketClient()
    private let socket: SocketIOClient
    
    private let manager = SocketManager.init(socketURL: URL.init(string: Keys.url_s.main_url)!, config:
                                                [
//                                                    .forceWebsockets(true),
//                                                    .connectParams(["EIO": "3"]),
                                                    .log(false),
                                                    .compress,
                                                    .extraHeaders(["authorization": MainData.shared.access_token ?? "", "Sec-WebSocket-Extensions": "permessage-deflate"])
                                                ])
    private init(){
        print("-----SOCKET INIT------")
        socket = manager.defaultSocket
    }
    
    public func connectToWebSocket(){
        socket.on(clientEvent: .connect) { (_, _) in
            print("connect complite")
        }
        socket.connect()
    }
    
    private func joiningTo(event: String, callback: @escaping (Any?) -> Void){
        socket.on(event) { (data, ask) in
            callback(data)
        }
    }
    
    //MARK: - Publick methods
    //TODO: - сделать конфигуратор
    public func joinChatByUserId(comeAction: @escaping (ChatMessage) -> Void){
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .base64
        joiningTo(event: "/chat_\(MainData.shared.current_user_id ?? String.valEmpty)") { (inputData) in
            if let _json = inputData as? [[String: Any]]{
                let jsonData = try? JSONSerialization.data(withJSONObject: _json[0])
                comeAction(try! decoder.decode(ChatMessage.self, from: jsonData!))
            }
        }
    }
    
    public func joinReadedChat(dialog_id: String, comeAction: @escaping (Bool) -> Void){
//        let decoder = JSONDecoder()
//        decoder.dataDecodingStrategy = .base64
        joiningTo(event: "/chat/read_\(dialog_id)") { (inputData) in
            comeAction(true)
        }
    }
    
}

