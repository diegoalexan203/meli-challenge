//
//  HomeViewModel.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import RxCocoa
import RxSwift

class HomeViewModel: ViewModelProtocol {
    
    // MARK: - Properties
    var meliService: MeliServiceProtocol
    let disposeBag = DisposeBag()
    let input: Input
    let output: Output
    
    init() {
        input = Input()
        output = Output()
        meliService = MeliService(repositoryApi: MeliApiRepository())
        getProducts()
    }

    init(meliService: MeliServiceProtocol) {
        input = Input()
        output = Output()
        self.meliService = meliService
        getProducts()
    }

    struct Input {
        var productName = BehaviorRelay<String?>(value: nil)
    }

    struct Output {
        var products = BehaviorRelay<[Result]?>(value: nil)
    }

    // MARK: - Methods
    func getProducts(){
        input.productName.subscribe(onNext: { name in
            if name != "" {
                do {
                    try
                    self.meliService.getProductsByName(productName: name ?? "").asObservable().retry(1)
                        .subscribe(onNext: { response in
                            self.output.products.accept(response)
                        }).disposed(by: self.disposeBag)

                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }).disposed(by: disposeBag)
    }

}
