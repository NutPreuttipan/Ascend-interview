//
//  ProductModel.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 28/1/2564 BE.
//

import Foundation
import EVReflection

class ProductResponseModel: EVObject {
    var id:Int = 0
    var title:String = "-"
    var image:String = ""
    var content:String = "-"
    var isNewProduct:Bool = false
    var price:Double = 0
}
