import ModernRIBs

protocol FinanceHomeDependency: Dependency {

}

final class FinanceHomeComponent: Component<FinanceHomeDependency>, SuperPayDashboardDependency {
  var balance: ReadOnlyCurrentValuePublisher<Double> { balancePublisher }
  private let balancePublisher: CurrentValuePublisher<Double>

  init(
    dependency: FinanceHomeDependency,
    balance: CurrentValuePublisher<Double>
  ) {
    self.balancePublisher = balance
    super.init(dependency: dependency)
  }
}

// MARK: - Builder

protocol FinanceHomeBuildable: Buildable {
  func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting
}

final class FinanceHomeBuilder: Builder<FinanceHomeDependency>, FinanceHomeBuildable {
  
  override init(dependency: FinanceHomeDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting {
    let balancePublisher = CurrentValuePublisher<Double>(10000)
    let component = FinanceHomeComponent(
      dependency: dependency,
      balance: balancePublisher
    )
    let viewController = FinanceHomeViewController()
    let interactor = FinanceHomeInteractor(presenter: viewController)

    let superPayDashboardBuilder = SuperPayDashboardBuilder(dependency: component)
    interactor.listener = listener
    return FinanceHomeRouter(
      interactor: interactor,
      viewController: viewController,
      superPayDashboardBuildable: superPayDashboardBuilder
    )
  }
}
