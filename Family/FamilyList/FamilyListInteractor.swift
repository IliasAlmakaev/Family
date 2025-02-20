//
//  FamilyListInteractor.swift
//  Family
//
//  Created by Ilyas on 20.02.2025.
//

import Foundation

protocol FamilyListInteractorInputProtocol {
  func getFamily()
}

protocol FamilyListInteractorOutputProtocol: AnyObject {
  func familyDidReceive(with dataStore: FamilyListDataStore)
}

final class FamilyListInteractor: FamilyListInteractorInputProtocol {
  
  private unowned let presenter: FamilyListInteractorOutputProtocol
  private let storageManager = StorageManager.shared
  
  required init(presenter: FamilyListInteractorOutputProtocol) {
    self.presenter = presenter
  }
  
  func getFamily() {
    guard let family = storageManager.getFamily() else { return }
    let dataStore = FamilyListDataStore(family: family)
    presenter.familyDidReceive(with: dataStore)
  }
  
  //TODO: Добавить функции добавления, удаления
}
