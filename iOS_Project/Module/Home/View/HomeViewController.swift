//
//  HomeViewController.swift
//  iOS_Project
//
//  Created by Soha Ahmed Hamdy on 25/05/2023.
//

import UIKit
import SDWebImage
import CoreData

class HomeViewController: UIViewController , UITableViewDelegate,UITableViewDataSource, UICollectionViewDelegate,UICollectionViewDataSource{
    
    var selectedCategory = "Popular"
    var networkService: NetworkServices?
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)

    
    var categoryMealsList : Categories?
    var homeViewModel : HomeViewModel?
    
    @IBOutlet weak var noResultLabel: UILabel!
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var catergoryMeals: UITableView!
    let categoryNames = ["Popular","Breakfast","Lunch","Dinner","Dessert"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
                activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        self.title = "Food Recipies"
        self.categoryMealsList = self.homeViewModel?.fetchHomeData
        networkService = NetworkServices()
        homeViewModel = HomeViewModel(remoteDataSource: networkService ?? NetworkServices(), localDataSource: LocalDataSource())
        homeViewModel?.fetchHomeData(tag: "middle_eastern")
        homeViewModel?.fetchCategoriesDataToHomeViewController = {() in self.renderView()}
        catergoryMeals.reloadData()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        catergoryMeals.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryMealsList?.results?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as? FavouriteTableViewCell
        if let homeViewModel = homeViewModel {
            cell?.setVieModel(homeViewModel: homeViewModel)
            
        }
        cell?.SetCellValues(catergory: (categoryMealsList?.results?[indexPath.row])!)

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categoryNames[indexPath.row]
        fetchingData()
        catergoryMeals.reloadData()
        categoryCollection.reloadData()
        
        
        
        print("selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? CategoryCollectionViewCell
        
        cell?.setUpCell()
        cell?.catergoryName.text = categoryNames[indexPath.row]
        cell?.catergoryImage.image = UIImage(named: categoryNames[indexPath.row])
        cell?.catergoryImage.layer.cornerRadius = 15
        cell?.layer.cornerRadius = 15

        changeCellBackground(cell: cell!)
        return cell ?? UICollectionViewCell()
    }
    
    func changeCellBackground(cell : CategoryCollectionViewCell){
        
        if selectedCategory == cell.catergoryName.text{
            cell.catergoryImage.backgroundColor = UIColor.orange
        }else{
            cell.catergoryImage.backgroundColor = UIColor.white
        }
    }
    
    func fetchingData(){
        switch selectedCategory{
            case "Popular":
                homeViewModel?.fetchHomeData(tag: "middle_eastern")
                homeViewModel?.fetchCategoriesDataToHomeViewController = {() in self.renderView()}

            case "Breakfast":
                homeViewModel?.fetchHomeData(tag: "breakfast")
                homeViewModel?.fetchCategoriesDataToHomeViewController = {() in self.renderView()}

            case "Lunch":
                homeViewModel?.fetchHomeData(tag: "lunch")
                homeViewModel?.fetchCategoriesDataToHomeViewController = {() in self.renderView()}

            case "Dinner":
                homeViewModel?.fetchHomeData(tag: "dinner")
                homeViewModel?.fetchCategoriesDataToHomeViewController = {() in self.renderView()}

            case "Dessert":
                homeViewModel?.fetchHomeData(tag: "desserts")
                homeViewModel?.fetchCategoriesDataToHomeViewController = {() in self.renderView()}

            default:
                homeViewModel?.fetchHomeData(tag: "middle_eastern")
                homeViewModel?.fetchCategoriesDataToHomeViewController = {() in self.renderView()}


            
        }
    }
    
    
    func renderView(){
        DispatchQueue.main.async {
            self.categoryMealsList = self.homeViewModel?.fetchHomeData
            if self.categoryMealsList?.results?.count == 0 || self.categoryMealsList?.results == nil{
                self.noResultLabel.text = "No Result"
            }else{
                self.noResultLabel.text = ""

            }
            self.catergoryMeals.reloadData()
            self.categoryCollection.reloadData()
            self.activityIndicator.stopAnimating()

        }
    }
    
    
    

    
}
