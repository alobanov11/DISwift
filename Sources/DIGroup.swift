import Foundation

final class DIGroup {
    private var objects: [DIType: DIObject] = [:]

    private let queue = DispatchQueue(label: "DISwift.DIGroup.queue")

    init() {}

    subscript(_ type: DIType) -> DIObject? {
        get {
            self.queue.sync { self.objects[type] }
        }
        set {
            self.queue.sync {
                self.objects[type] = newValue
            }
        }
    }
}
