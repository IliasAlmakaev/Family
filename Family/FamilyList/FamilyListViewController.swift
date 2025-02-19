//
//  FamilyListViewController.swift
//  Family
//
//  Created by Ilyas on 19.02.2025.
//

import UIKit

class FamilyListViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var clearButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }

  @IBAction func clearButtonPressed() {
  }
  
  private func setupUI() {
    if #available(iOS 15.0, *) {
      tableView.sectionHeaderTopPadding = 0.0
    }
  }
  
  @objc private func addMyChild() {
    
  }
  
  // TODO: - Скрывать клавиатуру
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
  }
}

// MARK: - UITableViewDataSource
extension FamilyListViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else {
      // TODO: - Добавить массив с детьми
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ParentCell", for: indexPath)
      guard let cell = cell as? ParentCell else { return UITableViewCell() }
      
      cell.nameTextField.delegate = self
      cell.ageTextField.delegate = self
      
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
      
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ChildCell", for: indexPath)
      guard let cell = cell as? ChildCell else { return UITableViewCell() }
      
      cell.nameTextField.delegate = self
      cell.ageTextField.delegate = self
      
      // TODO: - Добавить корректную проверку на последнюю ячейку
      if indexPath.row == 2 {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
      }
      
      return cell
    }
  }
}

// MARK: - UITableViewDelegate
extension FamilyListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 0 {
      let view = UIView()
      let label = UILabel()
      label.text = "Персональные данные"
      label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
      
      view.addSubview(label)
      
      label.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
      ])
      
      return view
    } else {
      let view = UIView()
      
      let label = UILabel()
      label.text = "Дети (макс. 5)"
      label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
      
      let button = UIButton()
      button.addTarget(self, action: #selector(addMyChild), for: .touchUpInside)
      button.setTitleColor(.systemBlue, for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
      button.setTitle("Добавить ребенка", for: .normal)
      button.setImage(UIImage(systemName: "plus"), for: .normal)
      
      view.addSubview(label)
      view.addSubview(button)
      
      label.translatesAutoresizingMaskIntoConstraints = false
      button.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
      ])
      
      return view
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    44
  }
}
