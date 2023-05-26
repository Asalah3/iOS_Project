//
//  FavouriteViewController.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 25/05/2023.
//

import UIKit
import CoreData

class FavouriteViewController: UIViewController {

    var favouriteViewModel: FavouriteViewModel?
    var favouritesList : [NSManagedObject]?
    @IBOutlet weak var favouriteTableView: UITableView!
    @IBOutlet weak var noRecipesYetImage: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        favouriteViewModel = FavouriteViewModel()
        favouriteViewModel?.getFavouritesResult()
        favouritesList = favouriteViewModel?.Result
        if favouritesList?.count == 0{
            favouriteTableView.isHidden = true
            noRecipesYetImage.isHidden = false
        }else{
            favouriteTableView.isHidden = false
            noRecipesYetImage.isHidden = true
        }
        self.favouriteTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        noRecipesYetImage.isHidden = true
        
        
    }
    

}
extension FavouriteViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell") as? FavouriteTableViewCell
        cell?.setUpCell()
        cell?.layer.cornerRadius = 25
        let favouriteItem = favouritesList?[indexPath.row]
        cell?.ingredientName.text = favouriteItem?.value(forKey: "favouriteName") as? String
        cell?.chiefName.text = favouriteItem?.value(forKey: "favouriteMealCheif") as? String
        cell?.categoryName.text = favouriteItem?.value(forKey: "favouriteMealType") as? String
        cell?.numServings.text = favouriteItem?.value(forKey: "favouriteServings") as? String
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let favouriteItem = favouritesList?[indexPath.row]
        let favouriteName = favouriteItem?.value(forKey: "favouriteName") as! String
        if editingStyle == .delete {
            let alert : UIAlertController = UIAlertController(title: "Warnning", message: "Do You Want To Delete \(favouriteName)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler: { action in
                self.favouriteViewModel?.deleteFavouriteItem(favouriteItem: favouriteItem!)
                self.favouriteViewModel?.getFavouritesResult()
                self.favouritesList?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.favouriteTableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default , handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favouriteItem = favouritesList?[indexPath.row]
        let favouriteId = favouriteItem?.value(forKey: "favouriteId") as! Int
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
