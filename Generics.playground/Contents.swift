//: Playground - noun: a place where people can play

import Cocoa

struct StackGenerator<T>: GeneratorType {
    typealias Element = T
    
    var stack: Stack<T>
    
    mutating func next() -> Element? {
        return stack.pop()
    }
}

struct Stack<Element>: SequenceType {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(f: Element -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
    
    func filter(f:Element -> Bool) -> Stack<Element> {
        var filteredItems = [Element]()
        for item in items {
            if f(item) {
                filteredItems.append(item)
            }
        }
        return Stack<Element>(items: filteredItems)
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackGenerator = StackGenerator(stack: myStack)
while let value = myStackGenerator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map({ 2 * $0 })

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

print(doubledStack.pop())
print(doubledStack.pop())


var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())

func myMap<T,U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings){ $0.characters.count}
print(stringLengths)

func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))

func pushItemsOntoStack<Element, S: SequenceType where S.Generator.Element == Element>(inout stack: Stack<Element>, fromSequence sequence: S) {
    for item in sequence {
        stack.push(item)
    }
}

var myOtherStack = Stack<Int>()
pushItemsOntoStack(&myStack, fromSequence: [1,2,3])
pushItemsOntoStack(&myStack, fromSequence: myOtherStack)
for value in myStack {
    print("after pushing items onto stack, got \(value)")
}

var yourStack = Stack<Int>()
pushItemsOntoStack(&yourStack, fromSequence: [1,2,3,4,5,6,7,8,9])
let largeStack = yourStack.filter {$0 > 5}

for value in largeStack {
    print(value)
}

//func findAll<T: Equatable>(items: [T], element: T) -> [Int] {
//    var result = [Int]()
//    for (index, item) in items.enumerate() {
//        if checkIfEqual(item, element) {
//            result.append(index)
//        }
//    }
//    return result
//}
//
//findAll([5,3,7,3,9], element: 3)

func findAll<T: Equatable, C: CollectionType where C.Generator.Element == T>(collection: C, _ element: T) -> [C.Index] {
    return collection.indices.filter { collection[$0] == element}
}

let result = findAll([5,3,7,3,9], 3)

