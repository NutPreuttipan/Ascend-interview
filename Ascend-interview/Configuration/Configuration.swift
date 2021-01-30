//
//  Configuration.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 30/1/2564 BE.
//

import Foundation

class Configuration {
    static let apiURL:String = "https://ecommerce-product-app.herokuapp.com"
    
    struct product {
        static let getProduct:String = Configuration.apiURL + "/products"
    }
}
