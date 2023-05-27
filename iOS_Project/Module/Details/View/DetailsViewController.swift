//
//  DetailsViewController.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 25/05/2023.
//

import UIKit

class DetailsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var instructionTableView: UITableView!
    @IBOutlet weak var simpleResipes: UICollectionView!
    @IBOutlet weak var IngrediantTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == IngrediantTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngrediantCell", for: indexPath) as! IngrediantTableViewCell
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionCell", for: indexPath) as! InstructionTableViewCell
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarRecipes", for: indexPath) as! SimpleRecipesCollectionViewCell
    
       return cell
    }
    

    @IBOutlet weak var RecipeName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func favoriteRecipe(_ sender: Any) {
    }
    
    @IBAction func videoPlayer(_ sender: Any) {
    }


}
