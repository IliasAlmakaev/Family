//
//  FamilyListViewController.swift
//  Family
//
//  Created by Ilyas on 19.02.2025.
//

import UIKit

class FamilyListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var clearButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  @IBAction func clearButtonPressed() {
  }
  
  private func setupUI() {
    
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
      return 3
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ParentCell", for: indexPath)
      guard let cell = cell as? ParentCell else { return UITableViewCell() }
      
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
      
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ChildCell", for: indexPath)
      guard let cell = cell as? ChildCell else { return UITableViewCell() }
      
      // TODO: - Добавить корректную проверку на последнюю ячейку
      if indexPath.row == 2 {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
      }
      
      return cell
    }
  }
  
  
}
