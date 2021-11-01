public struct PeekableIterator<Base: IteratorProtocol> : IteratorProtocol {
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
    let result = peeked

    if peeked != nil {
        peeked = iter.next()
    }

    return result
  }
}


public extension Sequence {
    func peekableIterator() -> PeekableIterator<Self.Iterator> {
        return PeekableIterator(self.makeIterator())
    }
}
