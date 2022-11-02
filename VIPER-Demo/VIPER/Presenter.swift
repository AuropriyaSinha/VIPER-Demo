//
//  Presenter.swift
//  VIPER-Demo
//
//  Created by Auropriya Sinha on 02/11/22.
//

import Foundation

//object
//protocol
// Reference to Interactor, Router, View

enum FetchingError: Error {
    case failure
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidFetchUsers(with results : Result<[User], Error>)
}

class UserPresenter : AnyPresenter {
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
    func interactorDidFetchUsers(with results: Result<[User], Error>) {
        switch results {
        case .success(let users) :
            view?.update(with: users)
        case .failure(_) :
            view?.update(with: "Something wrong !")
        }
    }
}
