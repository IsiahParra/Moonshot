//
//  CoinListTableViewController.swift
//  CoinBrowser
//
//  Created by Isiah Parra on 5/23/22.
//

import UIKit

class CoinListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoinController.fetchCoins { success in
            if success == true {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CoinController.coins.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinListCell", for: indexPath)
        let coin = CoinController.coins[indexPath.row]
        var coinCellConfiguration = cell.defaultContentConfiguration()
        // Set the values
        coinCellConfiguration.text = coin.name
        coinCellConfiguration.secondaryText = "Symbol: \(coin.symbol), id: \(coin.id)"
        // Set the configuration
        cell.contentConfiguration = coinCellConfiguration
        
        
        return cell
    }
}// end of class
