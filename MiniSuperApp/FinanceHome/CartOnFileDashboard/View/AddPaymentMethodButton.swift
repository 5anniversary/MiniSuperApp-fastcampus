//
//  AddPaymentMethodButton.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import UIKit

final class AddPaymentMethodButton: UIControl {
  private let plusIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(
      systemName: "plus",
      withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)
    )
    imageView.tintColor = .white
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    render()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  private func render() {
    addSubview(plusIcon)

    NSLayoutConstraint.activate([
      plusIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      plusIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
}
