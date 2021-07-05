//
//  BasicAnimation.swift
//  CoreAnimationDemo
//
//  Created by GDM on 2021/7/5.
//

//ps: https://www.jianshu.com/p/d05d19f70bac


import UIKit

class BasicAnimation: UIViewController {
  
  lazy var mainComponent: Components = {
    let component = Components()
    component.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    component.imgView.image = UIImage(systemName: "pencil.tip.crop.circle")?.withTintColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), renderingMode: .alwaysOriginal)
    return component
  }()
  
  lazy var subComponent1: Components = {
    let component = Components()
    component.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    component.imgView.image = UIImage(systemName: "creditcard.fill")?.withTintColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), renderingMode: .alwaysOriginal)
    return component
  }()
  
  lazy var subComponent2: Components = {
    let component = Components()
    component.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    component.imgView.image = UIImage(systemName: "square.and.arrow.up.fill")?.withTintColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), renderingMode: .alwaysOriginal)
    return component
  }()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    print(#function)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    print(#function)
  }
  
  override func loadViewIfNeeded() {
    print(#function)
  }
  
  override func viewDidLoad() {
    print(#function)
    super.viewDidLoad()
    basicSetting()
    initUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print(#function)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    print(#function)
  }
  
  
  override func viewWillDisappear(_ animated: Bool) {
    print(#function)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    print(#function)
  }
  
  override func viewSafeAreaInsetsDidChange() {
    print(#function)
  }
  
  override func didReceiveMemoryWarning() {
    print(#function)
  }
  
  deinit {
    print(#function)
  }
  
  func basicSetting() {
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  override func viewLayoutMarginsDidChange() {
    print(#function)
  }
  
  override func viewWillLayoutSubviews() {
    print(#function)
  }
  
  override func viewDidLayoutSubviews() {
    print(#function)
    mainComponent.snp.remakeConstraints {
      $0.width.equalTo(300)
      $0.height.equalTo(150)
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview().multipliedBy(0.5)
    }
    subComponent1.snp.remakeConstraints {
      $0.width.height.equalTo(mainComponent).multipliedBy(0.5)
      $0.left.equalTo(mainComponent)
      $0.top.equalTo(mainComponent.snp.bottom).offset(20)
    }
    subComponent2.snp.remakeConstraints {
      $0.width.height.equalTo(mainComponent).multipliedBy(0.5)
      $0.right.equalTo(mainComponent)
      $0.top.equalTo(mainComponent.snp.bottom).offset(20)
    }
    cornerRadius(mainComponent.layer)
  }
  
  func initUI() {
    view.addSubview(mainComponent)
    view.addSubview(subComponent2)
    view.addSubview(subComponent1)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    position(subComponent1.layer)
//    DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [self] in
//      subComponent1.layer.removeAnimation(forKey: "PostionAnimation")
//    }
    
//    positionX(subComponent1.layer)
//    positionY(subComponent1.layer)
//    rotation(mainComponent.layer)
//    rotation(mainComponent.layer, direction: .z)
//    scale(mainComponent.layer)
//    translation(mainComponent.layer)
//    transformCombine(mainComponent.layer)
//    bounds(mainComponent.layer)
//    size(mainComponent.layer)
//    opacity(mainComponent.layer)
//    backgroundColor(mainComponent.layer)
    cornerRadius(mainComponent.layer)
  }

}

extension BasicAnimation: CAAnimationDelegate {
  // MARK: - position 平移
  /// 平移
  /// - Parameter layer: 被平移的view.layer
  func position(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "position")
    animation.toValue = mainComponent.center
    animation.isRemovedOnCompletion = false
    animation.fillMode = .forwards
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.duration = 3
    animation.repeatCount = 2
    layer.add(animation, forKey: "PostionAnimation")
  }
  
  func positionX(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "position.x")
    animation.toValue = mainComponent.center.x
    animation.isRemovedOnCompletion = false
    animation.fillMode = .forwards
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.duration = 3
    layer.add(animation, forKey: "PostionXAnimation")
  }
  
  func positionY(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "position.y")
    animation.toValue = mainComponent.center.y
    animation.isRemovedOnCompletion = false
    animation.fillMode = .forwards
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.duration = 3
    layer.add(animation, forKey: "PostionYAnimation")
  }
  
  // MARK: - rotation 旋转
  /// 旋转
  /// - Parameter layer: 被旋转的view.layer
  func rotation(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = 2
    /*若想旋转360 需要设置两个属性
     重复次数
     animation.repeatCount = 2
     累加
     animation.isCumulative = true
     */
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    
    animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat.pi, 1, 0, 0))
    layer.add(animation, forKey: "rotationAnimation")
  }
  
  enum RotationDirection: String {
    case x = "transform.rotation.x"
    case y = "transform.rotation.y"
    case z = "transform.rotation.z"
  }
  
  func rotation(_ layer: CALayer, direction: RotationDirection) {
    let animation = CABasicAnimation(keyPath: direction.rawValue)
    animation.delegate = self
    animation.duration = 2
    animation.repeatCount = 2
    animation.isCumulative = true
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .linear)
    animation.toValue = Double.pi
    layer.add(animation, forKey: "rotationAnimation \(direction.rawValue)")
  }
  
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    if flag {
//      rotation(mainComponent.layer, direction: .z)
    }
  }
  
  // MARK: scale 比例缩放放大
  func scale(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = 1
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//    animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(0.7, 0.7, 1))
    animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.2, 1.2, 1))
    layer.add(animation, forKey: "transformAnimation")
  }
  
  // MARK: translation 转换
  func translation(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = 1
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.toValue = NSValue(caTransform3D: CATransform3DMakeTranslation(0, -50, 0))
    layer.add(animation, forKey: "translationAnimation")
  }
  
  // MARK: transform combine 转变结合使用
  func transformCombine(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = 2
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    let makeRotation = CATransform3DMakeRotation(.pi, 1, 0, 0)
    let makeScale = CATransform3DMakeScale(0.7, 0.7, 1)
    let makeTranslation = CATransform3DMakeTranslation(0, -50, 0)
    let concat1 = CATransform3DConcat(makeRotation, makeScale)
    let concat2 = CATransform3DConcat(concat1, makeTranslation)
    animation.toValue = NSValue(caTransform3D: concat2)
    layer.add(animation, forKey: "transformCombineAnimation")
  }
  
  
  // MARK: bounds
  func bounds(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "bounds")
    animation.duration = 2
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.toValue = subComponent1.bounds
    layer.add(animation, forKey: "boundsAnimation")
  }
  
  // 还有单独改变 w 和 h的 keyPath分别为 bounds.size.width bounds.size.height
  func size(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "bounds.size")
    animation.duration = 2
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.toValue = subComponent1.bounds.size
    layer.add(animation, forKey: "sizeAnimation")
  }
  
  // MARK: opacity 不透明度
  func opacity(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.duration = 2
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.toValue = 0.5
    layer.add(animation, forKey: "opacityAnimation")
  }
  
  
  // MARK: backgroundColor 背景色
  func backgroundColor(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "backgroundColor")
    animation.duration = 2
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.toValue = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor
    layer.add(animation, forKey: "backgroundColorAnimation")
  }
  
  // MARK: backgroundColor 背景色
  func cornerRadius(_ layer: CALayer) {
    let animation = CABasicAnimation(keyPath: "cornerRadius")
    animation.duration = 2
    animation.fillMode = .forwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.toValue = layer.bounds.size.height / 2
    layer.add(animation, forKey: "cornerRadiusAnimation")
  }
}
