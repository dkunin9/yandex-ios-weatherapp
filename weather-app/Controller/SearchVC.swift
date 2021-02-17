//
//  SearchVC.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import UIKit


var cities = [
    City(name: "Berlin", lat: 52.52437, lon: 13.41053, info: "Berlin (/bɜːrˈlɪn/; German: [bɛʁˈliːn] (About this soundlisten)[7]) is the capital and largest city of Germany by both area and population.[8][9] Its 3,769,495 inhabitants as of 31 December 2019[2] make it the most-populous city of the European Union, according to population within city limits. One of Germany's 16 constituent states, Berlin is surrounded by the state of Brandenburg, and contiguous with Potsdam, Brandenburg's capital. Berlin's urban area has a population of around 4.5 million and is the second most populous urban area in Germany after the Ruhr. The Berlin-Brandenburg capital region has about six million inhabitants and is Germany's third-largest metropolitan region after the Rhine-Ruhr and Rhine-Main regions."),
    City(name: "New York", lat: 40.714599, lon: -74.002791, info: "New York City (NYC), often called simply New York, is the most populous city in the United States. With an estimated 2019 population of 8,336,817 distributed over about 302.6 square miles (784 km2), New York City is also the most densely populated major city in the United States.[11] Located at the southern tip of the State of New York, the city is the center of the New York metropolitan area, the largest metropolitan area in the world by urban landmass.[12] With almost 20 million people in its metropolitan statistical area and approximately 23 million in its combined statistical area, it is one of the world's most populous megacities. New York City has been described as the cultural, financial, and media capital of the world, significantly influencing commerce,[13] entertainment, research, technology, education, politics, tourism, art, fashion, and sports. Home to the headquarters of the United Nations,[14] New York is an important center for international diplomacy.[15][16]"),
    City(name: "London", lat: 51.507351, lon: -0.127660, info: "London is the capital and largest city of England and the United Kingdom.[8][9] The city stands on the River Thames in the south-east of England, at the head of its 50-mile (80 km) estuary leading to the North Sea. London has been a major settlement for two millennia. Londinium was founded by the Romans.[10] The City of London, London's ancient core and financial centre − an area of just 1.12 square miles (2.9 km2) and colloquially known as the Square Mile − retains boundaries that closely follow its medieval limits.[11][12][13][14][15][note 1] The adjacent City of Westminster has for centuries been the location of much of the national government. Thirty-one additional boroughs north and south of the river also comprise modern London. London is governed by the mayor of London and the London Assembly.[16][note 2][17]"),
    City(name: "Moscow", lat: 55.753215, lon: 37.622504, info: "Moscow (/ˈmɒskoʊ/, /ˈmɒskaʊ/;[11][12] Russian: Москва, tr. Moskva, IPA: [mɐˈskva] (About this soundlisten)) is the capital and largest city of Russia. The city stands on the Moskva River in Central Russia, with a population estimated at 12.4 million residents within the city limits,[13] while over 17 million residents in the urban area,[14] and over 20 million residents in the Moscow Metropolitan Area.[15] The city covers an area of 2,511 square kilometres (970 sq mi), while the urban area covers 5,891 square kilometres (2,275 sq mi),[14] and the metropolitan area covers over 26,000 square kilometres (10,000 sq mi).[15] Moscow is among the world's largest cities, being the largest city entirely in Europe, the largest urban area in Europe,[14] the largest metropolitan area in Europe,[15] and the largest city by land area on the European continent.[16]"),
    City(name: "Los Angeles", lat: 32.715711, lon: -117.154614, info: "Los Angeles (/lɔːs ˈændʒələs/ (About this soundlisten);[a] Spanish: Los  officially the City of Los Angeles and often abbreviated as L.A., is the largest city in California. With an estimated population of nearly four million people,[17] it is the second most populous city in the United States (after New York City) and the third most populous city in North America (after Mexico City and New York City). Los Angeles is known for its Mediterranean climate, ethnic diversity, Hollywood entertainment industry, and its sprawling metropolis."),
    City(name: "Shanghai", lat: 31.230863, lon: 121.470462, info: "Shanghai (Chinese: 上海, Shanghainese pronunciation:zh-wuu-2-上海.ogg [zɑ̃̀.hɛ́], Standard Mandarin pronunciation: [ʂâŋ.xài] (About this soundlisten)) is one of the four direct-administered municipalities of the People's Republic of China. It is under the direct administration of the State Council of China. The city is located on the southern estuary of the Yangtze, with the Huangpu River flowing through it. With a population of 24.28 million as of 2019, it is the most populous urban area in China and the third most populous city proper in the world. Shanghai is a global center for finance, research, technology, manufacturing, and transportation, and the Port of Shanghai is the world's busiest container port."),
    City(name: "Paris", lat: 48.856663, lon: 2.351556, info: "Paris (French pronunciation: ​[paʁi] (About this soundlisten)) is the capital and most populous city of France, with an estimated population of 2,175,601 residents as of 2018, in an area of more than 105 square kilometres (41 square miles).[4] Since the 17th century, Paris has been one of Europe's major centres of finance, diplomacy, commerce, fashion, science and arts. The City of Paris is the centre and seat of government of the Île-de-France, or Paris Region, which has an estimated official 2017 population of 12,174,880, or about 18 percent of the population of France.[5] The Paris Region had a GDP of €709 billion ($808 billion) in 2017.[6] According to the Economist Intelligence Unit Worldwide Cost of Living Survey in 2018, Paris was the second most expensive city in the world, after Singapore, and ahead of Zürich, Hong Kong, Oslo and Geneva.[7] Another source ranked Paris as most expensive, on a par with Singapore and Hong Kong, in 2018.[8][9]"),
    City(name: "Sydney", lat: -33.865248, lon: 151.216484, info: "Sydney (/ˈsɪdni/ (About this soundlisten) SID-nee; Dharug: Cadi) is the capital city of the state of New South Wales, and the most populous city in Australia and Oceania.[6] Located on Australia's east coast, the metropolis surrounds Port Jackson and extends about 70 km (43.5 mi) on its periphery towards the Blue Mountains to the west, Hawkesbury to the north, the Royal National Park to the south and Macarthur to the south-west.[7] Sydney is made up of 658 suburbs, spread across 33 local government areas. Informally there are at least 15 regions. Residents of the city are known as estimated metropolitan population was 5,312,163,[9] meaning the city is home to approximately 65% of the state's population.[10]"),
    City(name: "Oslo", lat: 59.912752, lon: 10.734365, info: "Oslo (/ˈɒzloʊ/ OZ-loh, also US: /ˈɒsloʊ/ OSS-loh,[10][11] Norwegian: [ˈʊ̂ʂlʊ] (About this soundlisten), rarely [ˈʊ̂slʊ, ˈʊ̀ʂlʊ]) is the capital and most populous city of Norway. It constitutes both a county and a municipality. As of 23 November 2020, the municipality of Oslo had a population of 697,549, while the population of the city's greater urban area was 1,019,513, as of 4 November 2019.[12][13] The metropolitan area had an estimated population of 1.71 million.[14]"),
    City(name: "Helsinki", lat: 60.166892, lon: 24.943673, info: "Helsinki (/ˈhɛlsɪŋki/ HEL-sink-ee or /hɛlˈsɪŋki/ (About this soundlisten) hel-SINK-ee;[7][8] Finnish: [ˈhelsiŋki] (About this soundlisten); Swedish: Helsingfors, Finland Swedish: [helsiŋˈforsː] (About this soundlisten); Latin: Helsingia) is the capital, primate and most populous city of Finland. Located on the shore of the Gulf of Finland, it is the seat of the region of Uusimaa in southern Finland, and has a population of 657,674.[3][9] The city's urban area has a population of 1,268,296,[10] making it by far the most populous urban area in Finland as well as the country's most important center for politics, education, finance, culture, and research; while Tampere in the Pirkanmaa region, located 179 kilometres (111 mi) to the north from Helsinki, is the second largest urban area in Finland. Helsinki is located 80 kilometres (50 mi) north of Tallinn, Estonia, 400 km (250 mi) east of Stockholm, Sweden, and 300 km (190 mi) west of Saint Petersburg, Russia. It has close historical ties with these three cities.")
]


class SearchVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
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
            webService.fetchWeather(city: city)
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
    
    func didUpdate(_ webService: WebService, model: ResultModel) {
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


