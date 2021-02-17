//
//  InfoVC.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
    var model: ResultModel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }
    
    func updateContent() {
        self.cityLabel.text = model.name
    }

}
