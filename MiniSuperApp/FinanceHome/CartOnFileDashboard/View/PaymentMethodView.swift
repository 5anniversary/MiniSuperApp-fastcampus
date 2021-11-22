//
//  PaymentMethodView.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import UIKit

final class PaymentMethodView: UIView {

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 18, weight: .semibold)
    label.textColor = .white
    return label
  }()

  private let subTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 15, weight: .semibold)
    label.textColor = .white
    return label
  }()

  init(viewModel: PaymentMethodViewModel) {
    super.init(frame: .zero)

    render()
    nameLabel.text = viewModel.name
    subTitleLabel.text = viewModel.digits
    backgroundColor = viewModel.color
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)

    render()
  }

  private func render() {
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(nameLabel)
    addSubview(subTitleLabel)

    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

      subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
      subTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
