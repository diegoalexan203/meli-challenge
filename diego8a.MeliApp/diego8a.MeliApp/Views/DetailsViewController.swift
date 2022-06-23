//
//  DetailsViewController.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {


    @IBOutlet weak var detailsWkWebview: WKWebView!
    var productLink: String
    override func viewDidLoad() {
        super.viewDidLoad()

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
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
