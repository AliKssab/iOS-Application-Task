//
//  HomeDetailsViewController.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 10/12/2024.
//

import UIKit

class HomeDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productReviewsLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productRatingStarsLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Properties
    var data: DataStatsproductsViewModel
    var viewModel = ProductsViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sutpCollectioneView()
        setupUI()
        setupData()
     }
    
    // Custom initializer
    init(data: DataStatsproductsViewModel) {
        self.data = data
        super.init(nibName: "HomeDetailsViewController", bundle: nil)
    }

    // Required initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        productImageView.layer.cornerRadius  = 16
        lockButton.layer.cornerRadius = 24
        lockButton.layer.masksToBounds = true
        buyNowButton.layer.cornerRadius = 24
        buyNowButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = backButton.frame.size.height / 2
        backButton.layer.masksToBounds = true
        heartButton.layer.cornerRadius = heartButton.frame.size.height / 2
        heartButton.layer.masksToBounds = true
    }
    
    private func setupData() {
        productImageView.configureImage(with: data.image)
        productNameLabel.text = data.title
        productRatingStarsLabel.text = "\(data.rate)"
        productReviewsLabel.text = "(\(data.count) Review)"
        priceLabel.text = "\(data.price)$"
        productDescriptionLabel.text = data.description
     }
  
    // MARK: - Button Action
     @IBAction func backButtonAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: false)
    }
}
