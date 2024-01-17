//
//  BookCollectionViewCell.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var bookImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
		bookImage.contentMode = .scaleAspectFill
		descriptionLabel.numberOfLines = 0
	}

}
