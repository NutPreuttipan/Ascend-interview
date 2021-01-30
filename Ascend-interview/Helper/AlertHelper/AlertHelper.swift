//
//  AlertHelper.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 30/1/2564 BE.
//

import Foundation
import UIKit

class AlertHelper {
    static func alertAction(title:String, message:String, buttonTitle:String, traget:UIViewController, actionHandle:@escaping () -> Void) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { (action) in
            actionHandle()
        }))
        traget.present(alertView, animated: true, completion: nil)
    }
}
