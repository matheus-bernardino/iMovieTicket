//
//  MovieTableViewCell.swift
//  iMovieTicket
//
//  Created by Matheus on 15/12/20.
//

import UIKit

protocol MovieTableViewCellDelegate : class {
    func didSelect(movie: Movie)
}

class MovieTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var width: CGFloat = 0
    weak var delegate: MovieTableViewCellDelegate?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: 178)
    }
    
    @IBOutlet weak var movieViewCollection: UICollectionView!
    override func prepareForReuse() {
        delegate = nil
        movieViewCollection = nil
    }
    
    var movies = [Movie]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Movie: \n\(movies)")
        return movies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCollectionViewCell
        let index = indexPath.item
        cell?.title.text = movies[index].title
        cell?.poster.image = movies[index].ima
        cell?.category.text = movies[index].type
        cell?.movieDescription.text = movies[index].sinopse
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(movie: movies[indexPath.item])
//        clickedMovie = indexPath.row
//        performSegue(withIdentifier: "movieSelected", sender: self)
    }
    
//
    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieViewCollection.reloadData()
        // Initialization code
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    @IBOutlet weak var movieCollection: UICollectionView!
    
}
