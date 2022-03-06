public struct PeekableIterator<Base: IteratorProtocol>: IteratorProtocol {
    @usableFromInline
    var peeked: Base.Element?

    @usableFromInline
    var iter: Base

    public init(_ base: Base) {
        iter = base
        peeked = iter.next()
    }

    @inlinable @inline(__always)
    public func peek() -> Base.Element? {
        return peeked
    }

    @inlinable @inline(__always)
    public mutating func next() -> Base.Element? {
        defer {
            peeked = iter.next()
        }

        return peeked
    }
}

extension Sequence {
    @inlinable @inline(__always)
    public func peekable() -> PeekableIterator<Self.Iterator> {
        return PeekableIterator(self.makeIterator())
    }
}

extension IteratorProtocol {
    @inlinable @inline(__always)
    public func peekable() -> PeekableIterator<Self> {
        PeekableIterator(self)
    }
}
