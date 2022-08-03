//
//  DetailViewController.swift
//  TestMVPNetwork
//
//  Created by Владимир on 16.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var commentLabel: UILabel!
    
    var presenterDVC: DetailViewPresenterProtocol! = nil
    var comment: Comment?
    let networkService = NetworkService()
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenterDVC = DetailPresenter(view: self, netWorkService: networkService, comment: comment)
        presenterDVC.setComment()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
    
    
}
