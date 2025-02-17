//
//  PaymentMethodViewModel.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import UIKit

struct PaymentMethodViewModel {
  let name: String
  let digits: String
  let color: UIColor

  init(_ paymentMethod: PaymentMethod) {
    name = paymentMethod.name
    digits = "*** \(paymentMethod.digits)"
    color = UIColor(hex: paymentMethod.color) ?? .systemGray2
  }
}
