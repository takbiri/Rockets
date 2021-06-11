//
//  MainViewController.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import UIKit
import SDWebImage
import SVProgressHUD

class RocketsViewController: UIViewController {

    var rocketsViewModel = RocketsViewModel()
    var rockets: [SingleRocket]?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()
        rocketsViewModel.delegate = self
        rocketsViewModel.fetchRockets()
        
        updateUI()
    }
    
    func updateUI(){
        
        self.navigationItem.title = "Rockets"
        tableView.register(UINib(nibName: "RocketTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}

extension RocketsViewController: RocketsViewModelDelegate, UITableViewDataSource, UITableViewDelegate {
    func didFinishFetchingRockets(_ rockets: [SingleRocket]) {
        self.rockets = rockets
        self.tableView.reloadData()
        
        SVProgressHUD.dismiss()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rockets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rocket = RocketTableViewCellViewModel(self.rockets![indexPath.row])
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RocketTableViewCell
        
        let imageUrl = URL(string: "\(rocket.flickr_images[0])")
        
        cell.rocketNameLabel.text = "\(rocket.name)"
        cell.fireDateLabel.text = "\(rocket.first_flight)"
        cell.successRateImageView.tintColor = rocket.success_rate_color
        cell.rocketImageView.sd_setImage(with: imageUrl, completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
}
