//
//  NetworkService.swift
//  ZRepo
//
//  Created by Мак on 24/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    func repoListRequest(find querie: String, page: Int, completion: @escaping (ResponseJSON?) -> Void) {
        
        let parameters: Parameters = [
            "q": querie,
            "page": page,
            "sort": "stars",
            "order": "desc"
        ]
        
        Alamofire
            .request("https://api.github.com/search/repositories", parameters: parameters)
            .responseJSON { (response) in
            
                guard let data = response.data else { return }
                do {
                    let info = try JSONDecoder().decode(ResponseJSON.self, from: data)
                    completion(info)
                }
                catch (let err) {
                    print(err)
                    completion(nil)
                }
                
        }
    }
}

