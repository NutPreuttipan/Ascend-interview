//
//  ProductCollectionViewCell.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 28/1/2564 BE.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelItemNew: UILabel!
    @IBOutlet weak var labelItemTitle: UILabel!
    @IBOutlet weak var labelItemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelItemNew.isHidden = true
    }
    
    func configure(item:ProductResponseModel) {
        viewContent.layer.cornerRadius = 10
        viewContent.clipsToBounds = true
        
        imageViewItem.kf.setImage(with: URL(string: item.image), placeholder: UIImage(named: "ascend-logo"), options: nil)
        
        labelItemTitle.text = item.title
        labelItemPrice.text = "\(item.price)"
        labelItemNew.text = "NEW"
        
        if item.isNewProduct {
            labelItemNew.isHidden = false
        }
    }
}
