//
//  User.swift
//  wongnai_assignment_1
//
//  Created by Nuntawat. Wisedsup on 6/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int?
    let username: String?
    let fullname: String?
    let avatar_version: Int?
    let registration_date: String?
    let avatars: Avatars?
    let userpic_url: String?
    let userpic_https_url: String?
    let usertype: Int?
    let active: Int?
    let firstname: String?
    let lastname: String?
    let about: String?
    let city: String?
    let state: String?
    let country: String?
    let cover_url: String?
    let upgrade_status: Int?
    let affection: Int?
    let followers_count: Int?
    let following: Bool?
}
