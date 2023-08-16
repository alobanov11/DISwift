import Foundation

protocol SpecificType {
	static var type: Any.Type { get }
}

extension Optional: SpecificType {
	static var type: Any.Type { Wrapped.self }
}
