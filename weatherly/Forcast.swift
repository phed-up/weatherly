//
//  Forcast.swift
//  weatherly
//
//  Created by skwong on 2/5/17.
//  Copyright © 2017 fedup. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class Forcast
{
    
    var weatherType: String!
    var highTemp: String!
    var lowTemp: String!
    
    var date: String!
    {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        
        return "Today is \(currentDate)"
        
    }



}
