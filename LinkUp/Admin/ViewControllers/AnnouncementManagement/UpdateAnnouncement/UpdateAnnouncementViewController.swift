//
//  UpdateAnnouncementViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 29/05/2023.
//

import Foundation
import UIKit
import DropDown
 
class UpdateAnnouncementViewController: UIViewController {
    
    let backGroundView : UIView = {
        let view = UIView()
//        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let announcementTitle: UITextField = {
        let title = UITextField()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.placeholder = "Enter Title"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = .black
        title.textAlignment = .center
        title.backgroundColor = .clear
        title.layer.borderWidth = 1
        title.layer.borderColor = UIColor.gray.cgColor
        return title
    }()
    let announcementDescBackView : UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
//        view.backgroundColor = .red
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let announcementDescription: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.text = "Your description text goes here..."
        
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .black
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.isScrollEnabled = true
        textView.showsVerticalScrollIndicator = true
        textView.layer.borderWidth = 0
//        textView.layer.borderColor = UIColor.gray.cgColor
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.lineBreakMode = .byWordWrapping
        return textView
    }()
    var updateAnnouncementButtonBackground : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var updateAnnouncementButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Update Announcement", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(named: "mediumPurple")
        btn.titleLabel?.font = .boldSystemFont(ofSize: 22)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(updateAnnouncementButtonPressed), for: .touchUpInside)
        return btn
    }()
    var selectReceiverStackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = UIColor(named: "lightPurple")
        return stackView
    }()

    var selectReceiver : UILabel = {
        var lbl = UILabel()
        lbl.text = "Select Class"
        lbl.font = UIFont.boldSystemFont(ofSize: 23)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.layer.cornerRadius = 10
        lbl.layer.masksToBounds = true
        lbl.heightAnchor.constraint(equalToConstant: 45).isActive = true
        lbl.backgroundColor = UIColor(named: "mediumPurple")
        return lbl
    }()

    var announcementReceiverDropDownButton : UIButton = {
       let button = UIButton()
        button.setTitle(" Choose", for: .normal)
//        button.layer.borderWidth = 2
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "mediumPurple")
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let arrowImage = UIImage(systemName: "chevron.down")
            button.setImage(arrowImage, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
            button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didTapannouncementReceiverDropDownButton), for: .touchUpInside)
        return button
    }()
    private var activityIndicator: UIActivityIndicatorView = {
       var indicator = UIActivityIndicatorView()
        indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        return indicator
    }()

    var receiversList = ["Parents" , "Teachers" , "Everyone"]
    var announcementRecordID : Int!
    var announcementRowIndex : Int!
    
    let menu : DropDown = {
        let menu = DropDown()
        menu.backgroundColor = UIColor(named: "lightPurple")
        menu.textColor = .black
        menu.textFont = UIFont.boldSystemFont(ofSize: 16)
        return menu
    }()
    private var selectedReceiver : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Make Announcement"
        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
        configureUI()
    }
    private func configureUI(){
        
        menu.anchorView = announcementReceiverDropDownButton
        menu.width = 100
        menu.bottomOffset = CGPoint(x: 40, y: announcementReceiverDropDownButton.bounds.height+42)
        
        announcementDescription.delegate = self
        
        view.addSubview(backGroundView)
        backGroundView.addSubview(announcementTitle)
        backGroundView.addSubview(announcementDescBackView)
        announcementDescBackView.addSubview(announcementDescription)
        backGroundView.addSubview(selectReceiverStackView)

        selectReceiverStackView.addArrangedSubview(selectReceiver)
        selectReceiverStackView.addArrangedSubview(announcementReceiverDropDownButton)
        backGroundView.addSubview(updateAnnouncementButton)
        view.addSubview(activityIndicator)
        menu.dataSource = receiversList
        
        NSLayoutConstraint.activate([
            
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backGroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            backGroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
        
            announcementTitle.topAnchor.constraint(equalTo: backGroundView.topAnchor , constant: 30),
            announcementTitle.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor , constant: 20),
            announcementTitle.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -20),
            announcementTitle.heightAnchor.constraint(equalTo: backGroundView.heightAnchor, multiplier: 0.1),
            
            announcementDescBackView.topAnchor.constraint(equalTo: announcementTitle.bottomAnchor , constant: 20),
            announcementDescBackView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor , constant: 20),
            announcementDescBackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor , constant: -20),
            announcementDescBackView.heightAnchor.constraint(equalTo: backGroundView.heightAnchor, multiplier: 0.45),
            
            announcementDescription.topAnchor.constraint(equalTo: announcementDescBackView.topAnchor , constant: 10),
            announcementDescription.leadingAnchor.constraint(equalTo: announcementDescBackView.leadingAnchor , constant: 10),
            announcementDescription.trailingAnchor.constraint(equalTo: announcementDescBackView.trailingAnchor , constant: -10),
            announcementDescription.bottomAnchor.constraint(equalTo: announcementDescBackView.bottomAnchor , constant: -10),
            
            selectReceiverStackView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor , constant: 10),
            selectReceiverStackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -10),

            selectReceiverStackView.topAnchor.constraint(equalTo: announcementDescription.bottomAnchor , constant: 30),
            selectReceiverStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            updateAnnouncementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateAnnouncementButton.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor , constant: -20),
            updateAnnouncementButton.heightAnchor.constraint(equalTo: backGroundView.heightAnchor, multiplier: 0.1),
            updateAnnouncementButton.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 30),
            updateAnnouncementButton.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -30),
        ])
    }
    @objc private func didTapannouncementReceiverDropDownButton(){
        menu.show()
        menu.selectionAction = { [unowned self] (index: Int, item: String) in
                    // Handle the user's selection here
            announcementReceiverDropDownButton.setTitle(item, for: .normal)
                    print("User selected item \(item) at index \(index)")
            
            self.selectedReceiver = item
                }
    }
    @objc private func updateAnnouncementButtonPressed (){
        print(selectReceiver.text!)
        alertAnnouncementUpdatePermission()
    }
    func alertAnnouncementError(){
        let alert = UIAlertController(title: "Woops", message: "Please enter all information to log in", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    func alertAnnouncementUpdatePermission(){
        
        guard let title = announcementTitle.text , let description = announcementDescription.text , let sendTo = announcementReceiverDropDownButton.titleLabel?.text , !title.isEmpty , !description.isEmpty , !sendTo.isEmpty else {
            alertAnnouncementError()
            return
        }
        let alert = UIAlertController(title: "Update", message: "Are you sure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self]_ in
            guard let strongSelf = self else {
                return
            }
            var record = AnnouncementData(announcementId: strongSelf.announcementRecordID, title: title, description: description, announcementRole: sendTo)

            FirestoreManager.shared.updateAnnouncement( updatedData: record) { success in
                if success {
                    print("Reocrd Updated Successfully")
                    AnnouncementData.announcementList[strongSelf.announcementRowIndex] = record
                    strongSelf.navigationController?.popViewController(animated: true)
                }
            }
//            strongSelf.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: false)
    }
    
    func setAnnouncementFields( recordId : Int){
        announcementTitle.text = AnnouncementData.announcementList[recordId].announcementTitle
        announcementDescription.text = AnnouncementData.announcementList[recordId].announcementDescription
        announcementReceiverDropDownButton.setTitle(AnnouncementData.announcementList[recordId].announcementRole, for: .normal)
        announcementRecordID = AnnouncementData.announcementList[recordId].announcementId
        announcementRowIndex = recordId
    }
    
}
extension UpdateAnnouncementViewController: UITextViewDelegate {
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == "Your description text goes here..." {
//            textView.text = ""
//            textView.textColor = UIColor.black
//        }
//        print("Done")
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = "Your description text goes here..."
//            textView.textColor = UIColor.lightGray
//        }
//    }
}
