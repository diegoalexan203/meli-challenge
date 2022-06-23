//
//  HomeViewController.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import RxSwift
import UIKit

class HomeViewController: UIViewController {
   @IBAction func SearchButtonClick(_ sender: Any) {
        viewModel.input.productName.accept(SearchProductTextField.text)
    }

    public var products = [Result]()
    @IBOutlet weak var productsTableview: UITableView!
    @IBOutlet weak var SearchProductTextField: UITextField!
    public var viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    var searching = false
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Mercado Libre"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor =  UIColor(hexString: "FDF173")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        configureTableView()
        bind()
    }
    
    func bind() {
        viewModel.output.products.asObservable().subscribe(
            onNext: { products in
                if products != nil {
                    self.products = products!
                    DispatchQueue.main.async {
                        self.productsTableview.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }

    private func configureTableView() {
        productsTableview.rowHeight = UITableView.automaticDimension
        productsTableview.register(UINib(nibName: "CustomProductTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomProductCell")
    }


}
