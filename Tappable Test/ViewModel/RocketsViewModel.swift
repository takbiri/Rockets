//
//  RocketsViewModel.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import Foundation

protocol RocketsViewModelDelegate {
    func didFinishFetchingRockets(_ rockets: [SingleRocket])
}

class RocketsViewModel {
    var delegate: RocketsViewModelDelegate?
    
    func fetchRockets(){
        
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print("something bad happened: \(error!.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                do {
                    
                    let result = try JSONDecoder().decode([SingleRocket].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.delegate?.didFinishFetchingRockets(result)
                    }
                }
                 catch let error {
                    print("cant decode the data: \(error)")
                }
                
            }  else {
                    print("HTTPURLResponse code: \(response.statusCode)")
                }
            
        }.resume()
    }
    
}
