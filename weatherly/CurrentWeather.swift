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
    var currentTemp: String!
    var _cityName: String!
    
    var cityName: String
    {
        if _cityName == nil
        {
            _cityName = "nope"
        }
        
        return _cityName
    }
    

        
    var date: String
        {

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        
        return "Today is \(currentDate)"
        
        }
    
    
    
    
    func downloadWeatherDetails(completed: DownloadComplete)
    {
        //tells Alamofire where to download from
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON
            {
            response in let result = response.result
                print(response)
                
                if let dict = result.value as? Dictionary<String, AnyObject>
                    {
                    if let name = dict["name"] as? String
                    {
                        self._cityName = name
                        print(self._cityName)
                       
                    }
                        
                }
                
        }
       
        
        completed()
    }

    
}

