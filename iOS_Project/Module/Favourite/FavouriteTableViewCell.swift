//
//  FavouriteTableViewCell.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 25/05/2023.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var numServings: UILabel!
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var chiefName: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var grediantView: UIView!
    var id : Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(){
        ingredientView.layer.cornerRadius = 25
        grediantView.layer.cornerRadius = 25
        ingredientImage.layer.cornerRadius = 25
    }

    @IBAction func addFavouriteButton(_ sender: UIButton) {
//        FavouriteItems.favouriteItems.checkIfInserted(favouriteId: id)
    }
    
 
}
