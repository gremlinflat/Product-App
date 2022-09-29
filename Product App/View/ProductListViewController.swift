//
//  ViewController.swift
//  Product App
//
//  Created by Fahri Novaldi on 27/09/22.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var productTableView: UITableView = UITableView()
    var viewModel: ProductListViewModel = ProductListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupTableView()
        
        viewModel.fetchProducts {
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        }
    }
    
    func setupNavigationController(){
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        
        view.addSubview(productTableView)
        
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        productTableView.frame = view.bounds
        
        productTableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    
}

// MARK: TableView extensions
extension ProductListViewController: UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            viewModel.fetchNextPage {
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            }
        }
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.getProductsCount())
        return viewModel.getProductsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID) as! ProductCell
        cell.prepareCellfor(product: viewModel.getProduct(at: indexPath.row))
        cell.layer.cornerRadius = 20
        return cell
    }
    
}
