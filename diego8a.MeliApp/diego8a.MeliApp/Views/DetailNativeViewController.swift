//
//  DetailNativeViewController.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 28/06/22.
//

import UIKit

class DetailNativeViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Properties
    var product: Result? = nil
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        tittleLabel.text = self.product?.title
        productImageView.imageFromServerURL(urlString: product!.thumbnail, placeHolderImage: UIImage(named: "DefaultImage")!)
        priceLabel.text = String( product!.price)
    }

    init(with product: Result){
        self.product = product
        super.init(nibName: "DetailNativeViewController", bundle: Bundle.main)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
