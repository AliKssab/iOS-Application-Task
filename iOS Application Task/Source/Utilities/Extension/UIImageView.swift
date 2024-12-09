//
//  UIImageView.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    func configureImage( with imageURLString: String?) {
        self.isHidden = false
        if let imageURL = URL(string: imageURLString ?? "") {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: imageURL)
        }
    }
 }
