//
//  ViewController.swift
//  Product App
//
//  Created by Fahri Novaldi on 27/09/22.
//

import UIKit

class ProductViewController: UIViewController {

    let productTableView: UITableView = UITableView()
    var products: [Product] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTableView()
    }
    
    func setupNavigationController(){
        title = "ProductList"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupTableView() {
        view.addSubview(productTableView)
        
        NSLayoutConstraint.activate([
            productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTableView.topAnchor.constraint(equalTo: view.topAnchor),
            productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        productTableView.delegate = self
        productTableView.dataSource = self
        
    }

}

// MARK: TableView extensions
extension ProductViewController: UITableViewDelegate {
    
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: implement return cell
    }
    
    
}
