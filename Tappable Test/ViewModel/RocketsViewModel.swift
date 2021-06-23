//
//  RocketsViewModel.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import Foundation
import Alamofire

protocol RocketsViewModelDelegate:AnyObject {
    func didFinishFetchingRockets(_ rockets: [SingleRocket])
}

class RocketsViewModel {
    
    typealias completionHandler = ([SingleRocket])->()
    weak var delegate: RocketsViewModelDelegate?
    
    func fetchRockets(completion: completionHandler?){
        
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {return}
        
        AF.request(url).response { response in
            
            switch response.result {
            case .success:
                do {
                    
                    let result = try JSONDecoder().decode([SingleRocket].self, from: response.data!)
                    
                    DispatchQueue.main.async {
                        self.delegate?.didFinishFetchingRockets(result)
                        completion?(result)
                    }
                    
                }
                catch let error {
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
