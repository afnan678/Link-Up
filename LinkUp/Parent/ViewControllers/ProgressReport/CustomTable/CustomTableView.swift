//
//  CustomTableView.swift
//  LinkUp
//
//  Created by Afnan Ahmed on 04/08/2023.
//

import Foundation
import UIKit


class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private let lable: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.font = .systemFont(ofSize: 15)
        lbl.text = "custom cell"
        return lbl
    }()
    private let class1: UILabel = {
        
        let lbl = UILabel()
        lbl.tintColor = .white
        lbl.textColor = UIColor(named: "UiColor")
        lbl.font = .systemFont(ofSize: 15)
        lbl.text = "Class 1"
        return lbl
    }()
    
    public func configure(text: String,class2: String )
    {
        lable.text = text
        class1.text = class2
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        lable.text = nil
        class1.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(lable )
        contentView.addSubview(class1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lable.frame = CGRect(x: 30, y: 0, width: contentView.frame.size.width - 61, height: contentView.frame.size.height)
        class1.frame = CGRect(x: 220 , y: 0, width: contentView.frame.size.width - 61, height: contentView.frame.size.height)
    }
    
}




class QuizMarksTableCell: UITableViewCell {
    
    static let identifier = "QuizTableView"
    
    let QuizMarks_Lable_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    let quizNo_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz No"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let quiz_Subject_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let quiz_Omarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    let quiz_Tmarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    public func configure2(QuizNo: String, Subject: String, Omarks: String, Tmarks: String )
    {
        quizNo_Lable.text = QuizNo
        quiz_Subject_Lable.text = Subject
        quiz_Omarks_Lable.text = Omarks
        quiz_Tmarks_Lable.text = Tmarks
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        quizNo_Lable.text = nil
        quiz_Subject_Lable.text = nil
        quiz_Omarks_Lable.text = nil
        quiz_Tmarks_Lable.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(QuizMarks_Lable_BG_StackView)
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quizNo_Lable)
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quiz_Subject_Lable)
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quiz_Omarks_Lable)
        QuizMarks_Lable_BG_StackView.addArrangedSubview(quiz_Tmarks_Lable)
        
        NSLayoutConstraint.activate([
            QuizMarks_Lable_BG_StackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            QuizMarks_Lable_BG_StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            QuizMarks_Lable_BG_StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            QuizMarks_Lable_BG_StackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
}



class Term1MarksTableCell: UITableViewCell {
    
    static let identifier = "QuizTableView"
    
    let Term1Marks_Lable_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    let Term1_Subject_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let Term1_Omarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    let Term1_Tmarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    public func configure(Subject: String, Omarks: String, Tmarks: String )
    {
        Term1_Subject_Lable.text = Subject
        Term1_Omarks_Lable.text = Omarks
        Term1_Tmarks_Lable.text = Tmarks
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        Term1_Subject_Lable.text = nil
        Term1_Omarks_Lable.text = nil
        Term1_Tmarks_Lable.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(Term1Marks_Lable_BG_StackView)
        Term1Marks_Lable_BG_StackView.addArrangedSubview(Term1_Subject_Lable)
        Term1Marks_Lable_BG_StackView.addArrangedSubview(Term1_Omarks_Lable)
        Term1Marks_Lable_BG_StackView.addArrangedSubview(Term1_Tmarks_Lable)
        
        NSLayoutConstraint.activate([
            Term1Marks_Lable_BG_StackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            Term1Marks_Lable_BG_StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            Term1Marks_Lable_BG_StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            Term1Marks_Lable_BG_StackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
}

class FinalMarksTableCell: UITableViewCell {
    
    static let identifier = "QuizTableView"
    
    let FinalMarks_Lable_BG_StackView: UIStackView = {
       
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    let Final_Subject_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let Final_Omarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    let Final_Tmarks_Lable: UILabel = {
        
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    public func configure(Subject: String, Omarks: String, Tmarks: String )
    {
        Final_Subject_Lable.text = Subject
        Final_Omarks_Lable.text = Omarks
        Final_Tmarks_Lable.text = Tmarks
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        Final_Subject_Lable.text = nil
        Final_Omarks_Lable.text = nil
        Final_Tmarks_Lable.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(FinalMarks_Lable_BG_StackView)
        FinalMarks_Lable_BG_StackView.addArrangedSubview(Final_Subject_Lable)
        FinalMarks_Lable_BG_StackView.addArrangedSubview(Final_Omarks_Lable)
        FinalMarks_Lable_BG_StackView.addArrangedSubview(Final_Tmarks_Lable)
        
        NSLayoutConstraint.activate([
            FinalMarks_Lable_BG_StackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            FinalMarks_Lable_BG_StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            FinalMarks_Lable_BG_StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            FinalMarks_Lable_BG_StackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
}
