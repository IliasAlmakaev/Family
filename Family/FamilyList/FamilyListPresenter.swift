//
//  FamilyListPresenter.swift
//  Family
//
//  Created by Ilyas on 20.02.2025.
//

import Foundation

struct FamilyListDataStore {
  var family: Family
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
    
  }
  
  func deleteChild() {
    
  }
  
  func clearFamily() {
    
  }
}

// MARK: - FamilyListInteractorOutputProtocol
extension FamilyListPresenter: FamilyListInteractorOutputProtocol {
  func familyDidReceive(with dataStore: FamilyListDataStore) {
    self.dataStore = dataStore
    
    let parentRows: [ParentCellViewModel] = [ParentCellViewModel(parent: dataStore.family.parent)]
    let childRows: [ChildCellViewModel] = dataStore.family.children.map {
      ChildCellViewModel(child: $0)
    }
    //TODO: добавить логику по показу/скрытию кнопки "Добавить ребёнка"
    view.reloadData(forParent: parentRows, andChildren: childRows)
  }
}
