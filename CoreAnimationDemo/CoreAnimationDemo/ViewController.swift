//
//  ViewController.swift
//  CoreAnimationDemo
//
//  Created by GDM on 2021/7/5.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  let cellIdentifier = "UITableViewCell"
  
  let titles = ["CABasicAnimation", "CAKeyframeAnimation", "CATransition", "CAAnimationGroup", "CASpringAnimation"]
  
  lazy var list: UITableView = {
    let frame = UIScreen.main.bounds
    let list = UITableView(frame: frame, style: .grouped)
    list.dataSource = self
    list.delegate = self
    list.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    return list
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    basicSetting()
    initUI()
  }
  
  func basicSetting() {
    title = "Core Animation"
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  func initUI() {
    view.addSubview(list)
  }
  
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return titles.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    cell.textLabel?.text = titles[indexPath.section]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    switch indexPath.section {
    case 0:
      let next = BasicAnimation()
      navigationController?.pushViewController(next, animated: true)
    default:
      break
    }
  }
  
}

