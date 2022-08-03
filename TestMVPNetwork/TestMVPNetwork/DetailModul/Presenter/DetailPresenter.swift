//
//  DetailPresenter.swift
//  TestMVPNetwork
//
//  Created by Владимир on 16.05.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, netWorkService: NetworkServiceProtocol, comment: Comment?)
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol{
    
    var view: DetailViewProtocol
    let netWorkService: NetworkServiceProtocol!
    var comment: Comment?
    
    required init(view: DetailViewProtocol, netWorkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.netWorkService = netWorkService
        self.comment = comment
    }
    
   public func setComment() {
       self.view.setComment(comment: comment)
    }
}

