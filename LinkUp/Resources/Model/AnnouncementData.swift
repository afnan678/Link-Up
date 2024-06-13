//
//  AnnouncementData.swift
//  LinkUp
//
//  Created by Hamza Malik on 17/04/2023.
//

import Foundation
struct AnnouncementData {
    

    static var announcementList = [AnnouncementData]()
    
    var announcementId : Int
    var announcementTitle : String
    var announcementDescription : String
    var announcementRole : String
    
    init( announcementId : Int , title: String, description: String , announcementRole : String) {
        self.announcementId = announcementId
        self.announcementTitle = title
        self.announcementDescription = description
        self.announcementRole = announcementRole
    }
}
