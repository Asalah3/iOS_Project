//
//  FavouriteViewModel.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 26/05/2023.
//

import Foundation
import CoreData
class FavouriteViewModel : FavouriteViewModelProtocol{
    var localDataSource:FavouriteProtocol?
    init(localDataSource: FavouriteProtocol) {
        self.localDataSource = localDataSource
    }
    func getFavouritesResult() -> [NSManagedObject]{
        return localDataSource?.fetchFavouriteItems() ?? []
    }
    func deleteFavouriteItem(favouriteItem : NSManagedObject){
        localDataSource?.deleteItem(favouriteItem: favouriteItem)
    }
    func deleteItemById(favouriteId : Int){
        localDataSource?.deleteItemById(favouriteId: favouriteId)
    }
    func isExist(favouriteId : Int) -> Bool{
        return localDataSource?.checkIfInserted(favouriteId: favouriteId) ?? false
    }
}
protocol FavouriteViewModelProtocol{
    func getFavouritesResult() -> [NSManagedObject]
    func deleteFavouriteItem(favouriteItem : NSManagedObject)
    func deleteItemById(favouriteId : Int)
    func isExist(favouriteId : Int) -> Bool
}
