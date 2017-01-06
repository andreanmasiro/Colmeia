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

    var teachers: [Teacher] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestTeachers()
    }

    private func requestTeachers() {
        
        Requester.request("Professores") { (objects, error) in
            
            if error == nil {
                
                if let objects = objects {
                    
                    self.teachers = self.getTeachers(from: objects)
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
        //update table view
    }

}


