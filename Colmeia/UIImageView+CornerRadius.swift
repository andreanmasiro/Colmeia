//
//  UIImageView+CornerRadius.swift
//  Colmeia
//
//  Created by André Marques da Silva Rodrigues on 06/01/17.
//  Copyright © 2017 Vergil. All rights reserved.
//

import UIKit

extension UIImageView /* CornerRadius */ {
    
    func setCornerRadius(_ cornerRadius: CGFloat) {
        
        if !self.layer.masksToBounds {
            self.layer.masksToBounds = true
        }
        self.layer.cornerRadius = cornerRadius
    }
    
    func setRound() {
        let radius = min(frame.height, frame.width)/2
        setCornerRadius(radius)
    }
}
