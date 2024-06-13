//
//  studentModel.swift
//  LinkUp
//
//  Created by Hamza Malik on 16/04/2023.
//

import Foundation

struct student {
    
    var imageUrl : String
    var name : String
    var rollNo : String
    var age : String
    var fName : String
    var fEmail : String
    var phNo : String
    var address : String
    
    init( imageUrl : String = "" , name: String = "", rollNo : String = "" ,  age: String = "", fName : String = "", fCNIC : String = "",phNo : String = "", address: String = ""  ) {
        self.imageUrl = imageUrl
        self.name = name
        self.rollNo = rollNo
        self.age = age
        self.fName = fName
        self.fEmail = fCNIC
        self.phNo = phNo
        self.address = address
        
        }
}
