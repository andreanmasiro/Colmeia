//
//  ViewController.swift
//  Colmeia
//
//  Created by André Marques da Silva Rodrigues on 04/01/17.
//  Copyright © 2017 Vergil. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var teacherTableView: UITableView!
    static let teacherTableViewCellHeight: CGFloat = 101.0
    
    var teachers: [Teacher] = []
    var filteredTeachers: [Teacher] = []
    
    var resumeAlert: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        requestTeachers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidHide), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }

    private func requestTeachers() {
        
        Requester.request("Professores") { (objects, error) in
            
            if error == nil {
                
                if let objects = objects {
                    
                    self.teachers = self.getTeachers(from: objects)
                    self.filteredTeachers = self.teachers
                }
            }
        }
    }
    
    private func getTeachers(from pfObjects: [PFObject]) -> [Teacher] {
        
        let teachers = pfObjects.flatMap {
            Teacher(pfObject: $0) { teacher in
                self.teacherUpdatedPhoto(teacher)
            }
        }
        
        return teachers
    }
    
    private func teacherUpdatedPhoto(_ teacher: Teacher) {
        teacherTableView.reloadData()
    }
    
    func makeResumeAlertController() {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(dismissAction)
        
        resumeAlert = alert
    }
    
    func showResume(_ teacher: Teacher) {
        
        var alert: UIAlertController!
        if let _alert = resumeAlert {
            alert = _alert
        } else {
            makeResumeAlertController()
            alert = resumeAlert
        }
        
        alert.title = teacher.name
        alert.message = teacher.resume
        
        present(alert, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTeachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "teacherCell", for: indexPath) as? TeacherTableViewCell {
            
            let teacher = filteredTeachers[indexPath.row]
            
            cell.setName(teacher.name)
            cell.setRating(teacher.rating)
            cell.setSubject(teacher.subject)
            
            if let data = teacher.photo {
                if let photo = UIImage(data: data) {
                    cell.setPhoto(photo)
                }
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ViewController.teacherTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teacher = filteredTeachers[indexPath.row]
        showResume(teacher)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        filterTeachers(for: searchController.searchBar.text!)
        teacherTableView.reloadData()
    }
    
    func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        teacherTableView.tableHeaderView = searchController.searchBar
    }
    
    private func filterTeachers(for searchText: String) {
        filteredTeachers = teachers.filter {
            $0.name.lowercased().hasPrefix(searchText.lowercased())
        }
    }
}

extension ViewController /* polishing */ {
    
    func keyboardDidShow(notification: NSNotification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
        
        let contentInsets: UIEdgeInsets
        contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        teacherTableView.contentInset = contentInsets
        teacherTableView.scrollIndicatorInsets = contentInsets
    }
    
    func keyboardDidHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.25) {
            self.teacherTableView.contentInset = UIEdgeInsets.zero
            self.teacherTableView.scrollIndicatorInsets = UIEdgeInsets.zero
        }
    }
}

