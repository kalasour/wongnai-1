//
//  Avatars.swift
//  wongnai_assignment_1
//
//  Created by Nuntawat. Wisedsup on 6/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import Foundation
struct avatar: Codable {
    let https: String?
}

struct Avatars: Codable {
    let tiny: avatar?
    let small: avatar?
    let large: avatar?
    let _default: avatar?
}
