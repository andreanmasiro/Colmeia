//
//  Requester.swift
//  Colmeia
//
//  Created by André Marques da Silva Rodrigues on 04/01/17.
//  Copyright © 2017 Vergil. All rights reserved.
//

import Parse

class Requester: NSObject {
    
    class func request(with className: String, _ completion: (([PFObject]?, Error?) -> ())?) {
        
        let query = PFQuery(className: className)
        
        query.findObjectsInBackground { (objects, error) in
            
            if let _ = error {
                
                completion?(nil, error!)
            } else if let objects = objects {
                
                completion?(objects, nil)
            }
        }
    }
    
}
