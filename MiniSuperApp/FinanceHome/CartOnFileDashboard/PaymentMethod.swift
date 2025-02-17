//
//  PaymentMethod.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import Foundation

struct PaymentMethod: Decodable {
  let id: String
  let name: String
  let digits: String
  let color: String
  let isPrimary: Bool
}
