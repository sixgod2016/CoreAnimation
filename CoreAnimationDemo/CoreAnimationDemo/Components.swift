//
//  Components.swift
//  CoreAnimationDemo
//
//  Created by GDM on 2021/7/5.
//

import UIKit

class Components: UIView {
  
  lazy var imgView: UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    return imgView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    imgView.snp.remakeConstraints {
      $0.width.height.equalTo(frame.size.width / 4)
      $0.center.equalToSuperview()
    }
  }
  
  func initUI() {
    self.addSubview(imgView)
  }
}
