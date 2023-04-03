//
//  detailVC.swift
//  WeatherToDay
//
//  Created by Баландина Александра Викторовна on 3/4/2023.
//

import UIKit
import SwiftyJSON
import Alamofire

class detailVC: UIViewController {
    
    var cityName = ""
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temp_c: UILabel!
    @IBOutlet weak var backg: UIImageView!
    @IBOutlet weak var icons8: UIImageView!
    
    /*override func viewDidLoad() {
     super.viewDidLoad()
     
     let colorTop = UIColor(red: 89/255, green: 156/255, blue: 169/255, alpha: 1.0).cgColor
     let colorBottom = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
     
     let gradientLayer = CAGradientLayer()
     gradientLayer.frame = self.view.bounds
     gradientLayer.colors = [colorTop, colorBottom]
     gradientLayer.locations = [0.0, 1.0]
     self.view.layer.addSublayer(gradientLayer)
     
     }
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather(city: cityName
        )
    }
    
    func currentWeather(city: String){
        
        let url = "https://api.weatherapi.com/v1/current.json?key=4dce682a15e3434087891311230602&q=Moscow&aqi=no\(city)"
        
        AF.request(url, method: .get).validate().responseJSON { responce in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                let name = json["location"]["name"].stringValue
                let temp = json["current"]["temp_c"].doubleValue
                let country = json["location"]["country"].stringValue
                let weatherURLString = "http:\(json["location"][0]["icon"].stringValue)"
                
                self.cityNameLabel.text = name
                self.temp_c.text = String(temp)
                // self.countryLabel.text = country
                
                let weatherURL = URL(string: weatherURLString)
//                if let data = try? Data(contentsOf: weatherURL!){
//                    self.backg.image = UIImage(data: data)
//                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    // Do any additional setup after loading the view.
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


