//
//  IndexViewController.swift
//  SearchBarDemo
//
//  Created by Irvin Leon on 6/17/19.
//  Copyright © 2019 Vagasoft. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {


    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "predictive") {
            guard let mainVC  = segue.destination as? MainViewController else {
                return
            }
            mainVC.delegate = self
        }
    }

}
extension IndexViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "predictive", sender: nil)
    }
}
extension IndexViewController: PredictiveSearchDelegate {
    func sendResult(result: String) {
        print(result)
    }
}
