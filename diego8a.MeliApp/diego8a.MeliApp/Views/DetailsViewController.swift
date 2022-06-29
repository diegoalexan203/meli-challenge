//
//  DetailsViewController.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var detailsWkWebview: WKWebView!
    
    // MARK: - Properties
    var productLink: String
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        let link = URL(string: self.productLink)
        let request = URLRequest(url: link!)
        detailsWkWebview?.load(request)
        
        
    }

    init(with productLink: String){
        self.productLink = productLink
        super.init(nibName: "DetailsViewController", bundle: Bundle.main)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
