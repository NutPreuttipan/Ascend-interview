//
//  BaseService.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 28/1/2564 BE.
//

import Foundation
import Alamofire
import EVReflection

class BaseService: NSObject {
    
    static func sendRawRequestWithArrayResponse<Resource:EVObject>(endPointURL:String, method:HTTPMethod, parameter:Parameters?, headers:HTTPHeaders?, responseType: Resource.Type, success: @escaping(([Resource]) -> Void), fail: @escaping ((NSError) -> Void) ) {
        AF.request(endPointURL,
                   method: method,
                   parameters: parameter,
                   encoding: JSONEncoding.default,
                   headers: headers).validate().responseString { (response: AFDataResponse<String>) in
                    
                    switch response.result {
                    case .success(let value):
                        let resourceList:[Resource]
                        let resource = type(of: resourceList).init(json: value)
                        success(resource)
                    case .failure(let error):
                        fail(error as NSError)
                    }
        }
    }
}
