//
//  RocketDetailViewController.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import UIKit
import SwiftUI

class RocketDetailViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let childView = UIHostingController(rootView: RocketDetailSwiftUIView())
        addChild(childView)
        childView.view.frame = containerView.bounds
        containerView.addSubview(childView.view)
        
    }
    

    

}
