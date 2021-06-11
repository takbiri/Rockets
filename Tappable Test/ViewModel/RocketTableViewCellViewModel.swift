//
//  RocketTableViewCellViewModel.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import UIKit

struct RocketTableViewCellViewModel{
    
    let name: String
    let first_flight: String
    let flickr_images: [String]
    let success_rate_color: UIColor
    
    init(_ singleRocket: SingleRocket) {
        
        self.name = singleRocket.name
        self.first_flight = singleRocket.first_flight
        self.flickr_images = singleRocket.flickr_images
        
        if singleRocket.success_rate_pct <= 29 {
            self.success_rate_color = .red
        }else if singleRocket.success_rate_pct >= 30 && singleRocket.success_rate_pct <= 60{
            self.success_rate_color = .orange
        }else {
            self.success_rate_color = .green
        }
        
    }
    
}
