public struct PeekableIterator<Base: IteratorProtocol>: IteratorProtocol {
    public typealias Element = Base.Element

    @usableFromInline
    var peeked: Base.Element?

    @usableFromInline
    var iter: Base

    public init(_ base: Base) {
        self.iter = base
        self.peeked = iter.next()
    }

    @inlinable @inline(__always)
    public func peek() -> Element? {
        peeked
    }

    @inlinable @inline(__always)
    public mutating func next() -> Element? {
        defer {
            peeked = iter.next()
        }

        return peeked
    }
}

extension Sequence {
    @inlinable @inline(__always)
    public func peekable() -> PeekableIterator<Iterator> {
        PeekableIterator(self.makeIterator())
    }
}

extension IteratorProtocol {
    @inlinable @inline(__always)
    public func peekable() -> PeekableIterator<Self> {
        PeekableIterator(self)
    }
}
