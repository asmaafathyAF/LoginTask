//
//  LoginAPI.swift
//  TamatmayaIOS
//
//  Created by Tech Labs on 8/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginAPI {
    public static let shared = LoginAPI()
     private init() {}
     func login(email: String , password: String ,completion:@escaping (_ response: Result<Bool> , _ responseMessage: String)->Void) {
        let parameters = ["login": email , "password": password]
        guard let url =  URL(string: APIServiceUrl.login) else {
            completion(.failure(APIServiceError.invalidURL),"")
            return}
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .failure(_):
                    completion(.failure(APIServiceError.invalidResponse),"")
                case .success(let success):
                    let json = JSON(success)
                    do {
                    let jsonData = try json["data"]["user"].rawData()
                            print(jsonData)
                            let decoder = JSONDecoder()
                            do {
                                let user = try decoder.decode(UserModel.self, from: jsonData)
                                completion(.success(true),json["message"].string!)
                                self.saveToUserDefaults(userName: user.user_firstname!)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    catch {
                        completion(.success(false),json["message"].string!)
                    }
                }
        }
    }
      private func saveToUserDefaults (userName : String) {
         UserDefaults.standard.set(userName, forKey: "userName")
              }
}
