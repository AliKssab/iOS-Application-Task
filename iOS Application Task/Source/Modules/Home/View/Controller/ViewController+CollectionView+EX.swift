//
//  ViewController+CollectionView+EX.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//

import UIKit

// MARK: - CollectionView Delegate and DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Setup Methods
    func sutpCollectioneView() {
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        productsCollectionView.collectionViewLayout = viewModel.createStoriesSection()
        registerCells()
    }
    
    func registerCells() {
        self.productsCollectionView.register(ProductsCell.register(), forCellWithReuseIdentifier:ProductsCell.identifier)
    }
    
    func reloadColectioneView() {
        DispatchQueue.main.async {
            self.productsCollectionView.reloadData()
        }
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:ProductsCell.identifier, for: indexPath) as! ProductsCell
        let data = cellData[indexPath.row]
        cell.configData(data: data)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
