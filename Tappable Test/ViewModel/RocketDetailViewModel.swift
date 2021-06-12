//
//  RocketDetailViewModel.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/12/21.
//

import SwiftUI
import SVProgressHUD

class RocketDetailViewModel: ObservableObject {
    
    private var apiUrl: String = ""
    var rocketID: String! {
        didSet {
            apiUrl = "https://api.spacexdata.com/v4/rockets/\(rocketID!)"
        }
    }
    
    @Published var detail: RocketDetail!
    @Published var dataHasBeenLoaded: Bool = false
    
    func fetchRocket() {
        SVProgressHUD.show()
                
        guard let url = URL(string: apiUrl) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("something bad happened: \(error!.localizedDescription)")
                return
            }

            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        
                        self.detail = try JSONDecoder().decode(RocketDetail.self, from: data)
                        self.dataHasBeenLoaded = true
                        SVProgressHUD.dismiss()
                        
                    } catch let error {
                        print("cant decode the data: \(error)")
                    }
                }
            } else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
    }
    
    func getColorFromSuccessRate(_ rate: Int) -> Color {
        
        var color: Color
        if rate <= 29 {
            color = .red
        }else if rate >= 30 && rate <= 60{
            color = .orange
        }else {
            color = .green
        }
        
        return color
        
    }
}
