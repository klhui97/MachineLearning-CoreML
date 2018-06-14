//
//  ViewController.swift
//  MachineLearningProject
//
//  Created by KL on 13/6/2018.
//  Copyright © 2018 KL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    enum mlType: String{
        case LinearRegression = "Linear Regression"
        case ImageClassifierRiceSoup = "Rice and Soup Classifier"
        case FlowerClassifier = "Flower Classifier"
    }
    
    let examples: [mlType] = [.LinearRegression, .ImageClassifierRiceSoup, .FlowerClassifier]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Core ML Example"
        tableViewSetup()
    }
    
    func tableViewSetup(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Table View
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = examples[indexPath.row].rawValue
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch examples[indexPath.row]{
        case .LinearRegression:
            let vc = LinearRegressionViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .ImageClassifierRiceSoup:
            let vc = RiceSoupClassifierViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .FlowerClassifier:
            let vc = PlantClassifierViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
