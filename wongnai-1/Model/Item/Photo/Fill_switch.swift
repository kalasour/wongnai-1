//
//  Fill_switch.swift
//  wongnai_assignment_1
//
//  Created by Nuntawat. Wisedsup on 6/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import Foundation
struct Fill_switch: Codable{
       let access_deleted: Bool?
       let access_private: Bool?
       let include_deleted: Bool?
       let exclude_private: Bool?
       let exclude_nude: Bool?
       let always_exclude_nude: Bool?
       let exclude_block: Bool?
       let current_user_id: Int?
       let only_user_active: Bool?
       let include_tags: Bool?
       let include_geo: Bool?
       let include_licensing: Bool?
       let include_admin_locks: Bool?
       let include_like_by: Bool?
       let include_comments: Bool?
       let include_user_info: Bool?
       let include_follow_info: Bool?
       let include_equipment_info: Bool?
    
}
