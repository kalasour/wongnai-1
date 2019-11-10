//
//  Photo.swift
//  wongnai_assignment_1
//
//  Created by Nuntawat. Wisedsup on 6/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: Int?
    let created_at: String?
    let privacy: Bool?
    let profile: Bool?
    let url: String?
    let user_id: Int?
    let status: Int?
    let width: Int?
    let height: Int?
    let rating: Float?
    let highest_rating: Float?
    let highest_rating_date: String?
    let image_format: String?
    let images: [Images]?
    let image_url: [String]?
    let name: String?
    let description: String?
    let category: Int?
    let taken_at: String?
    let shutter_speed: String?
    let focal_length: String?
    let aperture: String?
    let lens: String?
    let iso: String?
    let location: String?
    let latitude: Float?
    let longitude: Float?
    let nsfw: Bool?
    let privacy_level: Int?
    let watermark: Bool?
    let has_nsfw_tags: Bool?
    let liked: Int?
    let voted: Int?
    let comments_count: Int?
    let votes_count: Int?
    let positive_votes_count: Int?
    let times_viewed: Int?
    let user: User?
    let editors_choice: Bool?
    let editors_choice_date: String?
    let editored_by: String?
    let feature: String?
    let feature_date: String?
    let fill_switch: Fill_switch?
}
