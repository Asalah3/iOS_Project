//
//  LocalDataSource.swift
//  iOS_Project
//
//  Created by Asalah Sayed on 25/05/2023.
//

import Foundation
import UIKit
import CoreData
class FavouriteItems{
    var context : NSManagedObjectContext?
    var entity : NSEntityDescription?
    static var favouriteItems = FavouriteItems()
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "FavouriteItem", in: context!)
    }
    
    
    func InsertItem(favouriteName : String , favouriteId : Int , favouriteImage : String, favouriteMealCheif: String ,favouriteMealType: String,favouriteServings: String){
        let newItem = NSManagedObject(entity: entity ?? NSEntityDescription(), insertInto: context)
        newItem.setValue(favouriteId, forKey: "favouriteId")
        newItem.setValue(favouriteName, forKey: "favouriteName")
        newItem.setValue(favouriteImage, forKey: "favouriteImage")
        newItem.setValue(favouriteMealCheif, forKey: "favouriteMealCheif")
        newItem.setValue(favouriteMealType, forKey: "favouriteMealType")
        newItem.setValue(favouriteServings, forKey: "favouriteServings")
        do {
            try context?.save()
         } catch {
          print("Error saving")
        }
    }
    
    func deleteItem(favouriteItem : NSManagedObject){
        do {
            context?.delete(favouriteItem)
            try context?.save()
        } catch {
            print("Failed")
            
        }
    }
    func deleteItemById(favouriteId : Int){
        var favouriteItem : NSManagedObject?
        var favouritesList : [NSManagedObject]?
        favouritesList = FavouriteItems.favouriteItems.fetchFavouriteItems()
        favouritesList?.forEach{ data in
            let favId = data.value(forKey: "favouriteId") as? Int
            if favId == favouriteId{
                favouriteItem = data
                do {
                    context?.delete(favouriteItem ?? NSManagedObject())
                    try context?.save()
                } catch {
                    print("Failed")
                    
                }
            }
        }
        
    }
    
    func fetchFavouriteItems() -> [NSManagedObject]{
        var favouritesList : [NSManagedObject]?
        favouritesList = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteItem")
        request.returnsObjectsAsFaults = false
        do {
            if let result = try context?.fetch(request) as? [NSManagedObject]{
                for data in result{
                    favouritesList?.append(data)
                }
            }
            
        } catch {
            print("Failed")
        }
        return favouritesList ?? []
    }
    
    func checkIfInserted(favouriteId : Int) -> Bool {
        var result = false
        var favouritesList : [NSManagedObject]?
        favouritesList = FavouriteItems.favouriteItems.fetchFavouriteItems()
        favouritesList?.forEach{ data in
            let favId = data.value(forKey: "favouriteId") as? Int
            if favId == favouriteId{
                result =  true
            }
        }
        return result
    }
    
}
