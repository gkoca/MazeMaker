import Testing
@testable import MazeMaker

@Suite("BinaryHeap Tests")
struct BinaryHeapTests {
    
    @Test("Empty heap should be empty")
    func testEmptyHeap() {
        let heap = BinaryHeap<Int>(compare: { a, b in
            if a > b { return .higher }
            if a < b { return .lower }
            return .equal
        })
        
        #expect(heap.isEmpty)
        #expect(heap.peek() == nil)
        #expect(heap.delete() == nil)
    }
    
    @Test("Insert should maintain heap property")
    func testInsert() {
        let heap = BinaryHeap<Int>(compare: { a, b in
            if a > b { return .higher }
            if a < b { return .lower }
            return .equal
        })
        
        heap.insert(5)
        heap.insert(3)
        heap.insert(8)
        heap.insert(1)
        
        #expect(!heap.isEmpty)
        #expect(heap.peek() == 8) // Max heap
    }
    
    @Test("Delete should remove and return maximum element")
    func testDelete() {
        let heap = BinaryHeap<Int>(compare: { a, b in
            if a > b { return .higher }
            if a < b { return .lower }
            return .equal
        })
        
        heap.insert(5)
        heap.insert(3)
        heap.insert(8)
        heap.insert(1)
        
        #expect(heap.delete() == 8)
        #expect(heap.delete() == 5)
        #expect(heap.delete() == 3)
        #expect(heap.delete() == 1)
        #expect(heap.delete() == nil)
        #expect(heap.isEmpty)
    }
    
    @Test("BuildHeap should construct valid heap from collection")
    func testBuildHeap() {
        let heap = BinaryHeap<Int>(compare: { a, b in
            if a > b { return .higher }
            if a < b { return .lower }
            return .equal
        })
        
        heap.buildHeap([5, 3, 8, 1, 9, 2])
        
        #expect(!heap.isEmpty)
        #expect(heap.peek() == 9) // Max heap property
        
        // Verify heap property - delete elements in order
        var elements = [Int]()
        while let element = heap.delete() {
            elements.append(element)
        }
        
        #expect(elements == [9, 8, 5, 3, 2, 1])
    }
    
    @Test("DeleteElement should remove specific element")
    func testDeleteElement() {
        let heap = BinaryHeap<Int>(compare: { a, b in
            if a > b { return .higher }
            if a < b { return .lower }
            return .equal
        })
        
        heap.buildHeap([5, 3, 8, 1, 9, 2])
        
        // Delete element that exists
        let deleted = heap.deleteElement(3)
        #expect(deleted == 3)
        
        // Delete element that doesn't exist
        let notDeleted = heap.deleteElement(10)
        #expect(notDeleted == nil)
        
        // Verify heap property is still valid
        var elements = [Int]()
        while let element = heap.delete() {
            elements.append(element)
        }
        
        #expect(elements == [9, 8, 5, 2, 1])
    }
    
    @Test("Peek should return maximum element without removing it")
    func testPeek() {
        let heap = BinaryHeap<Int>(compare: { a, b in
            if a > b { return .higher }
            if a < b { return .lower }
            return .equal
        })
        
        heap.insert(5)
        heap.insert(3)
        heap.insert(8)
        heap.insert(1)
        
        #expect(heap.peek() == 8)
        #expect(heap.peek() == 8) // Should still be the same
        #expect(!heap.isEmpty)
    }
    
    @Test("Heap with strings should work correctly")
    func testHeapWithStrings() {
        let heap = BinaryHeap<String>(compare: { a, b in
            if a.count > b.count { return .higher }
            if a.count < b.count { return .lower }
            return .equal
        })
        
        heap.insert("a")
        heap.insert("hello")
        heap.insert("hi")
        heap.insert("world")
        
        #expect(heap.peek() == "hello") // Longest string
        
        let deleted = heap.delete()
        #expect(deleted == "hello")
        #expect(heap.peek() == "world")
    }
    
    @Test("Heap with custom comparison should work")
    func testHeapWithCustomComparison() {
        // Min heap comparison
        let heap = BinaryHeap<Int>(compare: { a, b in
            if a < b { return .higher }
            if a > b { return .lower }
            return .equal
        })
        
        heap.insert(5)
        heap.insert(3)
        heap.insert(8)
        heap.insert(1)
        
        #expect(heap.peek() == 1) // Minimum value
        
        // Delete elements in ascending order
        let deleted = heap.delete()
        #expect(deleted == 1)
        #expect(heap.peek() == 3)
    }
}
