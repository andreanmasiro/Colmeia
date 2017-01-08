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
    
    @IBOutlet weak var ratingImageView1: UIImageView!
    @IBOutlet weak var ratingImageView2: UIImageView!
    @IBOutlet weak var ratingImageView3: UIImageView!
    @IBOutlet weak var ratingImageView4: UIImageView!
    @IBOutlet weak var ratingImageView5: UIImageView!
    
    private let fillImage = #imageLiteral(resourceName: "fill").withRenderingMode(.alwaysTemplate)
    private let halfFillImage = #imageLiteral(resourceName: "half_fill").withRenderingMode(.alwaysTemplate)
    private let outlineImage = #imageLiteral(resourceName: "outline").withRenderingMode(.alwaysTemplate)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpRatingImageViews()
        setUpRatingLabel()
    }
    
    func setUpRatingLabel() {
        ratingLabel.layer.borderColor = UIColor.black.cgColor
        ratingLabel.layer.borderWidth = 1
        ratingLabel.layer.cornerRadius = ratingLabel.frame.height/5
    }
    
    func setUpRatingImageViews() {
        for imageView in ratingImagesArray {
            imageView.tintColor = UIColor(colorLiteralRed: 255/255, green: 166/255, blue: 35/255, alpha: 1.0)
        }
    }

    func setName(_ name: String) {
        nameLabel.text = name
    }
    
    func setSubject(_ subject: String) {
        subjectLabel.text = subject
    }
    
    func setRating(_ rating: Double) {
        ratingLabel.text = String(format: "%.2lf", rating)
        updateRatingImages(rating)
    }
    
    func updateRatingImages(_ rating: Double) {
        let fillCount = Int(rating)
        let hasHalfFill = (rating - Double(Int(rating))) >= 0.5
        let lineCount = 5 - fillCount - (hasHalfFill ? 1 : 0)
        
        var index = 0
        for _ in 0..<fillCount {
            ratingImagesArray[index].image = fillImage
            index += 1
        }
        
        if hasHalfFill {
            ratingImagesArray[index].image = halfFillImage
            index += 1
        }
        
        for _ in 0..<lineCount {
            ratingImagesArray[index].image = outlineImage
            index += 1
        }
    }
    
    var ratingImagesArray: [UIImageView] {
        return [ratingImageView1, ratingImageView2, ratingImageView3, ratingImageView4, ratingImageView5]
    }
    
    func setPhoto(_ photo: UIImage) {
        photoImageView.image = photo
        photoImageView.setRound()
    }

}
