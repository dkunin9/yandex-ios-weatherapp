//
//  Cell.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    
    
    var model: ResultModel? {
        didSet {
            updateContent()
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityLabel.text = "nil"
    }
    
    
    func updateContent() {
        guard let model = model else { return }
        self.cityLabel.text = model.name
        self.tempretureLabel.text = String(model.tempreture!)
    }
    
}
