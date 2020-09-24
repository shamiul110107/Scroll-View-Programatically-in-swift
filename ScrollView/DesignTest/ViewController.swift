//
//  ViewController.swift
//  DesignTest
//
//  Created by sami on 24/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func frameBasedClicked(_ sender: Any) {
        let vc = FrameBasedViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func autoLayoutBasedClicked(_ sender: Any) {
        let vc = AutoLayoutBasedViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
