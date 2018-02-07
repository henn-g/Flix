//
//  DataViewController.swift
//  Flix
//
//  Created by Henry Guerra on 2/6/18.
//  Copyright © 2018 FREECODE. All rights reserved.
//

import UIKit

enum MovieKeys {
  static let title = "title"
  static let release_date = "release_date"
  static let overview = "overview"
  static let backdrop_path = "backdrop_path"
  static let poster_path = "poster_path"
  static let base_url = "https://image.tmdb.org/t/p/w500"
}

class DataViewController: UIViewController {

    // Public outlets
  @IBOutlet weak var backDropImageView: UIImageView!
  @IBOutlet weak var posterImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  
  var movie: [String: Any]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let movie = movie {
      titleLabel.text = movie[MovieKeys.title] as? String
      releaseLabel.text = movie[MovieKeys.release_date] as? String
      overviewLabel.text = movie[MovieKeys.overview] as? String
      let backDropPath = movie[MovieKeys.backdrop_path] as! String
      let posterPath = movie[MovieKeys.poster_path] as! String
      let baseURL = movie[MovieKeys.base_url] as! String
      
      let backdropURL = URL(string: baseURL + backDropPath)!
      backDropImageView.af_setImage(withURL: backdropURL)
      
      let posterPathURL = URL(string: baseURL + posterPath)!
      posterImage.af_setImage(withURL: posterPathURL)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  

}
