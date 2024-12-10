//
//  HomeDetailsViewController+CollectionView+EX.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 10/12/2024.
//

import UIKit

// MARK: - CollectionView Delegate and DataSource
extension HomeDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Setup Methods
    func sutpCollectioneView() {
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
        sizeCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        sizeCollectionView.collectionViewLayout = viewModel.createSizeSection()
        registerCells()
    }
    
    func registerCells() {
        self.sizeCollectionView.register(SizeCell.register(), forCellWithReuseIdentifier:SizeCell.identifier)
    }
    
    func reloadColectioneView() {
        DispatchQueue.main.async {
            self.sizeCollectionView.reloadData()
        }
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowsSize(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:SizeCell.identifier, for: indexPath) as! SizeCell
        let data = viewModel.mockDataSize[indexPath.row]
        cell.configData(data: data)
        return cell
    }
}
