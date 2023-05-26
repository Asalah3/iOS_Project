//
//  CategoryCollectionViewCell.swift
//  iOS_Project
//
//  Created by Soha Ahmed Hamdy on 26/05/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBackground: UIView!
    @IBOutlet weak var catergoryName: UILabel!
    @IBOutlet weak var catergoryImage: UIImageView!
    
    func setUpCell(){
        imageBackground.layer.cornerRadius = 25
        
        
    }
}
