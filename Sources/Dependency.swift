import Foundation

@propertyWrapper
public struct Dependency<Value> {
    var keyPath: KeyPath<DIContainer, Value>

    public init(_ keyPath: KeyPath<DIContainer, Value>) {
        self.keyPath = keyPath
    }

    public var wrappedValue: Value {
        DIContainer.global[keyPath: keyPath]
    }
}
