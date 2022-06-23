//
//  MeliServiceProtocol.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import RxSwift

protocol MeliServiceProtocol {
    func getProductsByName(productName: String) throws -> Observable<[Result]>
}
