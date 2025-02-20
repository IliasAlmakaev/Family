//
//  Family.swift
//  Family
//
//  Created by Ilyas on 21.02.2025.
//

import Foundation

struct Family: Codable {
  var parent: Person
  var children: [Person]
}
