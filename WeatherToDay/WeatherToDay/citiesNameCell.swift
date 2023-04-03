//
//  citiesNameCell.swift
//  WeatherToDay
//
//  Created by Баландина Александра Викторовна on 3/4/2023.
//

import UIKit

class citiesNameCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
