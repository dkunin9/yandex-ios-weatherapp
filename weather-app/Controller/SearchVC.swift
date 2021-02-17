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
        // new york
        [40.714599, -74.002791],
        //london
        [51.507351, -0.127660],
        // moscow
        [55.753215, 37.622504],
        // san diego
        [32.715711, -117.154614],
        // shanhai
        [31.230863, 121.470462],
        // paris
        [48.856663, 2.351556],
        // sydney
        [-33.865248, 151.216484],
        // oslo
        [59.912752, 10.734365],
        //helsinki
        [60.166892, 24.943673]
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


