//
//  DetailViewController.swift
//  Flix
//
//  Created by Henry Guerra on 2/13/18.
//  Copyright © 2018 FREECODE. All rights reserved.
//

import UIKit

enum MovieKeys {
  static let title = "title"
  static let release = "release_date"
  static let overview = "overview"
  static let backdropPath = "backdrop_path"
  static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {
  
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  
  var movie: [String: Any]?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let movie = movie {
      titleLabel.text = movie[MovieKeys.title] as? String
      releaseDateLabel.text = movie[MovieKeys.release] as? String
      overviewLabel.text = movie[MovieKeys.overview] as? String
      let backdropPathString = movie[MovieKeys.backdropPath] as! String
      let posterPathString = movie[MovieKeys.posterPath] as! String
      let baseURLString = "https://image.tmdb.org/t/p/w500"
      let backdropURL = URL(string: baseURLString + backdropPathString)!
      backdropImageView.af_setImage(withURL: backdropURL)
      let posterPathURL = URL(string: baseURLString + posterPathString)!
      posterImageView.af_setImage(withURL: posterPathURL)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
