//
//  FirstViewController.swift
//  StajChallange
//
//  Created by RIDVAN on 4.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    private lazy var viewModel = CoinViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.fetchCoinResults()
        viewModel.addChangeHandler { [weak self] (state) -> Void in
            DispatchQueue.main.async {
                switch state {
                case .fetching:
                    // indicator
                    self?.showSpinner()
                    print("fetching")
                case .failed(let message):
                    self?.closeSpinner()
                    print(message!)
                case .succeeded:
                    self?.closeSpinner()
                    self?.tableView.reloadData()
                    
                    //self?.tableView.reloadData()
                    print("deneme")
                    
                }
            }
        }
    }
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(viewModel.coins?.my_data?.coins?.count ?? 0)
        return viewModel.coins?.data?.coins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = cell.textLabel?.textColor.hexStringToUIColor(hex: viewModel.coins?.data?.coins?[indexPath.row].color ?? "#00000")
        cell.textLabel?.text = (viewModel.coins?.data?.coins?[indexPath.row].name ?? "") + " " + (viewModel.coins?.data?.coins?[indexPath.row].price ?? "")
        //print(viewModel.coins?.my_data?.coins?[indexPath.row].name ?? "NameGELMEDİ")
        return cell
    }

}
