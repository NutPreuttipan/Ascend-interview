//
//  ProductDetailViewController.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 29/1/2564 BE.
//

import UIKit

class ProductDetailViewController: UIViewController {

    
    @IBOutlet weak var imageViewProductPic: UIImageView!
    @IBOutlet weak var labelProductNew: UILabel!
    @IBOutlet weak var labelProductTitle: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var labelProductContent: UILabel!
    
    var viewModel:ProductViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()
    }
    
    func setupComponent() {
        self.title = "Detail"
        labelProductNew.isHidden = true
        
        imageViewProductPic.kf.setImage(with: URL(string: viewModel.productResponseDate.image), placeholder: UIImage(named: "ascend-logo"), options: nil)
        labelProductTitle.text = viewModel.productResponseDate.title
        labelProductPrice.text = "\(viewModel.productResponseDate.price)"
        labelProductContent.text = viewModel.productResponseDate.content
        labelProductNew.text = "NEW"
        
        if viewModel.productResponseDate.isNewProduct {
            labelProductNew.isHidden = false
        }
    }
}
