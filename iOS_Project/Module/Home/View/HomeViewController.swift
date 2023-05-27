//
//  HomeViewController.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 25/05/2023.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate,UITableViewDataSource, UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var catergoryMeals: UITableView!
    let categoryNames = ["Popular","Breakfast","Lunch","Dinner","Dessert"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food Recipies"
//        NetworkServices.fetchHomeCategoriesData(tag: "breakfast"){ (result) in
//
//        }

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as? FavouriteTableViewCell
        
        cell?.layer.cornerRadius = 25

        return cell ?? UITableViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? CategoryCollectionViewCell
        
        cell?.setUpCell()
        cell?.catergoryName.text = categoryNames[indexPath.row]
        cell?.catergoryImage.image = UIImage(named: categoryNames[indexPath.row])

        return cell ?? UICollectionViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

}
