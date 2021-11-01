public struct PeekableIterator<Base: IteratorProtocol>: IteratorProtocol {
    var peeked : Base.Element?
    var iter: Base

    public init(_ base: Base) {
        iter = base
        peeked = iter.next()
    }

    public func peek() -> Base.Element? {
        return peeked
    }

    public mutating func next() -> Base.Element? {
        defer {
            peeked = iter.next()
        }

        return peeked
    }
}

public extension Sequence {
    func peekableIterator() -> PeekableIterator<Self.Iterator> {
        return PeekableIterator(self.makeIterator())
    }
}

public extension IteratorProtocol {
    func peekable() -> PeekableIterator<Self> {
        PeekableIterator(self)
    }
}
