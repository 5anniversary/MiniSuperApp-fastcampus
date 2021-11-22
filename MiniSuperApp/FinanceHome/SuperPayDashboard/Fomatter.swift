//
//  Fomatter.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import Foundation

struct Formatter {
  static let balanceFormatter: NumberFormatter = {
    let fomatter = NumberFormatter()
    fomatter.numberStyle = .decimal
    return fomatter
  }()
}
