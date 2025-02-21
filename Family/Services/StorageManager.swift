//
//  StorageManager.swift
//  Family
//
//  Created by Ilyas on 21.02.2025.
//

import Foundation

final class StorageManager {
  static let shared = StorageManager()
  
  private var family: Family!
  private let key = "Family"
  
  private init() {
    guard let data = UserDefaults.standard.data(forKey: key),
          let decoded = try? JSONDecoder().decode(Family.self, from: data) else {
            family = Family(parent: Person(name: "", age: ""), children: [])
            return
          }
    
    family = decoded
  }
  
  func getFamily() -> Family {
    family
  }
  
  func setParentName(_ name: String) {
    family?.parent.name = name
    save()
  }
  
  func setParentAge(_ age: String) {
    family?.parent.age = age
    save()
  }
  
  func addChild() {
    family?.children.append(Person())
    save()
  }
  
  func setChildName(_ name: String, withIndex index: Int) {
    family?.children[index].name = name
    save()
  }
  
  func setChildAge(_ age: String, withIndex index: Int) {
    family?.children[index].age = age
    save()
  }
  
  func deleteChild(withIndex index: Int) {
    family?.children.remove(at: index)
    save()
  }
  
  func clearFamily() {
    family = nil
    UserDefaults.standard.set(nil, forKey: key)
  }
  
  private func save() {
    if let encoded = try? JSONEncoder().encode(family) {
      UserDefaults.standard.set(encoded, forKey: key)
    }
  }
}
