//
//  AddQuizPortailViewController.swift
//  LinkUp
//
//  Created by Hamza Malik on 12/06/2023.
//

import Foundation
import UIKit


class AddQuizPortailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    


    var backGroundContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "darkPurple")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var Top_Headings_Lables_StackView : UIStackView = {
        let obj = UIStackView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.axis = .horizontal
        obj.distribution = .fillEqually
//        obj.alignment = .fill
        obj.backgroundColor = .white
//        obj.spacing = 130
        return obj
    }()
    
    var lbl_QuizNo : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quiz "
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    var lbl_QuizSubject : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subject"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    var lbl_QuizObtainMarks : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Obtain Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 11.0)
        return lbl
    }()
    var lbl_QuizTotalMarks : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Marks"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 12.0)
        return lbl
    }()
    var lbl_QuizDate : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Date"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 13.0)
        return lbl
    }()
    
    
    
    var QuizMarksTableBackView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
        let nameLabel: UILabel = {
    
            let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            lbl.translatesAutoresizingMaskIntoConstraints = false
    //        lbl.center = CGPoint(x: view.center.x, y: view.center.y + 100)
            lbl.textAlignment = .center
            lbl.isHidden = true
            return lbl
        }()
    
    
    
    
    
    
    
    
   
    
    var Quiz_name = ""
    var Subject_marks = ""
    var Quizdate = ""
    var QuizTotalmarks = ""
    
    let tableView = UITableView()
        var numberOfRows = 1

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tablea.dequeueReusableCell(withIdentifier: QuizMarksTableViewCell.identifier, for: indexPath) as? QuizMarksTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(text: Quiz_name ,subject: Subject_marks ,obtainmarks: "8", TotalMarks: QuizTotalmarks, date: Quizdate)
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
        // MARK: - Actions
    
        @objc func addRow() {
            numberOfRows += 1
            let indexPath = IndexPath(row: numberOfRows - 1, section: 0)
            tablea.insertRows(at: [indexPath], with: .automatic)
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                // Perform action when a row is selected
                let vc = UploadQuizMarksViewController()
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc, animated: true)
    
            }
    
    
    
    private let tablea: UITableView = {
        
        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.register(QuizMarksTableViewCell.self, forCellReuseIdentifier: QuizMarksTableViewCell.identifier)
        return tab
        
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quiz Report"
        configureUI()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        Quizdate = dateString
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tablea.dataSource = self
        tablea.delegate = self
        tablea.frame = view.bounds
    }

    private func configureUI(){
        

        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "darkPurple")
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAlert))
               navigationItem.rightBarButtonItem = addButton
        
        view.addSubview(backGroundContainerView)
        backGroundContainerView.addSubview(Top_Headings_Lables_StackView)
        
        Top_Headings_Lables_StackView.addArrangedSubview(lbl_QuizNo)
        Top_Headings_Lables_StackView.addArrangedSubview(lbl_QuizSubject)
//        Top_Headings_Lables_StackView.addArrangedSubview(lbl_QuizObtainMarks)
        Top_Headings_Lables_StackView.addArrangedSubview(lbl_QuizTotalMarks)
        Top_Headings_Lables_StackView.addArrangedSubview(lbl_QuizDate)
        
        
        backGroundContainerView.addSubview(QuizMarksTableBackView)
        QuizMarksTableBackView.addSubview(tablea)

        
        NSLayoutConstraint.activate([
            
            
            backGroundContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backGroundContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backGroundContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backGroundContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            Top_Headings_Lables_StackView.topAnchor.constraint(equalTo: backGroundContainerView.topAnchor),
            Top_Headings_Lables_StackView.trailingAnchor.constraint(equalTo: backGroundContainerView.trailingAnchor),
            Top_Headings_Lables_StackView.leadingAnchor.constraint(equalTo: backGroundContainerView.leadingAnchor),
            Top_Headings_Lables_StackView.heightAnchor.constraint(equalTo: backGroundContainerView.heightAnchor, multiplier: 0.05),
            
            QuizMarksTableBackView.topAnchor.constraint(equalTo: Top_Headings_Lables_StackView.bottomAnchor),
            QuizMarksTableBackView.leadingAnchor.constraint(equalTo: backGroundContainerView.leadingAnchor),
            QuizMarksTableBackView.trailingAnchor.constraint(equalTo: backGroundContainerView.trailingAnchor),
            QuizMarksTableBackView.bottomAnchor.constraint(equalTo: backGroundContainerView.bottomAnchor),
            
        ])
    }
    
    
    
//    Functions

    @objc func showAlert() {
        let alertController = UIAlertController(title: "Enter Quiz Details", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Quiz No"
            
        }
        alertController.addTextField { textField in
            textField.placeholder = "Subject Name"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Total Marks"
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] _ in
            if let name = alertController.textFields?.first?.text {
                self.nameLabel.text = name
                self.nameLabel.isHidden = false

            }
            if let name = alertController.textFields?.first?.text {
                self.nameLabel.text = name
                self.nameLabel.isHidden = false

            }
            
            var enteredNames = [String]()
            for textField in alertController.textFields ?? [] {
                          if let name = textField.text, !name.isEmpty {
                              enteredNames.append(name)
                          }
                      }
                      
            if !enteredNames.isEmpty {
                Quiz_name = enteredNames[0]
                Subject_marks = enteredNames[1]
                QuizTotalmarks = enteredNames[2]
                addRow()
                      } else {
                          print("No names entered.")
                      }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
    
    

}
