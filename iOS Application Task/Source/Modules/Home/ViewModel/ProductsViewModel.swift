//
//  ProductsViewModel.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//


import Foundation
import RxSwift
import RxCocoa

class ProductsViewModel{
    
    // MARK: - Properties
    
    var isLoadingData = BehaviorRelay<Bool>(value: false)
    var productsData = BehaviorRelay<[DataStatsproductsViewModel]>(value: [])
    private var dataSource: ProductsModel?
    private let disposeBag = DisposeBag()
    
    // MARK: - Methods
    func getData() {
        guard !isLoadingData.value else { return }
        
        isLoadingData.accept(true)
        ProductsRequest.productsData().subscribe(onNext: { [weak self] (result: Result<ProductsModel, NetworkError>) in
            self?.isLoadingData.accept(false)
            switch result {
            case .success(let data):
                self?.dataSource = data
                self?.mapProductData()
            case .failure(let error):
                print("API Call Failure: \(error)")  // Debug print
            }
        })
        .disposed(by: disposeBag)
    }
    
    private func mapProductData() {
        guard let data = dataSource else { return }
        
        let productViewModels = data.map { dataProduct in
            DataStatsproductsViewModel(data: dataProduct)
        }
        productsData.accept(productViewModels)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return productsData.value.count
    }
    
    // MARK: - Section Creation Methods
    func createStoriesSection() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10)
        
        let rowGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0 / 3.7)
            ),
            subitems: [item, item]
        )
        
        let section = NSCollectionLayoutSection(group: rowGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.interGroupSpacing = 10
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
