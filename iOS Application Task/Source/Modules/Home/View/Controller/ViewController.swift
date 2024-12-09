//
//  ViewController.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var loding: UIActivityIndicatorView!
    
    // MARK: - Properties
    var viewModel = ProductsViewModel()
    var cellData:[DataStatsproductsViewModel] =  []
    private let disposeBag = DisposeBag()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sutpCollectioneView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    
    // MARK: - ViewModel Binding
    private func bindViewModel() {
        viewModel.isLoadingData
            .asObservable()
            .observe(on: MainScheduler.instance)
            .debounce(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                guard let self  else {return}
                // Handle loading UI
                if isLoading {
                    self.loding.startAnimating()
                } else {
                    self.loding.stopAnimating()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.productsData
            .asObservable()
            .subscribe(onNext: { [weak self] service in
                guard let self  else {return}
                cellData = service
                reloadColectioneView()
            })
            .disposed(by: disposeBag)
     }
 }
