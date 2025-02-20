//
//  FamilyListInteractor.swift
//  Family
//
//  Created by Ilyas on 20.02.2025.
//

import Foundation

protocol FamilyListInteractorInputProtocol {
  
}

protocol FamilyListInteractorOutputProtocol: AnyObject {
  
}

final class FamilyListInteractor: FamilyListInteractorInputProtocol {
  
  private unowned let presenter: FamilyListInteractorOutputProtocol
  private var family: Family!
  
  required init(presenter: FamilyListInteractorOutputProtocol) {
    self.presenter = presenter
  }
}
