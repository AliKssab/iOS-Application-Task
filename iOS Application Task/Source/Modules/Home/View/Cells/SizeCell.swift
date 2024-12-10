//
//  SizeCell.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 10/12/2024.
//

import UIKit

// MARK: - Size Cell
class SizeCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var sizeLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    // MARK: - Static Properties
    static var identifier: String {
        get {
            "SizeCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "SizeCell", bundle: nil)
    }
    
    // MARK: - Configuration
    private func setupUI() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "gray")?.cgColor
      }
    
    func configData(data:String) {
        sizeLabel.text = data
     }
}
