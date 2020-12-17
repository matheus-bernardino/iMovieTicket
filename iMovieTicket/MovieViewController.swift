//
//  MovieViewController.swift
//  iMovieTicket
//
//  Created by Matheus on 17/12/20.
//

import UIKit

class MovieViewController: UIViewController {

    
    var movie: Movie?
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var sinopse: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = self.movie {
            movieTitle.text = movie.title
            movieImage.image = movie.ima
            
            type.text = movie.type
            sinopse.text = movie.sinopse
            sinopse.sizeToFit()
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
