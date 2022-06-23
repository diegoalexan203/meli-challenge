//
//  MeliApiRepository.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import RxSwift

class MeliApiRepository: MeliApiRepositoryProtocol {
    func getProductsByName(productName: String) throws -> Observable<[Result]> {
        return Observable.create{ observer in
            let session = URLSession.shared
            var parameter = productName.replacingOccurrences(of: " ", with: "%20")
            var request = URLRequest(url: URL(string: Constants.URL.main + Constants.Endpoints.urlProduct + "?q=" + parameter)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                    if response.statusCode == 200 {
                        do {
                            let decoder = JSONDecoder()
                            let products = try decoder.decode(Product.self, from: data)
                            observer.onNext(products.results)
                        } catch let error {
                            observer.onError(error)
                            print("Ha ocurrido un error: \(error.localizedDescription)")
                        }
                    } else if response.statusCode == 401 {
                        print("Error 401")
                    }
                observer.onCompleted()
            }.resume()
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
    
    func getCategories() throws -> Observable<[Category]> {
        return Observable.create{ observer in
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.URL.main + Constants.Endpoints.urlCategories )!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                    if response.statusCode == 200 {
                        do {
                            let decoder = JSONDecoder()
                            let categories = try decoder.decode(Categories.self, from: data)
                            observer.onNext(categories)
                        } catch let error {
                            observer.onError(error)
                            print("Ha ocurrido un error: \(error.localizedDescription)")
                        }
                    } else if response.statusCode == 401 {
                        print("Error 401")
                    }
                observer.onCompleted()
            }.resume()
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}
