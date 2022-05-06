//
//  Created by Антон Лобанов on 06.05.2022.
//

import Foundation

public final class DIObject {
	private(set) var types: [DIType] = []

	private let resolver: Any
	private let box: DIBox

	init(resolver: Any, box: DIBox) {
		self.resolver = resolver
		self.box = box
	}

	public static func `weak`<T: AnyObject>(_ resolver: @escaping (DIContainer) -> T) -> DIObject {
		.init(resolver: resolver, box: WeakBox()).as(T.self)
	}

	public static func single<T>(_ resolver: @escaping (DIContainer) -> T) -> DIObject {
		.init(resolver: resolver, box: SingleBox()).as(T.self)
	}

	public func `as`<T>(_ type: T.Type) -> Self {
		self.types.append(.init(type))
		return self
	}

	func makeObject(_ container: DIContainer) -> Any? {
		if let object = self.box.object { return object }

		let resolver = self.resolver as! (DIContainer) -> Any
		let object = resolver(container)

		self.box.object = object

		return object
	}
}
