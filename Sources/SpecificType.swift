//
//  Created by Антон Лобанов on 07.05.2022.
//

import Foundation

protocol SpecificType {
	static var type: Any.Type { get }
}

extension Optional: SpecificType {
	static var type: Any.Type { Wrapped.self }
}
