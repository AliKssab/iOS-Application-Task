//
//  ProductsModel.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//
 
import Foundation

// MARK: - ProductsModel

typealias ProductsModel = [ProductsModelElement]

struct ProductsModelElement: Codable {
    var id: Int?
    var title: String?
    var price: Double?
    var description: String?
    var category: Category?
    var image: String?
    var rating: Rating?
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    var rate: Double?
    var count: Int?
}
