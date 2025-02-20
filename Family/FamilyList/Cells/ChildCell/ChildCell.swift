//
//  ChildCell.swift
//  Family
//
//  Created by Ilyas on 19.02.2025.
//

import UIKit
import DTTextField

protocol ChildCellModelRepresentable {
  var viewModel: ChildCellViewModelProtocol? { get }
}

class ChildCell: UITableViewCell {

  @IBOutlet weak var nameTextField: DTTextField!
  @IBOutlet weak var ageTextField: DTTextField!
  
  var viewModel: ChildCellViewModelProtocol? {
    didSet {
      updateView()
    }
  }
  
  weak var delegate: ChildCellDelegate?
  
  private func updateView() {
    guard let viewModel = viewModel as? ChildCellViewModel else { return }
    
    delegate = viewModel.delegate
    
    nameTextField.text = viewModel.name
    ageTextField.text = viewModel.age
  }

  @IBAction func deleteButtonTapped() {
    delegate?.deleteChild(withCell: self)
  }
}
