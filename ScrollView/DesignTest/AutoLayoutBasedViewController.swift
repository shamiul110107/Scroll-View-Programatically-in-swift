//
//  SecondViewController.swift
//  DesignTest
//
//  Created by sami on 24/9/20.
//

import UIKit



class AutoLayoutBasedViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        button.setTitle("Hide/Show image", for: .normal)
        return button
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 10
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sami")
        return view
    }()
    
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var tableContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var tableView : AutoResizableTableView = {
        let tableview = AutoResizableTableView(frame: CGRect.zero, style: .plain)
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

extension AutoLayoutBasedViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(button)

        scrollViewContainer.addArrangedSubview(imageContainerView)
        scrollViewContainer.addArrangedSubview(seperatorView)
        scrollViewContainer.addArrangedSubview(tableContainerView)
        
        imageContainerView.addSubview(imageView)
        tableContainerView.addSubview(tableView)
        
        seperatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        tableView.anchor(top: tableContainerView.topAnchor, bottom: tableContainerView.bottomAnchor, left: tableContainerView.leftAnchor,right: tableContainerView.rightAnchor)
        tableView.reloadData()
        
        imageView.anchor(top:imageContainerView.topAnchor,paddingTop: 20,bottom: imageContainerView.bottomAnchor,paddingBottom: 20,width: 200.x(),height: 200.x())
        imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        
        scrollView.anchor(top:view.topAnchor,bottom: view.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor)

        scrollViewContainer.anchor(top:scrollView.topAnchor,paddingTop: 20,bottom: scrollView.bottomAnchor,left: scrollView.leftAnchor,paddingLeft: 16,right: scrollView.rightAnchor,paddingRight: 16)

        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -32).isActive = true
    }
    
    @objc func btnPressed() {
        print("btnPressed")
        imageContainerView.isHidden.toggle()
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}

extension AutoLayoutBasedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = "this is auto resizable tableview".capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
