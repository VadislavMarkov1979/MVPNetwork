//
//  MainViewController.swift
//  TestMVPNetwork
//
//  Created by Владимир on 14.05.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var networkService = NetworkService()
    var presenter: MainViewPresenterProtocol!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(view: self, networkService: networkService)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        
        cell.textLabel?.text = comment?.body

        return cell
    }
}

extension MainTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailVC = segue.destination as? DetailViewController else { return }
        let comment = presenter.comments?[indexPath.row]
        
        detailVC.comment = comment
    }
}

extension MainTableViewController: MainViewProtocol {
    
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
