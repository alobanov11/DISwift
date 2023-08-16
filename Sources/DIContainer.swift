import Foundation

prefix operator *

public prefix func *<T>(container: DIContainer) -> T {
	container.resolve()
}

public final class DIContainer {
    public static let global = DIContainer()

	private var objects: [DIType: DIObject] = [:]

	public init(_ frameworks: [DIFramework] = []) {
        self.register(frameworks)
	}

    public func register(_ frameworks: [DIFramework]) {
        frameworks.forEach { $0.register(with: self) }
    }

	@discardableResult
	public func register(_ object: @autoclosure () -> DIObject) -> Self {
		let builder = object()
		builder.types.forEach { self.objects[$0] = builder }
		return self
	}

	public func resolve<T>(_ objectType: T.Type = T.self) -> T! {
		guard let object = self.objects[DIType(objectType)]?.makeObject(self) as? T else {
			fatalError("Could not resolve \(String(describing: T.self))")
		}
		return object
	}
}
