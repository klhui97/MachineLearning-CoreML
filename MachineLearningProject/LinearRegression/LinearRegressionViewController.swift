//
//  LinearRegressionViewController.swift
//  MachineLearningProject
//
//  Created by KL on 13/6/2018.
//  Copyright © 2018 KL. All rights reserved.
//

import UIKit

class LinearRegressionViewController: UIViewController {

    let reviews = Vegas_Reviews() // Model
    
    @IBOutlet var nrReviews: UISlider!
    @IBOutlet var nrHotelReviews: UISlider!
    @IBOutlet var stars: UISegmentedControl!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var nrReviewsLabel: UILabel!
    @IBOutlet var nrHotelReviewsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.makePrediction(self)
    }
    
    @IBAction func makePrediction(_ sender: Any) {
        let nrReviewsSelected = Double(nrReviews.value)
        let nrHotelReviewsSelected = Double(nrHotelReviews.value)
        
        self.nrReviewsLabel.text = "Nr. Reviews: " + String(nrReviewsSelected)
        self.nrHotelReviewsLabel.text = "Nr. Hotel Reviews： " + String(nrHotelReviewsSelected)
        
        var starsSelected: Double{
            switch stars.selectedSegmentIndex {
            case 0:
                return 3.0
            case 1:
                return 4.0
            case 2:
                return 5.0
            default:
                return 5.0
            }
        }
        
        if let predictions = try? self.reviews.prediction(Nr__reviews: nrReviewsSelected, Nr__hotel_reviews: nrHotelReviewsSelected, Hotel_stars: starsSelected){
            
            let scoreFormatter = NumberFormatter()
            scoreFormatter.numberStyle = .decimal
            scoreFormatter.maximumFractionDigits = 1
            if let scoreText = scoreFormatter.string(for: predictions.Score){
                self.scoreLabel.text = "Score: " + scoreText
            }
        }else{
            print("Error")
        }
    }

}
