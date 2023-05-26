//
//  Utilities.swift
//  iOS_Project
//
//  Created by Soha Ahmed Hamdy on 26/05/2023.
//

import Foundation
import SystemConfiguration
import UIKit

class Utilities{
    
    static func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
    static func displayAlert(title : String , message: String , action : [UIAlertAction] , controller :UIViewController){
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for act in action{
            alert.addAction(act)
        }
        controller.present(alert, animated: true,completion: nil)
    }
    
    /*to make alert use this
     
     let confirmAction = UIAlertAction(title: "Save", style: .default){ action in
         self.insertItemToFavourites()
     }
     MakeAlert.displayAlert(title: "Saving!!", message: "Do you want to save this Team to favourite?", action: confirmAction, controller: self)
     
     */
}
