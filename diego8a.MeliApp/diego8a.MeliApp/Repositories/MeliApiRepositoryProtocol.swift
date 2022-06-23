//
//  MeliApiRepositoryProtocol.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import RxSwift

protocol MeliApiRepositoryProtocol {
    func getProductsByName(productName: String) throws -> Observable<[Result]>
    func getCategories() throws -> Observable<[Category]>
}
