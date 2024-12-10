//
//  URLs.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//

import Alamofire

struct URLs {
    
    // MARK: - Main URL
    static var Main =  "https://fakestoreapi.com"
    static let product = Main +  "/products"
    
    let  heder : HTTPHeaders  = [ "Accept": "application/json","Accept-Language" :
                                    "en"]
}
