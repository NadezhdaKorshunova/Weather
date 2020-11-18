//
//  ViewController.swift
//  Weather
//
//  Created by user on 18/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var LabelNsk: UILabel!
    @IBOutlet weak var LabelMos: UILabel!
    @IBOutlet weak var LabelKaz: UILabel!
    @IBOutlet weak var LabelTom: UILabel!
    @IBOutlet weak var LabelSaint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTemp(city: "Novosibirsk", Citylabel: LabelNsk)
        getTemp(city: "Moscow", Citylabel: LabelMos)
        getTemp(city: "Kazan", Citylabel: LabelKaz)
        getTemp(city: "Tomsk", Citylabel: LabelTom)
        getTemp(city: "Moscow", Citylabel: LabelSaint)
        
        
        // Do any additional setup after loading the view.
    }
    
    func getTemp(city: String, Citylabel: UILabel) {
        let apiKey = "4337709903994b1f8d180028201811"
        let url = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)"
    AF.request(url, method: .get).validate().responseJSON { response in
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            if let temp = json["current"]["temp_c"].int {
                Citylabel.text = String(temp) + "°"
            }
        case .failure(let error):
            print(error)
        }
    }
    }

}

