//
//  ParentCell.swift
//  Family
//
//  Created by Ilyas on 19.02.2025.
//

import UIKit
import DTTextField

protocol ParentCellModelRepresentable {
  var viewModel: ParentCellViewModelProtocol { get }
}

class ParentCell: UITableViewCell {

  @IBOutlet weak var nameTextField: DTTextField!
  @IBOutlet weak var ageTextField: DTTextField!
  
  var viewModel: ParentCellViewModelProtocol? {
    didSet {
      updateView()
    }
  }
  
  private func updateView() {
    guard let viewModel = viewModel as? ParentCellViewModel else { return }
    
    nameTextField.text = viewModel.name
    ageTextField.text = viewModel.age
  }
}
