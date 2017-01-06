//
//  TeacherTableViewCell.swift
//  Colmeia
//
//  Created by André Marques da Silva Rodrigues on 06/01/17.
//  Copyright © 2017 Vergil. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setName(_ name: String) {
        nameLabel.text = name
    }
    
    func setSubject(_ subject: String) {
        subjectLabel.text = subject
    }
    
    func setRating(_ rating: Double) {
        ratingLabel.text = String(format: "%.2lf", rating)
    }
    
    func setImage(_ image: UIImage) {
        photoImageView.image = image
    }

}
