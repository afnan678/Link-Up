//
//  DataModel.swift
//  LinkUp
//
//  Created by Afnan Ahmed on 05/08/2023.
//

import Foundation
import UIKit
class QuizMarksData{
    
    static var records : [QuizMarksData] = []
    var QuizNo: String?
    var SubjectName: String?
    var ObtainMarks: String?
    var TotalMarks: String?
    
    init(QuizNo: String? = nil, Subject: String? = nil, ObtainMarks: String? = nil, TotalMarks: String? = nil) {
        self.QuizNo = QuizNo
        self.SubjectName = Subject
        self.ObtainMarks = ObtainMarks
        self.TotalMarks = TotalMarks
    }
}

class MidTermMarksData{
    
    static var records : [MidTermMarksData] = []
    var SubjectName: String?
    var ObtainMarks: String?
    var TotalMarks: String?
    
    init(Subject: String? = nil, ObtainMarks: String? = nil, TotalMarks: String? = nil) {
        
        self.SubjectName = Subject
        self.ObtainMarks = ObtainMarks
        self.TotalMarks = TotalMarks
    }
}

class FinalMarksData{
    
    static var records : [FinalMarksData] = []
    var SubjectName: String?
    var ObtainMarks: String?
    var TotalMarks: String?
    
    init(Subject: String? = nil, ObtainMarks: String? = nil, TotalMarks: String? = nil) {
        
        self.SubjectName = Subject
        self.ObtainMarks = ObtainMarks
        self.TotalMarks = TotalMarks
    }
}
