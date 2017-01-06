//
//  Teacher.swift
//  Colmeia
//
//  Created by André Marques da Silva Rodrigues on 04/01/17.
//  Copyright © 2017 Vergil. All rights reserved.
//

import UIKit

class Teacher: NSObject {
    
    var objectId: String
    var name: String
    var photo: NSData?
    var resume: String
    var subject: String
    var rating: Double
    
    init(objectId: String,
         name: String,
         resume: String,
         subject: String,
         rating: Double) {
        
        self.objectId = objectId
        self.name = name
        self.resume = resume
        self.subject = subject
        self.rating = rating
        
        super.init()
    }
    
}
