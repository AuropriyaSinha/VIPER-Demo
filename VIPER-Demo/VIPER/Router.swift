//
//  Router.swift
//  VIPER-Demo
//
//  Created by Auropriya Sinha on 02/11/22.
//

import Foundation
import UIKit

//Object
//Entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry : EntryPoint? { get }
    static func start() -> AnyRouter
}

class UserRouter : AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        //Assign VIP
        var view : AnyView = UserViewController()
        var interactor : AnyInteractor = UserInteractor()
        var presenter : AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.getUsers()
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
