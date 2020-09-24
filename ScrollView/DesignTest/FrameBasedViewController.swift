//
//  FrameBasedViewController.swift
//  DesignTest
//
//  Created by sami on 24/9/20.
//

import UIKit


let factX = UIScreen.main.bounds.size.width / 320
let factY = UIScreen.main.bounds.size.height / 568

extension Int {
    func x()->CGFloat {
        return CGFloat(CGFloat(self) * factX)
    }
    func y()->CGFloat {
        return CGFloat(CGFloat(self) * factY)
    }
}

extension Float {
    func x()->CGFloat {
        return CGFloat(CGFloat(self) * factX)
    }
    func y()->CGFloat {
        return CGFloat(CGFloat(self) * factY)
    }
}

extension Double {
    func x()->CGFloat {
        return CGFloat(CGFloat(self) * factX)
    }
    func y()->CGFloat {
        return CGFloat(CGFloat(self) * factY)
    }
}

extension CGFloat {
    func x()->CGFloat {
        return self * factX
    }
    func y()->CGFloat {
        return self * factY
    }
}

class FrameBasedViewController: UIViewController {
    
    let scrollView = UIScrollView()
    var currentY:CGFloat = 30
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.backgroundColor = .blue
        button.setTitle("This is button", for: .normal)
        scrollView.addSubview(button)
        return button
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.image = UIImage(named: "sami")
        scrollView.addSubview(imageView)
        return imageView
    }()
    
    lazy var tableView : UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .plain)
        tableview.separatorStyle = .none
        tableview.backgroundColor = .clear
        tableview.clipsToBounds = false
        tableview.isScrollEnabled = false
        tableview.showsVerticalScrollIndicator = false
        tableview.rowHeight = UITableView.automaticDimension
        tableview.separatorStyle = .none
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        scrollView.addSubview(tableview)
        return tableview
    }()
    
}


extension FrameBasedViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = self.view.bounds
        scrollView.isScrollEnabled = true
        self.view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
        
        button.frame = CGRect(x: 16.x(), y: currentY, width: 288.x(), height: 30.y())
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        currentY += button.frame.size.height + 30
        
        imageView.frame = CGRect(x: (self.view.frame.width - 200.x()) * 0.5 , y: currentY, width: 200.x(), height: 200.x())
        currentY += imageView.frame.size.height + 30
        
        var lineView = LineView()
        lineView.frame = CGRect(x: 0, y: currentY, width: self.view.frame.width, height: 0.5)
        scrollView.addSubview(lineView)
        currentY += lineView.frame.size.height + 16
        
        tableView.frame = CGRect(x: 16.x(), y: currentY, width: 288.x(), height: 340.y())
        tableView.reloadData()
        
        currentY += tableView.frame.size.height + 30
        
        lineView = LineView()
        lineView.frame = CGRect(x: 0, y: currentY, width: self.view.frame.width, height: 0.5)
        scrollView.addSubview(lineView)
        currentY += lineView.frame.size.height + 30

        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: currentY)
        
    }
    @objc func btnPressed(sender: UIButton) {
        print("pressed")
    }
}

extension FrameBasedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = "this is tableview"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


