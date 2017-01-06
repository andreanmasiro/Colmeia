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
    var photo: Data?
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

import Parse

extension Teacher /* PFObject parsing */ {
    
    convenience init?(pfObject: PFObject, photoUpdateCompletionClosure: ((Teacher) -> Void)?)  {
        
        let objectId = pfObject.objectId
        let name = pfObject["nome"] as? String
        let photo = pfObject["imagem"] as? PFFile
        let resume = pfObject["curriculo"] as? String
        let subject = pfObject["materia"] as? String
        let rating = pfObject["nota"] as? Double
        
        if ![objectId, name, photo, resume, subject, rating].noneNil() {
            
            return nil
        } else {

            self.init(objectId: objectId!,
                      name: name!,
                      resume: resume!,
                      subject: subject!,
                      rating: rating!)
            
            photo?.getDataInBackground { (data, error) in
                
                if let data = data {
                    self.photo = data
                }
                
                photoUpdateCompletionClosure?(self)
            }
        }
    }
}
