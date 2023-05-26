//
//  FavouriteViewModel.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 26/05/2023.
//

import Foundation
import CoreData
class FavouriteViewModel{
    var Result : [NSManagedObject] = []
    func getFavouritesResult(){
        self.Result = FavouriteItems.favouriteItems.fetchFavouriteItems()
    }
    func deleteFavouriteItem(favouriteItem : NSManagedObject){
        FavouriteItems.favouriteItems.deleteItem(favouriteItem: favouriteItem)
    }
    func deleteItemById(favouriteId : Int){
        FavouriteItems.favouriteItems.deleteItemById(favouriteId: favouriteId)
    }
    func isExist(favouriteId : Int) -> Bool{
        return FavouriteItems.favouriteItems.checkIfInserted(favouriteId: favouriteId)
    }
}
