//
//  HomeViewController.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import RxSwift
import UIKit

class HomeViewController: UIViewController {
   
    // MARK: - Outlet
    @IBOutlet weak var productsTableview: UITableView!
    @IBOutlet weak var SearchProductTextField: UITextField!
    
    // MARK: - Properties
    public var products = [Result]()
    public var viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    var searching = false
    let searchController = UISearchController()
    
    // MARK: - Outlet Events
   @IBAction func SearchButtonClick(_ sender: Any) {
       guard let name = SearchProductTextField.text, !name.isEmpty else {
           self.showAlert(title: "Alerta", message: "Debe digitar el nombre del producto")
           return
       }
       viewModel.input.productName.accept(name)
    }
    
    // MARK: - Methods
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
    
    func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
