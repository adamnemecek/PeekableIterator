public struct PeekableIterator<Base: IteratorProtocol>: IteratorProtocol {
    var peeked: Base.Element?
    var iter: Base

    public init(_ base: Base) {
        iter = base
        peeked = iter.next()
    }

    @inline(__always)
    public func peek() -> Base.Element? {
        return peeked
    }

    @inline(__always)
    public mutating func next() -> Base.Element? {
        defer {
            peeked = iter.next()
        }

        return peeked
    }
}

public extension Sequence {
    @inline(__always)
    func peekable() -> PeekableIterator<Self.Iterator> {
        return PeekableIterator(self.makeIterator())
    }
}

public extension IteratorProtocol {
    @inline(__always)
    func peekable() -> PeekableIterator<Self> {
        PeekableIterator(self)
    }
}
