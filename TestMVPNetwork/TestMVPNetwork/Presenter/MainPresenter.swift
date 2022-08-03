//
//  MainPresenter.swift
//  TestMVPNetwork
//
//  Created by Владимир on 14.05.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
//    Функция отображения данных, если данные пришли из интрнета
    func succes()
//    Если пришла ошибка, отображаем во вью ошибку
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
//    Запрашиваем данные
    func getComments()
//    Считываем и меняем комментарии ( get set )
    var comments: [Comment]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    
    unowned var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
//        Когда вызываетс инициализатор - вызывем метод запроса данных
        getComments()
    }
    
    func getComments() {
        networkService?.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
