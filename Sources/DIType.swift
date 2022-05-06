//
//  Created by Антон Лобанов on 07.05.2022.
//

import Foundation

struct DIType {
	let type: Any.Type
	let name: String

	init<T>(_ type: T.Type) {
		if let specificType = T.self as? SpecificType.Type {
			self.type = specificType.type
			self.name = String(describing: specificType.type.self)
		}
		else {
			self.type = type
			self.name = String(describing: type.self)
		}
	}
}

extension DIType: Hashable {
	static func == (lhs: DIType, rhs: DIType) -> Bool {
		lhs.name == rhs.name
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(self.name)
	}
}
