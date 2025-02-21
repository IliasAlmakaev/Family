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
            family = getClearFamily()
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
  
  func addChild(completion: (Person) -> ()) {
    let person = Person()
    family?.children.append(person)
    save()
    completion(person)
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
    family = getClearFamily()
    save()
  }
  
  private func save() {
    if let encoded = try? JSONEncoder().encode(family) {
      UserDefaults.standard.set(encoded, forKey: key)
    }
  }
  
  private func getClearFamily() -> Family {
    Family(parent: Person(), children: [])
  }
}
