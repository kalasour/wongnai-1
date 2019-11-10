//
//  TableViewController.swift
//  wongnai-1
//
//  Created by Nuntawat. Wisedsup on 9/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var gotData: Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gotData = Item(handler: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let unwrapData = gotData {
            return unwrapData.getPhotos().count
        }else {
            return 0;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemTableViewCell else { return UITableViewCell()
        }
        
        if let unwrapData = gotData {
            cell.setProps(photo: unwrapData.getPhotos()[indexPath.row])
        }
        return cell
    }
}
