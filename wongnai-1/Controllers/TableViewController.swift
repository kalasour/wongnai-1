//
//  TableViewController.swift
//  wongnai-1
//
//  Created by Nuntawat. Wisedsup on 9/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var gotData:Item?
    private var insertEvery:Int = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gotData = Item(handler: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    @IBAction private func refresh(_ sender: UIRefreshControl) {
        gotData?.refresh(handler: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                sender.endRefreshing()
            }
        })
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let unwrapData = gotData {
            return (unwrapData.getPhotos().count+(unwrapData.getPhotos().count/(insertEvery-1)))-1
        }else {
            return 0;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i:Int = indexPath.row + 1
        if(i % insertEvery != 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemTableViewCell else { return UITableViewCell()
            }
            
            if let unwrapData = gotData {
                let calIndex = (i-(i/insertEvery))-1
                cell.setProps(photo: unwrapData.getPhotos()[calIndex])
            }
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InsertCell") else { return UITableViewCell() }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView,willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let unwrapPhotos = gotData?.getPhotos() {
            let total = unwrapPhotos.count
            if(indexPath.row + 1 == total) {
                gotData?.getNextPage(handler: {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            }
        }
    }
}
