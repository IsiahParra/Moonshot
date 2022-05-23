//
//  CoinController.swift
//  CoinBrowser
//
//  Created by Isiah Parra on 5/23/22.
//

import Foundation

class CoinController {
    
    //SOT
   static var coins: [Coin] = []
    //BASEURL
    private static let baseURLString = "https://api.coingecko.com/api/v3"
    //KEYCOINSCOMPONENT
    private static let keyCoinsComponent = "coins"
    //KEYLIST
    private static let keyListComponent = "list"
    //MARK: CRUD
    static func fetchCoins(completion: @escaping(Bool) -> Void) {
        // first we need to decide what the fetch function will complete with.
        // piece together our URL
        // decode the data into our objects
        // once we have our objects we can add them to our SOT
        guard let baseURL = URL(string: baseURLString) else {return completion(false)}
        let coinsURL = baseURL.appendingPathComponent(keyCoinsComponent)
        let finalURL = coinsURL.appendingPathComponent(keyListComponent)
        print(finalURL)
    }
    
}// End of class
