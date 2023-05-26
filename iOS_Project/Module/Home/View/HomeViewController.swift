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
    let caterNames = ["Popular","Breakfast","Lunch","Dinner","Dessert"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food Recipies"
        

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
        
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        caterNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CategoryCollectionViewCell
        
        cell.catergoryName.text = caterNames[indexPath.row]
        cell.catergoryImage.image = UIImage(named: caterNames[indexPath.row])
    
        return cell
    }
    
    

}
