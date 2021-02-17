//
//  SearchVC.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var cities = [
        // berlin
        [52.52437, 13.41053],
        // st petersburg
        [59.9500, 30.3167],
        // moscow
        [55.751244, 37.618423],
        // minsk
        [53.9022, 27.5618],
        // hamburg
        [53.5500, 10.0000],
        // munich
        [48.1372, 11.5755],
    ]
    
    var webService = WebService()
    
    var models : [ResultModel]? = nil
    var filteredModels : [ResultModel]!
    
    var needsRefresh = true
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webService.delegate = self
        fetch()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func fetch() {
        for city in cities {
            webService.fetchWeather(lat: city[0], lon: city[1])
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            let destinationVC = segue.destination as! InfoVC
            destinationVC.model = self.filteredModels![selectedIndex]
        }
    }

}

extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredModels = self.models!.filter {
            $0.name!.lowercased().contains(searchText.lowercased())
        }
        
        if searchText == "" {
            self.filteredModels = self.models
        }
        self.tableView.reloadData()
    }
    
}


extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "showInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        guard let model = filteredModels?[indexPath.row] else { return cell }
        cell.model = model
        return cell
    }
    
}

extension SearchVC: WebServiceDelegate {
    
    func didUpdate(_ apiManager: WebService, model: ResultModel) {
        DispatchQueue.main.async {
            if (self.needsRefresh) {
                self.models = [ResultModel]()
                self.models!.append(model)
                self.needsRefresh = false
            }
            else {
                self.models!.append(model)
            }
            self.filteredModels = self.models
            
            self.tableView.reloadData()
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


