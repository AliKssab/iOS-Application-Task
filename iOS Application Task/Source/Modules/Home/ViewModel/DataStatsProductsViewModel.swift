//
//  DataStatsProductsViewModel.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//

import Foundation

class DataStatsproductsViewModel {
    
    var id: Int
    var title: String
    var price: Double
    var description: String
    var image: String
    var rate: Double
    var count: Int

    init(data: ProductsModelElement) {
        self.id = data.id ?? 0
        self.title = data.title ?? ""
        self.price = data.price ?? 0
        self.description = data.description ?? ""
        self.image = data.image ?? ""
        self.rate = data.rating?.rate ?? 0
        self.count = data.rating?.count ?? 0
    }
}
