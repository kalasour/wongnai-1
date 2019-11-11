//
//  ItemTableViewCell.swift
//  wongnai-1
//
//  Created by Nuntawat. Wisedsup on 9/11/2562 BE.
//  Copyright © 2562 Nuntawat. Wisedsup. All rights reserved.
//

import UIKit

extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
    
    var delimiter: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet private var name: UILabel!
    @IBOutlet private var voted: UILabel!
    @IBOutlet private var img: UIImageView!
    @IBOutlet private var detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setProps(photo:Photo?) {
        if let unwrapPhoto = photo {
            self.name.text = (unwrapPhoto.name)!
            self.voted.text = ((unwrapPhoto.positive_votes_count)!).delimiter
            self.detail.text = (unwrapPhoto.description)!
            if let imageURL = URL(string: (unwrapPhoto.image_url)![0]) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.img.image = image
                            self.img.layer.masksToBounds = true
                        }
                    }
                }
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
