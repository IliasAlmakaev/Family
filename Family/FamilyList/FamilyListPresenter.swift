//
//  FamilyListPresenter.swift
//  Family
//
//  Created by Ilyas on 20.02.2025.
//

import Foundation

struct FamilyListDataStore {
  var family: Family?
  var child: Person?
  var index: Int?
}

final class FamilyListPresenter: FamilyListViewOutputProtocol {
  
  var interactor: FamilyListInteractorInputProtocol!
  
  private unowned let view: FamilyListViewInputProtocol
  private var dataStore: FamilyListDataStore?
  
  required init(view: FamilyListViewInputProtocol) {
    self.view = view
  }
  
  func viewDidLoad() {
    interactor.getFamily()
  }
  
  func setPersonInfo(
    withIndexPath indexPath: IndexPath,
    textFieldTag: Int,
    andText text: String
  ) {
    if indexPath.section == 0 {
      textFieldTag == 0 ? interactor.setParentName(text) : interactor.setParentAge(text)
    } else {
      textFieldTag == 0 ?
      interactor.setChildName(text, withIndex: indexPath.row) :
      interactor.setChildAge(text, withIndex: indexPath.row)
    }
  }

  
  func addMyChild() {
    interactor.addChild()
  }
  
  func deleteChild(withIndex index: Int) {
    interactor.deleteChild(withIndex: index)
  }
  
  func clearFamily() {
    interactor.clearFamily()
  }
}

// MARK: - FamilyListInteractorOutputProtocol
extension FamilyListPresenter: FamilyListInteractorOutputProtocol {
  func addChild(with dataStore: FamilyListDataStore) {
    guard let child = dataStore.child else { return }
    self.dataStore?.family?.children.append(child)
    
    guard let family = self.dataStore?.family else { return }
    let childRows: [ChildCellViewModel] = family.children.map {
      ChildCellViewModel(child: $0)
    }
    
    view.addChild(forChildren: childRows)
  }
  
  func deleteChild(with dataStore: FamilyListDataStore) {
    guard let index = dataStore.index else { return }
    self.dataStore?.family?.children.remove(at: index)
    
    guard let family = self.dataStore?.family else { return }
    let childRows: [ChildCellViewModel] = family.children.map {
      ChildCellViewModel(child: $0)
    }
    
    view.deleteChild(forChildren: childRows, andIndex: index)
  }
  
  func familyDidReceive(with dataStore: FamilyListDataStore) {
    reloadData(with: dataStore)
  }
  
  func clearFamily(with dataStore: FamilyListDataStore) {
    reloadData(with: dataStore)
  }
  
  private func reloadData(with dataStore: FamilyListDataStore) {
    self.dataStore = dataStore
    guard let family = dataStore.family else { return }
    
    let parentRows: [ParentCellViewModel] = [ParentCellViewModel(parent: family.parent)]
    let childRows: [ChildCellViewModel] = family.children.map {
      ChildCellViewModel(child: $0)
    }
    
    view.reloadData(forParent: parentRows, andChildren: childRows)
  }
}
