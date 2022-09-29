//
//  ProductCell.swift
//  Product App
//
//  Created by Fahri Novaldi on 28/09/22.
//

import UIKit

class ProductCell: UITableViewCell {
    static let reuseID: String = "ProductCell"
    
    let productWrapper: UIView = UIView()
    let productImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    let productPriceLabel: UILabel  = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    let productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    let productRating: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }
    
    private func prepareUI(){
        addSubview(productWrapper)
        productWrapper.addSubview(productImage)
        productWrapper.addSubview(productPriceLabel)
        productWrapper.addSubview(productTitleLabel)
        productWrapper.addSubview(productDescriptionLabel)
        productWrapper.addSubview(productRating)
        
        productWrapper.translatesAutoresizingMaskIntoConstraints = false
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        productRating.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            productWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            productWrapper.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            productWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            productWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            productImage.leadingAnchor.constraint(equalTo: productWrapper.leadingAnchor),
            productImage.topAnchor.constraint(equalTo: productWrapper.topAnchor),
            productImage.bottomAnchor.constraint(equalTo: productWrapper.bottomAnchor),
            productImage.widthAnchor.constraint(equalTo: productWrapper.widthAnchor, multiplier: 0.4),
            
            productPriceLabel.leadingAnchor.constraint(equalTo: productWrapper.leadingAnchor, constant: padding),
            productPriceLabel.topAnchor.constraint(equalTo: productWrapper.topAnchor, constant: padding),
            
            productTitleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: padding),
            productTitleLabel.topAnchor.constraint(equalTo: productWrapper.topAnchor, constant: padding),
            productTitleLabel.trailingAnchor.constraint(equalTo: productWrapper.trailingAnchor, constant: -padding),
            
            productDescriptionLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: padding),
            productDescriptionLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: padding/2),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: productWrapper.trailingAnchor, constant: -padding),
            
            productRating.trailingAnchor.constraint(equalTo: productWrapper.trailingAnchor, constant: -padding),
            productRating.bottomAnchor.constraint(equalTo: productWrapper.bottomAnchor, constant: -padding),
            productRating.topAnchor.constraint(greaterThanOrEqualTo: productDescriptionLabel.bottomAnchor, constant: padding/2)
        ])
    }
    
    public func prepareCellfor(product: Product){
        prepareUI()
        productTitleLabel.text = product.title
        productPriceLabel.text = "$ \(product.price)"
        productDescriptionLabel.text = product.description
        productRating.text = "star \(product.rating.rate) " //TODO: UPDATE THE ICON
        
        productImage.load(url: URL(string: product.image) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png")!)
    }
    
}
