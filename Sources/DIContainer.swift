//
//  Created by Антон Лобанов on 08.04.2022.
//

import UIKit

prefix operator *

public prefix func *<T>(container: DIContainer) -> T {
	container.resolve()
}

public final class DIContainer {
	private var objects: [[DIType]: DIObject] = [:]

	public init(_ frameworks: [DIFramework] = []) {
		frameworks.forEach { $0.register(with: self) }
	}

	@discardableResult
	public func register(_ object: @autoclosure () -> DIObject) -> Self {
		let builder = object()
		self.objects[builder.types] = builder
		return self
	}

	public func resolve<T>(_ objectType: T.Type = T.self) -> T! {
		self.objects
			.first { $0.key.contains(DIType(objectType)) }?
			.value
			.makeObject(self) as? T
	}
}
