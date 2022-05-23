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
        guard let baseURL = URL(string: baseURLString) else {completion(false); return}
        let coinsURL = baseURL.appendingPathComponent(keyCoinsComponent)
        let finalURL = coinsURL.appendingPathComponent(keyListComponent)
        print(finalURL)
        URLSession.shared.dataTask(with: finalURL) { coinData, _ , error in
            if let error = error {
                print("There was an \(error.localizedDescription)")
                completion(false)
            }
            guard let data = coinData else {completion(false); return}
            do{
                if let topLevelArrayOfCoinDictionaries = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [[String:String]] {
                    for coinDictionary in topLevelArrayOfCoinDictionaries {
                        if let id = coinDictionary["id"],
                           let symbol = coinDictionary["symbol"],
                           let name = coinDictionary["name"] {
                            let parsedCoin = Coin(id: id, symbol: symbol, name: name)
                            coins.append(parsedCoin)
                        }
                    }
                }
                completion(true)
            }catch {
                print("Error in do/try/catch \(error.localizedDescription)")
                completion(false)
                
            }

        }.resume()
    }
    
}// End of class
