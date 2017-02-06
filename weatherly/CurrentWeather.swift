//
//  CurrentWeather.swift
//  weatherly
//
//  Created by skwong on 1/14/17.
//  Copyright © 2017 fedup. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather
{
    
    
    var weatherType: String!
    var cityName: String!
    var currentTemp: Double?
  
    var date: String?
        {

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        
        return "Today is \(currentDate)"
        
        }
    
   
    
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete)
    {
        //tells Alamofire where to download from
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON
            {
            response in
                
                let result = response.result
                print(response)
                print(CURRENT_WEATHER_URL)
                
                if let dict = result.value as? Dictionary<String, AnyObject>
                {
                    if let name = dict["name"] as? String
                    {
                        self.cityName = name.capitalized
                      print(self.cityName)
                        
                    }
                    
                    if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]
                        
                        {
                        if let main = weather[0]["main"] as? String
                        {
                            self.weatherType = main.capitalized
                            print(self.weatherType)

                        }
                            
                    if let main = dict["main"] as? Dictionary<String, AnyObject>
                        {
                        if let temp = main["temp"] as? Double
                            
                            
                        {
                            let kelvinToFarenheit = Double(round(9/5 * (temp - 273) + 32))
                            // ° F = 9/5(° K - 273) + 32
                            self.currentTemp = kelvinToFarenheit
                            print(self.currentTemp!)
                            
                        }
                            
                    }
                        
                        
                     
                }
                    
                    
                    completed()

            }

        }
        
        
    }


}

