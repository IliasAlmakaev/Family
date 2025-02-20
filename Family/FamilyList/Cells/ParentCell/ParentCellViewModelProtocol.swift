//
//  ParentCellViewModelProtocol.swift
//  Family
//
//  Created by Ilyas on 21.02.2025.
//

import Foundation

protocol ParentCellViewModelProtocol {
  var cellIdentifier: String { get }
  var cellHeight: Double { get }
  var name: String { get }
  var age: String { get }
  var parent: Person { get }
  init(parent: Person)
}

final class ParentCellViewModel: ParentCellViewModelProtocol {
  var cellIdentifier: String {
    "ParentCell"
  }
  
  var cellHeight: Double {
    107
  }
  
  var name: String {
    parent.name ?? ""
  }
  
  var age: String {
    "\(parent.age ?? 0)"
  }
  
  var parent: Person
  
  init(parent: Person) {
    self.parent = parent
  }
}
