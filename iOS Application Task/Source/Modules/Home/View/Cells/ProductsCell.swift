//
//  productsCell.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//

import UIKit

// MARK: - Product Cell
class ProductsCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Static Properties
    static var identifier: String {
        get {
            "ProductsCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "ProductsCell", bundle: nil)
    }
    
    // MARK: - Configuration
    private func setupUI() {
        // Configure corner radius
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
      }

    
    func configData(data:DataStatsproductsViewModel) {
        productImageView.configureImage(with: data.image)
        productNameLabel.text = data.title
        productPriceLabel.text = "\(data.price)$"
     }
 }
