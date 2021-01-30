//
//  ProductViewController.swift
//  Ascend-interview
//
//  Created by Preuttipan Janpen on 28/1/2564 BE.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var collectionViewItemList: UICollectionView!
    @IBOutlet weak var activityIndicatorLoading: UIActivityIndicatorView!
    
    var headerHeight:CGFloat = 0
    var viewModel:ProductViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponent()
        setupCollectionView()
    }
    
    func setupComponent() {
        self.title = "Product"
        
        viewModel.fetchAllProduct()
        viewModel.delegate = self
        
        activityIndicatorLoading.hidesWhenStopped = true
        activityIndicatorLoading.startAnimating()
    }
    
    func setupCollectionView() {
        collectionViewItemList.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        collectionViewItemList.register(UINib.init(nibName: "ProductHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: "ProductHeaderCollectionReusableView")
    }
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.productListResponseData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProductHeaderCollectionReusableView", for: indexPath) as! ProductHeaderCollectionReusableView
            headerView.configure()
            return headerView
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.size.width * 0.5) - 15
        
        return CGSize(width: width, height: width * 1.4)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell

        cell.configure(item: viewModel.productListResponseData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "productDetailVC") as! ProductDetailViewController
        productDetailVC.viewModel.productResponseDate = viewModel.productListResponseData[indexPath.item]
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

extension ProductViewController: ProductProtocol {
    
    func didFinishFetchProduct() {
        headerHeight = 35
        collectionViewItemList.reloadData()
        activityIndicatorLoading.stopAnimating()
    }
    
    func didFailedFetchProduct(message: String) {
        AlertHelper.alertAction(title: "แจ้งเตือน", message: "เกิดข้อผิดพลาดบางอย่าง", buttonTitle: "ลองอีกครั้ง", traget: self) { [self] in
            viewModel.fetchAllProduct()
        }
    }
}
