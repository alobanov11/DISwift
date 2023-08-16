import Foundation

protocol DIBox: AnyObject {
	var object: Any? { get set }
}

final class SingleBox: DIBox {
	var object: Any?
}

final class WeakBox: DIBox {
	var object: Any? {
		get { self.value }
		set { self.value = newValue as AnyObject }
	}

	private weak var value: AnyObject?
}
