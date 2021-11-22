//
//  Combine+Utils.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import Combine
import CombineExt

public class ReadOnlyCurrentValuePublisher<Elements>: Publisher {
  public typealias Output = Elements
  public typealias Failure = Never

  public var value: Elements {
    currentValueRelay.value
  }

  fileprivate let currentValueRelay: CurrentValueRelay<Output>

  fileprivate init(_ initialValue: Elements) {
    currentValueRelay = CurrentValueRelay(initialValue)
  }

  public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Elements == S.Input {
    currentValueRelay.receive(subscriber: subscriber)
  }
}

public final class CurrentValuePublisher<Element>: ReadOnlyCurrentValuePublisher<Element> {
  typealias Output = Element
  typealias Failure = Never

  public override init(_ initialValue: Element) {
    super.init(initialValue)
  }

  public func send(_ value: Element) {
    currentValueRelay.accept(value)
  }
}
