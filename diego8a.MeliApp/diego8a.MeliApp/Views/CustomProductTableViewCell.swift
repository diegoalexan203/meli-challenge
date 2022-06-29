//
//  CustomProductTableViewCell.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation
import UIKit

class CustomProductTableViewCell: UITableViewCell{
    
    // MARK: - Outlet
    @IBOutlet weak var viewInButton: UIButton!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    // MARK: - Outlet Events
    @IBAction func viewInButtonAction(_ sender: Any) {
        self.delegate!.viewInTableViewCellButton(urlToNavigate: self.url)
    }
    
    // MARK: - Properties

    var delegate : ProductTableViewCellDelegate? = nil
    var url: String = ""
    
    // MARK: - Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
