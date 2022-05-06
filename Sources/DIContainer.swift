//
//  Created by Антон Лобанов on 08.04.2022.
//

import UIKit

prefix operator *

public prefix func *<T>(container: DIContainer) -> T {
	container.resolve()
}

public final class DIContainer {
	private var objects: [[String]: DIObject] = [:]

	public init(_ frameworks: [DIFramework] = []) {
		frameworks.forEach { $0.register(with: self) }
	}

	@discardableResult
	func register(_ object: @autoclosure () -> DIObject) -> Self {
		let builder = object()
		self.objects[builder.types] = builder
		return self
	}

	func resolve<T>(_ objectType: T.Type = T.self) -> T! {
		self.objects
			.first { $0.key.contains(String(describing: T.self)) }?
			.value
			.makeObject(self, T.self)
	}
}
