//
//  FavouriteTableViewCell.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 25/05/2023.
//

import UIKit
import CoreData

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favButtonColor: UIButton!
    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var numServings: UILabel!
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var chiefName: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var grediantView: UIView!
    var favObjects : [NSManagedObject]? = []
    var id : Int = 0
    var favObject : Result?
    var homeViewModel: HomeViewModelProtocol?
//    var favouriteViewModel: FavouriteViewModelProtocol?

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setVieModel(homeViewModel: HomeViewModelProtocol) {
        self.homeViewModel = homeViewModel
        
    }
//    func setFavouriteVieWModel(favouriteViewModel: FavouriteViewModelProtocol) {
//        self.favouriteViewModel = favouriteViewModel
//
//    }
    
    func SetCellValues(catergory: Result){
        favObject = catergory
        if let favID = favObject?.id,
            let homeViewModel = homeViewModel, homeViewModel.localDataSource.checkIfInserted(favouriteId:favID){
            favButtonColor.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favButtonColor.setImage(UIImage(systemName: "heart"), for: .normal)
            
        }
        var categoryImage : String = ""
        if (catergory.inspiredByURL) != nil{
            categoryImage = (catergory.inspiredByURL)!
        }else{
            categoryImage = ""
        }
        ingredientImage.sd_setImage(with: URL(string: categoryImage), placeholderImage: UIImage(named: ""))
        chiefName.text = catergory.slug
        ingredientName.text = catergory.name
        categoryName.text = catergory.description
        numServings.text = String(catergory.numServings ?? 0)
        layer.cornerRadius = 25

    }
    func SetCellValuesForFavourite(favouriteItem: NSManagedObject){
        if let favID = favouriteItem.value(forKey: "favouriteId") as? Int,
           let favouriteViewModel = homeViewModel, ((homeViewModel?.localDataSource.checkIfInserted(favouriteId:favID)) != nil){
            favButtonColor.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favButtonColor.tintColor = UIColor.white
        }
        let image : String = favouriteItem.value(forKey: "favouriteImage") as? String ?? ""
        ingredientImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: ""))
        ingredientName.text = favouriteItem.value(forKey: "favouriteName") as? String
        ingredientName.text = favouriteItem.value(forKey: "favouriteId") as? String
        chiefName.text = favouriteItem.value(forKey: "favouriteMealCheif") as? String
        categoryName.text = favouriteItem.value(forKey: "favouriteMealType") as? String
        numServings.text = favouriteItem.value(forKey: "favouriteServings") as? String
        layer.cornerRadius = 25
    }
    
    func setUpCell(){
        ingredientView.layer.cornerRadius = 25
        grediantView.layer.cornerRadius = 25
        ingredientImage.layer.cornerRadius = 25
    }

    @IBAction func addFavouriteButton(_ sender: UIButton) {
        if let homeViewModel = homeViewModel,
           homeViewModel.localDataSource.checkIfInserted(favouriteId: favObject?.id ?? 0){
            favButtonColor.tintColor = UIColor.white
            homeViewModel.localDataSource.deleteItemById(favouriteId: favObject?.id ?? 0)
        } else {
            favButtonColor.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            homeViewModel?.localDataSource.InsertItem(favouriteName: favObject?.name ?? "", favouriteId: favObject?.id ?? 0, favouriteImage: favObject?.thumbnailURL ?? "", favouriteMealCheif: favObject?.description ?? "", favouriteMealType: favObject?.slug ?? "", favouriteServings: String(favObject?.numServings ?? 0))
        }
        homeViewModel?.fetchHomeData(tag: "lunch")
    }
}
