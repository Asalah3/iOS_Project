//
//  HomeViewModel.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//

import Foundation

protocol HomeViewModelProtocol{
    var localDataSource: LocalDataSourceProtocol { get }
    func fetchHomeData(tag :String)
}


class HomeViewModel :HomeViewModelProtocol {
 
    var remote :NetworkServices?
    var localDataSource: LocalDataSourceProtocol
    
    init( remoteDataSource: NetworkServices, localDataSource: LocalDataSourceProtocol) {
        self.remote = remoteDataSource
        self.localDataSource = localDataSource
        
    }
    
    var fetchCategoriesDataToHomeViewController : (()->())={}
    
    var fetchHomeData:Categories!{
        didSet{
            fetchCategoriesDataToHomeViewController()
        }
    }
    
    func fetchHomeData(tag :String){
        remote?.fetchHomeCategoriesData(tag:tag) { res in
            guard let result = res else {return}
            self.fetchHomeData = result
            
            
        }
    }
    
}
    
