//
//  item.swift
//  wongnai_assignment_1
//
//  Created by Nuntawat. Wisedsup on 6/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import Foundation

class Item: Codable {
    private var current_page: Int?
    private var total_pages: Int?
    private var total_items: Int?
    private var feature: String?
    private var filters: Filter?
    private var photos: [Photo]?
    
    init(handler: @escaping (()->Void)) {
        if let url = URL(string: "https://api.500px.com/v1/photos?feature=popular&page=1") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Item.self, from: data)
                        self.current_page = res.current_page
                        self.total_pages = res.total_pages
                        self.total_items = res.total_items
                        self.feature = res.feature
                        self.filters = res.filters
                        self.photos = res.photos
                        handler()
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    public func refresh(handler: @escaping (()->Void)) {
        if let url = URL(string: "https://api.500px.com/v1/photos?feature=popular&page=1") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Item.self, from: data)
                        self.current_page = res.current_page
                        self.total_pages = res.total_pages
                        self.total_items = res.total_items
                        self.feature = res.feature
                        self.filters = res.filters
                        self.photos = res.photos
                        handler()
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    public func getNextPage(handler: @escaping (()->Void)) {
        if let url = URL(string: "https://api.500px.com/v1/photos?feature=popular&page=\((self.current_page ?? 0) + 1)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Item.self, from: data)
                        self.current_page = res.current_page
                        self.total_pages = res.total_pages
                        self.total_items = res.total_items
                        self.feature = res.feature
                        self.filters = res.filters
                        self.photos! += res.photos!
                        handler()
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    public func getPhotos() -> [Photo] {
        if let unwrapPhoto = self.photos {
            return unwrapPhoto
        } else {
            return []
        }
    }
}
