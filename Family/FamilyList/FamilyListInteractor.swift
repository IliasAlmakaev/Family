//
//  FamilyListInteractor.swift
//  Family
//
//  Created by Ilyas on 20.02.2025.
//

import Foundation

protocol FamilyListInteractorInputProtocol {
  func getFamily()
  func setParentName(_ name: String)
  func setParentAge(_ age: String)
  func setChildName(_ name: String, withIndex index: Int)
  func setChildAge(_ age: String, withIndex index: Int)
  func addChild()
  func deleteChild(withIndex index: Int)
  func clearFamily()
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
    let dataStore = FamilyListDataStore(family: storageManager.getFamily())
    presenter.familyDidReceive(with: dataStore)
  }
  
  func setParentName(_ name: String) {
    storageManager.setParentName(name)
  }
  
  func setParentAge(_ age: String) {
    storageManager.setParentAge(age)
  }
  
  func setChildName(_ name: String, withIndex index: Int) {
    storageManager.setChildName(name, withIndex: index)
  }
  
  func setChildAge(_ age: String, withIndex index: Int) {
    storageManager.setChildAge(age, withIndex: index)
  }
  
  func addChild() {
    storageManager.addChild()
  }
  
  func deleteChild(withIndex index: Int) {
    storageManager.deleteChild(withIndex: index)
  }
  
  func clearFamily() {
    storageManager.clearFamily()
  }
}
