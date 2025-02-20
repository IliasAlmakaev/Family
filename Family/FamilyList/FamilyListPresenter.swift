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
  
  private var dataStore: FamilyListDataStore?
  
  func viewDidLoad() {
    
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
  }
}
