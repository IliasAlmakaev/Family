//
//  FamilyListConfigurator.swift
//  Family
//
//  Created by Ilyas on 20.02.2025.
//

import Foundation

protocol FamilyListConfiguratorInputProtocol {
  func configure(withView view: FamilyListViewController)
}

final class FamilyListConfigurator: FamilyListConfiguratorInputProtocol {
  func configure(withView view: FamilyListViewController) {
    let presenter = FamilyListPresenter(view: view)
    let interactor = FamilyListInteractor(presenter: presenter)
    
    view.presenter = presenter
    presenter.interactor = interactor
  }
}
