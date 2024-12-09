//
//  ProductsRequest.swift
//  iOS Application Task
//
//  Created by Ali Mostafa on 09/12/2024.
//

import Foundation
import Alamofire
import RxSwift

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class ProductsRequest {
    
    static func productsData() -> Observable<Result<ProductsModel, NetworkError>> {
        return Observable.create { observer in
            let urlString = URLs.product
            guard let url = URL(string: urlString) else {
                observer.onNext(.failure(.urlError))
                observer.onCompleted()
                return Disposables.create()
            }
            
            let header = URLs().heder
            
            AF.request(url, headers: header).responseDecodable(of: ProductsModel.self) { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(.success(data))
                case .failure(let error):
                    observer.onNext(.failure(.canNotParseData))
                    print(error.localizedDescription)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
