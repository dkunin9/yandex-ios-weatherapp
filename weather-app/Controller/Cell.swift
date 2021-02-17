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
        self.tempretureLabel.text = String(model.tempreture!)+"ºC"
        
        if (model.tempreture! >= 15) {
            tempretureLabel.textColor = #colorLiteral(red: 1, green: 0.8045591387, blue: 0.09801565801, alpha: 1)
        }
        if (model.tempreture! < 15 && model.tempreture! > 0) {
            tempretureLabel.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
        if (model.tempreture! < 0) {
            tempretureLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    
}
