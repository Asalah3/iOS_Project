//
//  FavouriteViewController.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 25/05/2023.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var favouriteTableView: UITableView!
    @IBOutlet weak var noRecipesYetImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        noRecipesYetImage.isHidden = true
    }
    

}
extension FavouriteViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell") as! FavouriteTableViewCell
        cell.setUpCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
