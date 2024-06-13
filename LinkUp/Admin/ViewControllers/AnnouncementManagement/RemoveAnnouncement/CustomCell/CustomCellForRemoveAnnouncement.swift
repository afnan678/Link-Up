//
//  CustomCellForRemoveAnnouncement.swift
//  LinkUp
//
//  Created by Hamza Malik on 27/05/2023.
//

import Foundation

import UIKit

class CustomCellForRemoveAnnouncement: UITableViewCell {
    
    static let identifier = "RemoveAnnouncementCell"
    
    var cellBackgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightPurple")
        view.layer.cornerRadius = 20
        return view
    }()
    
//    var studentImage : UIImageView = {
//        let obj = UIImageView()
//        obj.translatesAutoresizingMaskIntoConstraints = false
//        obj.image = UIImage(named: "hamza")
//
//        return obj
//    }()
    var announcementTitle : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Title"
        obj.textColor = .white
        obj.font = .boldSystemFont(ofSize: 20)
        return obj
    }()
    var announcementDetail : UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.numberOfLines = 0
        obj.lineBreakMode = .byWordWrapping
//        obj.text = "Description"
        obj.layer.cornerRadius = 10
        obj.font = .boldSystemFont(ofSize: 12)
        obj.layer.borderWidth = 1
        obj.textAlignment = .justified
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 2 * obj.font.pointSize
        paragraphStyle.headIndent = 2 * obj.font.pointSize

        paragraphStyle.tailIndent = 1 * obj.font.pointSize
        // Add the paragraph style to an attributed string
        let attributedText = NSMutableAttributedString(string: "Description")
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))

        // Set the attributed text on the label
        obj.attributedText = attributedText
        
        return obj
    }()
    let removeAnnouncementButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Remove Announcement", for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 10
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        contentView.addSubview(cellBackgroundView)
//        cellBackgroundView.addSubview(studentImage)
        cellBackgroundView.addSubview(announcementTitle)
        cellBackgroundView.addSubview(announcementDetail)
        cellBackgroundView.addSubview(removeAnnouncementButton)
        
        NSLayoutConstraint.activate([
            
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 10),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -20),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -5),
//            cellBackgroundView.heightAnchor.constraint(equalToConstant: 115),
            
//            studentImage.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 10),
//            studentImage.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor , constant: 16),
//            studentImage.heightAnchor.constraint(equalToConstant: 40),
//            studentImage.widthAnchor.constraint(equalToConstant: 40),
            
            announcementTitle.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor , constant: 10),
            announcementTitle.centerXAnchor.constraint(equalTo: cellBackgroundView.centerXAnchor),
            announcementTitle.heightAnchor.constraint(equalTo: cellBackgroundView.heightAnchor, multiplier: 0.2),
            
            announcementDetail.topAnchor.constraint(equalTo: announcementTitle.bottomAnchor , constant: 3),
            announcementDetail.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 15),
            announcementDetail.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor , constant: -15),
//            announcementDetail.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor , constant: -20)
            announcementDetail.heightAnchor.constraint(equalTo: cellBackgroundView.heightAnchor, multiplier: 0.4),
            
//            removeAnnouncementButton.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor , constant: 60),
//            removeAnnouncementButton.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor , constant: -60),
            removeAnnouncementButton.centerXAnchor.constraint(equalTo: cellBackgroundView.centerXAnchor),
            removeAnnouncementButton.widthAnchor.constraint(equalTo: cellBackgroundView.widthAnchor, multiplier: 0.6),
            removeAnnouncementButton.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -15),
            removeAnnouncementButton.heightAnchor.constraint(equalTo: cellBackgroundView.heightAnchor, multiplier: 0.18),

        ])
    }
    
    func setAnnouncementData( data : AnnouncementData  ){
        self.announcementTitle.text = data.announcementTitle
        self.announcementDetail.text = data.announcementDescription
    }
    
}
