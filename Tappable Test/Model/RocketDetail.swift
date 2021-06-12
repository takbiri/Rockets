//
//  RocketDetail.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/12/21.
//

import SwiftUI

struct RocketDetail: Decodable {
    let name: String
    let success_rate_pct: Int
    let first_flight: String
    let flickr_images: [String]
    let cost_per_launch: Int32
    let country: String
    let wikipedia: String
    let active: Bool
    let description: String
}
