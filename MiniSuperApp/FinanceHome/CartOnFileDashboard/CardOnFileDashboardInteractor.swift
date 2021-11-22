//
//  CardOnFileDashboardInteractor.swift
//  MiniSuperApp
//
//  Created by JH_OH on 2021/11/22.
//

import ModernRIBs
import Combine

protocol CardOnFileDashboardRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CardOnFileDashboardPresentable: Presentable {
  var listener: CardOnFileDashboardPresentableListener? { get set }

  func update(with viewModels: [PaymentMethodViewModel])
}

protocol CardOnFileDashboardListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

protocol CardOnFileDashboardInteractorDependency {
  var cardOnFileRepository: CardOnFileRepository { get }
}

final class CardOnFileDashboardInteractor: PresentableInteractor<CardOnFileDashboardPresentable>,
                                           CardOnFileDashboardInteractable,
                                           CardOnFileDashboardPresentableListener {

  weak var router: CardOnFileDashboardRouting?
  weak var listener: CardOnFileDashboardListener?

  private let dependency: CardOnFileDashboardInteractorDependency

  private var cancellables: Set<AnyCancellable>

  init(
    presenter: CardOnFileDashboardPresentable,
    dependency: CardOnFileDashboardInteractorDependency
  ) {
    self.dependency = dependency
    self.cancellables = Set<AnyCancellable>()
    super.init(presenter: presenter)
    presenter.listener = self
  }

  override func didBecomeActive() {
    super.didBecomeActive()
    dependency.cardOnFileRepository.cardOnFile.sink { methods in
      let viewModels = methods.prefix(5).map { PaymentMethodViewModel($0) }
      self.presenter.update(with: viewModels)

    }.store(in: &cancellables)
  }

  override func willResignActive() {
    super.willResignActive()
    cancellables.forEach { $0.cancel() }
    cancellables.removeAll()
  }
}
