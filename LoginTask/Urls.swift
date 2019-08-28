//  URLsAPI.swift
//  LoginTask
//
//  Created by Tech Labs on 8/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import Foundation

struct APIServiceUrl {
    static let main = "https://cpanels.shop/testTask/api/"
    static let login = main + "LoginUser"
}
enum APIServiceError : Error {
    case invalidURL
    case invalidResponse
}
