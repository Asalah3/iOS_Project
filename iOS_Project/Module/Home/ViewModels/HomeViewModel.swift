//
//  HomeViewModel.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//

import Foundation

protocol HomeViewModelProtocol{
    func fetchHomeData(tag :String)
}


class HomeViewModel :HomeViewModelProtocol {
    var remote :NetworkServices = NetworkServices()
    
    init( remoteDataSource: NetworkServices){
       
       remote = remoteDataSource
    }
    
    var fetchCategoriesDataToHomeViewController : (()->())={}
    
    var fetchHomeData:Categories!{
        didSet{
            fetchCategoriesDataToHomeViewController()
        }
    }
    
    func fetchHomeData(tag :String){
        remote.fetchHomeCategoriesData(tag:tag) { res in
            guard let result = res else {return}
            self.fetchHomeData = result
            
            
        }
    }
}
    
