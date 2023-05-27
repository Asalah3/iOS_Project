//
//  HomeViewModel.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//

import Foundation
class HomeViewModel{
    
    var fetchCategoriesDataToHomeViewController : (()->())={}
    
    var fetchHomeData:Categories!{
        didSet{
            fetchCategoriesDataToHomeViewController()
        }
    }
    
    func fetchHomeData(tag :String){
        NetworkServices.fetchHomeCategoriesData(tag:tag) { res in
            guard let result = res else {return}
            self.fetchHomeData = result
            
            
        }
    }
}
    
