//
//  NetWorkServices.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//

import Foundation
protocol NetworkServicesProtocol {
    static func fetchHomeCategoriesData(tag: String,compilitionHandler : @escaping (Categories?)-> Void)
    
}
class NetworkServices : NetworkServicesProtocol{
    static func fetchHomeCategoriesData(tag: String, compilitionHandler: @escaping (Categories?) -> Void) {
        let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=\(tag)")
    
        
        guard let newUrl = url else {
            return
        }
        var request = URLRequest(url: newUrl)
        request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                       "X-RapidAPI-Key":"d67902112amshdb94118d744b893p18293bjsn4d056e614259"]

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                     print(data)
                let result = try JSONDecoder().decode(Categories.self, from: data ?? Data())
                compilitionHandler(result)
                print("sucsses ")
                print("result \(result.results?.first?.name)")
            } catch let error{
                print(error)
                compilitionHandler(nil)
                print("fail ")
            }
            
        }
        task.resume()
        
    }
    
    
}
