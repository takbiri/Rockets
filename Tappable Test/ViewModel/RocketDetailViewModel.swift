//
//  RocketDetailViewModel.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/12/21.
//

import SwiftUI
import SVProgressHUD
import Alamofire

class RocketDetailViewModel: ObservableObject {
    
    typealias completionHandler = (RocketDetail)->()
    private var apiUrl: String = ""
    var rocketID: String! {
        didSet {
            apiUrl = "https://api.spacexdata.com/v4/rockets/\(rocketID!)"
        }
    }
    
    @Published var detail: RocketDetail!
    @Published var dataHasBeenLoaded: Bool = false
    
    func fetchRocket(completion: completionHandler?) {
        SVProgressHUD.show()
                
        guard let url = URL(string: apiUrl) else { return }
        
        AF.request(url).response { response in
            
            DispatchQueue.main.async {
                
                SVProgressHUD.dismiss()
                
                switch response.result {
                case .success:
                    
                    do {
                        self.detail = try JSONDecoder().decode(RocketDetail.self, from: response.data!)
                        self.dataHasBeenLoaded = true
                        completion?(self.detail)
                        
                    }catch let error{
                        print("cant decode the data: \(error.localizedDescription)")
                    }
                    break
                
                case .failure(let error):
                    print("HTTPURLResponse code: \(error.localizedDescription)")
                    break
                }

            }
            
        }
        
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
