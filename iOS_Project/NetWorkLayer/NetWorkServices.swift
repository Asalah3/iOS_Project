//
//  NetWorkServices.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//

import Foundation
protocol NetworkServicesProtocol {
    static func fetchHomeData(tag: String,compilitionHandler : @escaping (Response?)-> Void)
    
}
class NetworkServices : NetworkServicesProtocol{
    static func fetchHomeData(tag: String, compilitionHandler: @escaping (Response?) -> Void) {
        let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=breakfast")
        //&X-RapidAPI-Key=d67902112amshdb94118d744b893p18293bjsn4d056e614259
        
        guard let newUrl = url else {
            return
        }
        var request = URLRequest(url: newUrl)
        request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                       "X-RapidAPI-Key":"d67902112amshdb94118d744b893p18293bjsn4d056e614259"]
//        request.setValue("X-RapidAPI-Host", forHTTPHeaderField: "tasty.p.rapidapi.com")
//        request.setValue("X-RapidAPI-Key", forHTTPHeaderField: "d67902112amshdb94118d744b893p18293bjsn4d056e614259")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                     print(data)
                let result = try JSONDecoder().decode(Response.self, from: data!)
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
