//
//  ImageCollectionViewCell.swift
//  flickerImages
//
//  Created by yasmeen on 11/13/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Image: UIImageView!
    func configrationCell(photo :photo) {
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1.0
        
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
        let u = photo.url_z
        if let url = URL(string: u ?? ""){
            print()
            do{
                let data = try Data(contentsOf: url)
                self.Image.image = UIImage(data: data)
                print(true)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        
    }
}
