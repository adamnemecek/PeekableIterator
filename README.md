# PeekableIterator

This package contains an implementation of Peekable Iterator. This iterator has a method called `peek` which allows you to get the current element of the iterator without consuming it. 

You construct a peekable iterator by calling the `peekable` method on any `Iterator` or `Sequence`.

```swift
let a = [1,2,3,4]

var i = a.peekable()

assert(i.peek() == 1)
assert(i.peek() == 1)

assert(i.next() == 2)
assert(i.peek() == 2)
```
