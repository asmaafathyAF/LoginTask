//
//  UserModel.swift
//  TamatmayaIOS
//
//  Created by Tech Labs on 8/27/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import Foundation
 
struct UserModel:Codable{
    var user_id:Int?
    var role_id:String?
    var city_id:String?
    var user_firstname:String?
    var user_lastname:String?
    var user_email:String?
    var user_mobile:String?
    var is_active:String?
    var user_lat:String?
    var user_lng:String?
    var email_verified_at:String?
    var created_at:String?
    var updated_at:String?
    var user_rate:String?
    var user_rate_count:String?
    var extra_mobile:String?
    var user_bio:String?
    var confirm_code:String?
    var is_confirmed:String?
    var is_accepted:String?
    var user_img:String?
    var user_header:String?
    var role:String?
    var upload_id:String?
    var proff:String?
    var sub_proff:String?
    var price_id:String?
    var user_credit:String?
    var lang:String?
    var recover:String?
    var my_followers:String?
    var following:String?
    var is_verified:String?
}
enum CodingKeys: String, CodingKey {
  case id , name = "city"
}
