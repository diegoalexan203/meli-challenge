//
//  MeliService.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import RxSwift

class MeliService: MeliServiceProtocol {

    var meliApiRepository: MeliApiRepositoryProtocol
    
    init(repositoryApi: MeliApiRepositoryProtocol) {
        meliApiRepository = repositoryApi
    }

    init() {
        meliApiRepository = MeliApiRepository()
    }
    
    func getCategories() throws -> Observable<[Category]> {
        return try meliApiRepository.getCategories().asObservable().flatMap({ response -> Observable<[Category]> in
            Observable.just(response)
        })
    }
    
    func getProductsByName(productName: String) throws -> Observable<[Result]> {
        return try meliApiRepository.getProductsByName(productName: productName).asObservable().flatMap({ response -> Observable<[Result]> in
            Observable.just(response)
        })
    }
}
