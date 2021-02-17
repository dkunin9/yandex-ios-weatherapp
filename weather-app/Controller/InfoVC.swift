//
//  InfoVC.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    
    
    var model: ResultModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }
    
    func updateContent() {
        self.cityLabel.text = model.name
        
        // tempreture
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
        
        self.conditionLabel.text = model.conditions
        // condition
        switch model.conditions {
/*
         clear — ясно.
         partly-cloudy — малооблачно.
         cloudy — облачно с прояснениями.
         overcast — пасмурно.
         drizzle — морось.
         light-rain — небольшой дождь.
         rain — дождь.
         moderate-rain — умеренно сильный дождь.
         heavy-rain — сильный дождь.
         continuous-heavy-rain — длительный сильный дождь.
         showers — ливень.
         wet-snow — дождь со снегом.
         light-snow — небольшой снег.
         snow — снег.
         snow-showers — снегопад.
         hail — град.
         thunderstorm — гроза.
         thunderstorm-with-rain — дождь с грозой.
         thunderstorm-with-hail — гроза с градом.
         */
        case "clear":
            weatherImage.image = UIImage(systemName: "sun.dust")
            break
        case "rain":
            weatherImage.image = UIImage(systemName: "cloud.rain")
            break
        case "cloudy":
            weatherImage.image = UIImage(systemName: "cloud.rain")
            break
        case "light-snow":
            weatherImage.image = UIImage(systemName: "cloud.snow")
            break
        case "light-rain":
            weatherImage.image = UIImage(systemName: "cloud.rain")
            break
        case "overcast":
            weatherImage.image = UIImage(systemName: "cloud.moon.fill")
            break
        default:
            weatherImage.image = UIImage(systemName: "snow")
            print("s")
            break
        }
    }

}
