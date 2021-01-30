//
//  ProductViewModel.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 28/1/2564 BE.
//

import Foundation

class ProductViewModel:NSObject {
    
    weak var delegate:ProductProtocol?
    var productListResponseData:[ProductResponseModel] = [ProductResponseModel]()
    var productResponseDate:ProductResponseModel = ProductResponseModel()
    
    func fetchAllProduct() {
        BaseService.sendRawRequestWithArrayResponse(endPointURL: Configuration.product.getProduct, method: .get, parameter: nil, headers: nil, responseType: ProductResponseModel.self) { [weak self] (response) in
            self?.productListResponseData = response
            self?.delegate?.didFinishFetchProduct()
        } fail: { [weak self] (error) in
            self?.delegate?.didFailedFetchProduct(message: error.localizedDescription)
        }
    }
}
