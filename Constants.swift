//
//  Constants.swift
//  weatherly
//
//  Created by skwong on 1/14/17.
//  Copyright © 2017 fedup. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_FORCAST_URL = "//api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "0a1d0754d755e200083a42600740f76f"

typealias DownloadComplete = () -> ()
//this tells our function when it's downloaded and complete

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

let FORCAST_URL = "\(BASE_FORCAST_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"





//http://api.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&mode=json&appid=0a1d0754d755e200083a42600740f76f
