//
//  MainCell.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 19.08.22.
//

import UIKit
import Kingfisher

class MainCell: UITableViewCell {

    @IBOutlet weak var pixabayImage: UIImageView!
    @IBOutlet weak var imageAuth: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: PixabayImage) {
        pixabayImage.kf.setImage(with: URL(string: item.previewURL ?? ""))
        imageAuth.text = item.user
    }
}


