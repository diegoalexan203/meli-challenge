//
//  HomeViewController+Extension.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomProductCell") as! CustomProductTableViewCell

        cell.productImageView.imageFromServerURL(urlString: products[indexPath.row].thumbnail, placeHolderImage: UIImage(named: "DefaultImage")!)
        cell.productNameLabel.text = products[indexPath.row].title
        cell.delegate = self
        cell.url = products[indexPath.row].permalink
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailNativeViewController(with: products[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToMercadolibre(urlToNavigate:String){
        let vc = DetailsViewController(with: urlToNavigate)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension HomeViewController: ProductTableViewCellDelegate{
    func viewInTableViewCellButton(urlToNavigate: String) {
        self.navigateToMercadolibre(urlToNavigate: urlToNavigate)
    }
}
