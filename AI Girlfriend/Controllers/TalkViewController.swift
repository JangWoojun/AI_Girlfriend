//
//  TalkViewController.swift
//  AI Girlfriend
//
//  Created by Jangwoojun on 2023/03/13.
//

import UIKit

class TalkViewController: UIViewController {
    
    private let talkView = TalkView()
    private let tableView = UITableView()

    override func loadView() {
        view = talkView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.rowHeight = 80
        tableView.separatorStyle = .none

        tableView.register(TalkTableViewCell.self, forCellReuseIdentifier: "GirlFriendCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: talkView.mainLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
}

extension TalkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GirlFriendCell", for: indexPath) as! TalkTableViewCell
        cell.selectionStyle = .none

        return cell
    }
    
}

extension TalkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = ViewController()

        navigationController?.pushViewController(nextVC, animated: true)
    }
}
