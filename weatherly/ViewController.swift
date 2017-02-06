//
//  ViewController.swift
//  weatherly
//
//  Created by skwong on 1/14/17.
//  Copyright © 2017 fedup. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var currentTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    var currentWeather = CurrentWeather()
    //This lets us access the class CurrentWeather
    
    var forcast = Forcast()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        

        
        currentWeather.downloadWeatherDetails
            //This is applying the function from the class to download the weather data
            {
               self.updateMainUI()
            }
        
        
//        dateLabel.text = currentWeather.date
//        currentTempLabel.text = ""
//        locationLabel.text = currentWeather.cityName
//        currentImage.image = #imageLiteral(resourceName: "rainy")
//        currentTypeLabel.text = "??"
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func downloadForcastData(completed: @escaping DownloadComplete)
//    {
//        let forcastWeatherURL = URL(string: FORCAST_URL)!
//        Alamofire.request(forcastWeatherURL).responseJSON
//            {
//                response in
//                
//                let result = response.result
//                print(response)
//                print(FORCAST_URL)
//                
//                if let dict = result.value as? Dictionary<String, Anyobject>
//                {
//                    if let list = dict["list"] as? [Dictionry<String, Anyobject]>
//                    {
//                        for obj in list
//                        {
//                            let forcast = Forecast(weatherDict: obj)
//                            
//                        }
//                    }
//                }
//
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
   
    func updateMainUI()
    {
        dateLabel.text = currentWeather.date
        locationLabel.text = currentWeather.cityName
        currentTypeLabel.text = currentWeather.weatherType
        currentTempLabel.text = "\(currentWeather.currentTemp!)"
        currentImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    
    
    
}

