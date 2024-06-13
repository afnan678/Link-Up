//
//  Utilities.swift
//  LinkUp
//
//  Created by Hamza Malik on 05/06/2023.
//

import Foundation
import Alamofire

enum NetworkError {
    case noInternet
    case noResponse
    case customError(String)
}
extension NetworkError : LocalizedError{
    var errorDescription: String?
    {
        get{
            switch self
            {
            case .noInternet:
                return internetServiceMessage.noInternet
            case .noResponse:
                return internetServiceMessage.noResponse
            case .customError(let error):
                return error
            }
        }
    }
}

struct internetServiceMessage {
    
    static let noInternet = "Internet Not Available"
    static let noResponse = "No Available"

}

class Utilities {
    
    static func isInternetConnected() -> Bool{
        return NetworkReachabilityManager()!.isReachable
    }
    
}
