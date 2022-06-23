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

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController(with: products[indexPath.row].permalink)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
