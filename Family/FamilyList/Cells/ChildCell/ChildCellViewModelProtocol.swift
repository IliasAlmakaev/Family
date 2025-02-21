//
//  ChildCellViewModelProtocol.swift
//  Family
//
//  Created by Ilyas on 21.02.2025.
//

import Foundation

protocol ChildCellViewModelProtocol {
  var cellIdentifier: String { get }
  var cellHeight: Double { get }
  var name: String { get }
  var age: String { get }
  var child: Person { get }
  var delegate: ChildCellDelegate? { get set }
  init(child: Person)
}

final class ChildCellViewModel: ChildCellViewModelProtocol {
  var cellIdentifier: String {
    "ChildCell"
  }
  
  var cellHeight: Double {
    139
  }
  
  var name: String {
    child.name ?? ""
  }
  
  var age: String {
    child.age ?? ""
  }
  
  var child: Person
  
  var delegate: ChildCellDelegate?
  
  init(child: Person) {
    self.child = child
  }
}
