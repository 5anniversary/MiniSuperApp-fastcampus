//
//  CardOnFileDashboardViewController.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import ModernRIBs
import UIKit

protocol CardOnFileDashboardPresentableListener: AnyObject {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
}

final class CardOnFileDashboardViewController: UIViewController,
                                               CardOnFileDashboardPresentable,
                                               CardOnFileDashboardViewControllable {
  weak var listener: CardOnFileDashboardPresentableListener?

  private let headerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .fill
    stackView.distribution = .equalSpacing
    stackView.axis = .horizontal
    return stackView
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 22, weight: .semibold)
    label.text = "카드 및 계좌"
    return label
  }()

  private lazy var seeAllButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("전체보기", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(seeAllButtonDidTap), for: .touchUpInside)
    return button
  }()

  private let cardOnFileStackView: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.alignment = .fill
    stack.distribution = .equalSpacing
    stack.axis = .vertical
    stack.spacing = 12
    return stack
  }()

  private lazy var addMethodButton: AddPaymentMethodButton = {
    let button = AddPaymentMethodButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.roundCorners()
    button.backgroundColor = .systemGray4
    button.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
    return button
  }()

  init() {
    super.init(nibName: nil, bundle: nil)
    render()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func render() {
    view.addSubview(headerStackView)
    view.addSubview(cardOnFileStackView)

    headerStackView.addArrangedSubview(titleLabel)
    headerStackView.addArrangedSubview(seeAllButton)

    NSLayoutConstraint.activate([
      headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
      headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

      cardOnFileStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10),
      cardOnFileStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      cardOnFileStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      cardOnFileStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

      addMethodButton.heightAnchor.constraint(equalToConstant: 60)
    ])
  }

  @objc
  private func seeAllButtonDidTap() {
    print(#function)
  }

  @objc
  private func addButtonDidTap() {
    print(#function)
  }

  func update(with viewModels: [PaymentMethodViewModel]) {
    cardOnFileStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

    let views = viewModels.map { PaymentMethodView(viewModel: $0) }

    views.forEach {
      $0.roundCorners()
      cardOnFileStackView.addArrangedSubview($0)
    }

    cardOnFileStackView.addArrangedSubview(addMethodButton)

    let heightConstraints = views.map { $0.heightAnchor.constraint(equalToConstant: 60) }
    NSLayoutConstraint.activate(heightConstraints)
  }
}
