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


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var count = 0
    var clickedMovie: Movie?
    var generosArray: Array<String> = []
    lazy var generos: Dictionary<String, Array<Movie>> = {
        var generos = [String:[Movie]]()
        for movie in movies {
            let generosArray = movie.type.components(separatedBy: ", ")
            for genero in generosArray {
                if (!generos.keys.contains(genero)) {
                    generos[genero] = []
                }
                generos[genero]?.append(movie)
            }
        }
        generosArray = Array(generos.keys)
        
//        print(generos)
//        print(generosArray)
        return generos
    }()
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections: \n \(generos)")
        return generosArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return generosArray[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 178)
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("Begin cellForRowAt: \n \(generos)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? MovieTableViewCell
        else {
            return UITableViewCell()
        }
//        print("Middle cellForRowAt: \n \(generos)")
        let genero = generosArray[indexPath.section]
        let movie = generos[genero]
        
//        print("Genero: \n\(genero)")
//        print("Movie: \n\(movie)")
        cell.movies = movie ?? []
//        print("Index \(indexPath.row)")
//        print(cell.movies.map({$0.title}))
        cell.width = view.frame.size.width
        cell.movieCollection.delegate = cell
        cell.movieCollection.dataSource = cell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }

    let movies = [Movie(ima:  #imageLiteral(resourceName: "2AwPvNHphpZBJDqjZKVuMAbvS0v"), title: "Wander", type: "Thriller, Crime, Mistério", sinopse: "Um investigador particular mentalmente instável é contratado para investigar uma morte suspeita na pequena cidade de Wander, ele se convence de que o caso está ligado a mesmo conspiração que causou a morte de sua filha."), Movie(ima: #imageLiteral(resourceName: "w3mj67aq6SsaDxV7il1KrDRvIXL"), title: "Legado Explosivo", type: "Ação, Thriller, Crime, Drama", sinopse: "Um ladrão de bancos tenta se entregar porque está se apaixonando e quer viver uma vida honesta ... mas quando ele percebe que os federais são mais corruptos do que ele, ele deve lutar para limpar seu nome."), Movie(ima: #imageLiteral(resourceName: "ldjx1dVWI4nKKtvvXjxP0HjAsjz"), title: "Os Croods 2: Uma Nova Era", type: "Aventura, Fantasia, Família, Animação", sinopse: "Após finalmente deixarem a caverna onde viviam, a família Crood esbarra na maior ameaça que encontraram desde então: uma outra família pré-histórica, os Bettermans.")]
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        print(generos.)
//        count += 1
//        print("numberOfItemsInSection \(count)")
//        return movies.count
//    }
//    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationView = segue.destination as? MovieViewController else {
            return
        }
        destinationView.movie = clickedMovie
//        if let index = clickedMovie {
//            destinationView.movie = movies[index]
//        }
    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCollectionViewCell
//        let index = indexPath.row
//        cell?.title.text = movies[index].title
//        cell?.poster.image = movies[index].ima
//        cell?.category.text = movies[index].type
//        cell?.movieDescription.text = movies[index].sinopse
//        print("cellForItemAt \(count)")
//        return cell ?? UICollectionViewCell()
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        clickedMovie = indexPath.row
//        performSegue(withIdentifier: "movieSelected", sender: self)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension ViewController : MovieTableViewCellDelegate {
    func didSelect(movie: Movie) {
        clickedMovie = movie
        performSegue(withIdentifier: "movieSelected", sender: self)
    }
}
