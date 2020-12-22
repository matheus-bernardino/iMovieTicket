//
//  MovieCollectionViewCell.swift
//  iMovieTicket
//
//  Created by Matheus on 16/12/20.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func prepareForReuse() {
        poster.image = nil
        title.text = nil
        category.text = nil
        movieDescription = nil
    }
}
