//
//  ProductHeaderCollectionReusableView.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 29/1/2564 BE.
//

import UIKit

class ProductHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
        viewContent.backgroundColor = .clear
        labelTitle.text = "Start picking your treats"
    }
    
}
