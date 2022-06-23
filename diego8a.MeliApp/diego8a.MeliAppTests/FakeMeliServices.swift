//
//  FakeMeliServices.swift
//  diego8a.MeliAppTests
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import RxCocoa
import RxSwift
import RxTest
import XCTest

@testable import diego8a_MeliApp

class FakeMoviesService: MeliServiceProtocol {
    
    func getProductsByName(productName: String) throws -> Observable<[Result]> {
        let products = [Result](arrayLiteral: Result(title: "Corsa Active", permalink: "http://www.mercadolibre.com.co", thumbnail: "http://www.mercadolibre.com.co", thumbnailID: "01"))
        return Observable<[Result]>.from(optional: products)
    }
}
