//
//  CardOnFileRepository.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

protocol CardOnFileRepository {
  var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { get }
}

final class CardOnFileRepositoryImp: CardOnFileRepository {
  var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { paymentMethodSubject }

  private let paymentMethodSubject = CurrentValuePublisher<[PaymentMethod]>([
    PaymentMethod(id: "0", name: "토스뱅크", digits: "0123", color: "#f19a38ff", isPrimary: true),
    PaymentMethod(id: "1", name: "케이뱅크", digits: "0123", color: "#3478f6ff", isPrimary: false),
    PaymentMethod(id: "2", name: "카카오뱅크", digits: "0123", color: "#789a38ff", isPrimary: false)
  ])
}
