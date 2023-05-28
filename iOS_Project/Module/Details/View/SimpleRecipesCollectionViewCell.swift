//
//  SimpleRecipesCollectionViewCell.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//

import UIKit

class SimpleRecipesCollectionViewCell: UICollectionViewCell {
    @IBAction func FavoiteButton(_ sender: Any) {
    }
    
    @IBOutlet weak var serving: UILabel!
    @IBOutlet weak var typeOfFood: UILabel!
    @IBOutlet weak var chifeName: UILabel!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var favoriteRecipe: UIButton!
}
