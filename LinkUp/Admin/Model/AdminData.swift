//
//  AdminData.swift
//  LinkUp
//
//  Created by Hamza Malik on 17/04/2023.
//

import Foundation
struct AdminData {
    
    static var shared = AdminData(name: "", email: "")

    var name : String
    var email : String
    
    mutating func setData(name: String = "", email: String = ""  ) {
        
        self.name = name
        self.email = email
    }
}
