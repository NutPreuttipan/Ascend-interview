//
//  ProductProtocol.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 28/1/2564 BE.
//

import Foundation

protocol ProductProtocol: class {
    func didFinishFetchProduct()
    func didFailedFetchProduct(message:String)
}
