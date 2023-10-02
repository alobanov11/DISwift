import Foundation

prefix operator *

public prefix func *<T>(container: DIContainer) -> T! {
    try? container.resolve()
}

public enum DIError: Error {
    case failedToResolve(String)
}

public final class DIContainer {
    public static let global = DIContainer()

    private let group = DIGroup()

	public init() {}

    subscript<T>(key: T.Type) -> T {
        *self
    }

	@discardableResult
	public func register(_ object: @autoclosure () -> DIObject) -> Self {
        let builder = object()
        builder.types.forEach { self.group[$0] = builder }
        return self
	}

	public func resolve<T>(_ objectType: T.Type = T.self) throws -> T {
        guard let object = self.group[DIType(objectType)]?.makeObject(self) as? T else {
            throw DIError.failedToResolve(String(describing: T.self))
        }
        return object
	}

    public func retrieve<T>(
        _ object: @autoclosure () -> DIObject,
        _ objectType: T.Type = T.self
    ) -> T {
        do {
            return try self.resolve(T.self)
        }
        catch {
            self.register(object())
            return *self
        }
    }
}
