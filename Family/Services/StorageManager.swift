//
//  StorageManager.swift
//  Family
//
//  Created by Ilyas on 21.02.2025.
//

import Foundation

final class StorageManager {
  static let shared = StorageManager()
  
  private var family: Family?
  
  private init() {
    guard let data = UserDefaults.standard.data(forKey: "Family"),
          let decoded = try? JSONDecoder().decode(Family.self, from: data) else {
            return
          }
    
    family = decoded
  }
  
  func getFamily() -> Family? {
    family
  }
  
  func addParentName(_ name: String) {
    family?.parent.name = name
    save()
  }
  
  func addParentAge(_ age: Int) {
    family?.parent.age = age
    save()
  }
  
  func addChild() {
    family?.children.append(Person())
    save()
  }
  
  func addChildName(_ name: String, withIndex index: Int) {
    family?.children[index].name = name
    save()
  }
  
  func addChildAge(_ age: Int, withIndex index: Int) {
    family?.children[index].age = age
    save()
  }
  
  func deleteChild(withIndex index: Int) {
    family?.children.remove(at: index)
    save()
  }
  
  func clearFamily() {
    family = nil
    UserDefaults.standard.set(nil, forKey: "Family")
  }
  
  private func save() {
    if let encoded = try? JSONEncoder().encode(family) {
      UserDefaults.standard.set(encoded, forKey: "Family")
    }
  }
}
