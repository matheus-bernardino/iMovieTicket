//
//  ViewController.swift
//  iMovieTicket
//
//  Created by Matheus on 15/12/20.
//

import UIKit


struct Movie {
    var ima: UIImage
    var title: String
    var type: String
    var sinopse: String
}


class ViewController: UIViewController, UICollectionViewDataSource, UITableViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var clickedMovie: Int?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 178)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? MovieTableViewCell
        else {
            return UITableViewCell()
        }
        cell.movieCollection.delegate = self
        cell.movieCollection.dataSource = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }
    
    let movies = [Movie(ima:  #imageLiteral(resourceName: "2AwPvNHphpZBJDqjZKVuMAbvS0v"), title: "Wander", type: "Thriller, Crime, Mistério", sinopse: "Um investigador particular mentalmente instável é contratado para investigar uma morte suspeita na pequena cidade de Wander, ele se convence de que o caso está ligado a mesmo conspiração que causou a morte de sua filha."), Movie(ima: #imageLiteral(resourceName: "w3mj67aq6SsaDxV7il1KrDRvIXL"), title: "Legado Explosivo", type: "Ação, Thriller, Crime, Drama", sinopse: "Um ladrão de bancos tenta se entregar porque está se apaixonando e quer viver uma vida honesta ... mas quando ele percebe que os federais são mais corruptos do que ele, ele deve lutar para limpar seu nome."), Movie(ima: #imageLiteral(resourceName: "ldjx1dVWI4nKKtvvXjxP0HjAsjz"), title: "Os Croods 2: Uma Nova Era", type: "Aventura, Fantasia, Família, Animação", sinopse: "Após finalmente deixarem a caverna onde viviam, a família Crood esbarra na maior ameaça que encontraram desde então: uma outra família pré-histórica, os Bettermans.")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationView = segue.destination as? MovieViewController else {
            return
        }
        
        if let index = clickedMovie {
            destinationView.movie = movies[index]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCollectionViewCell
        let index = indexPath.row
        cell?.title.text = movies[index].title
        cell?.poster.image = movies[index].ima
        cell?.category.text = movies[index].type
        cell?.movieDescription.text = movies[index].sinopse
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clickedMovie = indexPath.row
        performSegue(withIdentifier: "movieSelected", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

