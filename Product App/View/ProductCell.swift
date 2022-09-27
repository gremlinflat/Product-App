//
//  ProductCell.swift
//  Product App
//
//  Created by Fahri Novaldi on 28/09/22.
//

import UIKit

class ProductCell: UITableViewCell {
    static let reuseID: String = "ProductCell"
    
    let productImage: UIImageView = UIImageView()
    let productPriceLabel: UILabel = UILabel()
    let productTitleLabel: UILabel = UILabel()
    let productDescriptionLabel: UILabel = UILabel()
    let productRating: UILabel = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }

    private func prepareUI(){
        //TODO: Make UI Components
    }
    
    public func prepareCellfor(product: Product){
        productTitleLabel.text = product.title
        productPriceLabel.text = "$ \(product.price)"
        productDescriptionLabel.text = product.description
        productRating.text = "star \(product.rating.rate) " //TODO: UPDATE THE ICON
        
//        productImage.image = //TODO: GET IMAGE FROM API
    }
    
}
