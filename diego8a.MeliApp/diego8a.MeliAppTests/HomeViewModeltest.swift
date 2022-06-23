//
//  HomeViewModeltest.swift
//  diego8a.MeliAppTests
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import RxCocoa
import RxTest
import XCTest
import RxSwift
@testable import diego8a_MeliApp

class HomeViewModeltest: XCTestCase {
    var scheduler: TestScheduler!
    var disposebag: DisposeBag!

    override func setUp() {
        scheduler = TestScheduler(initialClock: 0)
        disposebag = DisposeBag()
    }

    func testGetMovies(){
        let fake = FakeMoviesService()
        let viewModel = HomeViewModel(meliService: fake)
        viewModel.input.productName.accept("Corsa Active")
        let productList = scheduler.createObserver([Result]?.self)
        viewModel.output.products.asDriver().drive(productList).disposed(by: disposebag)
        
        scheduler.start()
        let productResponse = viewModel.output.products.value
        XCTAssertNotNil(productResponse)
    }
}

