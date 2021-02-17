//
//  WebService.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import Foundation


protocol WebServiceDelegate {
    func didUpdate(_ webService: WebService, model: ResultModel)
    func didFailWithError(error: Error)
}


struct WebService {
    
    let yandexURL = "https://api.weather.yandex.ru/v2/forecast?"
    
    var delegate: WebServiceDelegate?
    
    var name: String?
    var info: String?
    
    mutating func fetchWeather(city: City) {
        let urlString = "\(yandexURL)" + "lat=" + String(city.lat) + "&lon=" + String(city.lon) + "&extra=true"
        self.name = city.name
        self.info = city.info
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("db926e48-52b6-401f-a76c-ed638a9c27c4", forHTTPHeaderField: "X-Yandex-API-Key")
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let cityData = self.parseJSON(safeData) {
                        self.delegate?.didUpdate(self, model: cityData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> ResultModel? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(ResultData.self, from: data)
                let temp = decodedData.fact.temp
                let conditions = decodedData.fact.condition
                let city = ResultModel(name: self.name, tempreture: temp, conditions: conditions, info: self.info)
                return city
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
    
}
