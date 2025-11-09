import Testing
@testable import MazeMaker

@Suite("Cell Tests")
struct CellTests {
    
    @Test("Init should use location")
    func initShouldUseLocation() {
        let loc = TestLocation(position: 5)
        let cell = Cell(location: loc)
        #expect(cell.location == loc)
    }
    
    @Test("Link with should create bidirectional relationship")
    func linkWithShouldCreateBidirectionalRelationship() {
        let cell1 = Cell(location: TestLocation(position: 1))
        let cell2 = Cell(location: TestLocation(position: 2))
        
        #expect(!cell1.isLinkedWith(cell2))
        #expect(!cell2.isLinkedWith(cell1))
        
        cell1.linkWith(cell2)
        
        #expect(cell1.links == Set([cell2]))
        #expect(cell2.links == Set([cell1]))
        
        #expect(cell1.isLinkedWith(cell2))
        #expect(cell2.isLinkedWith(cell1))
    }
    
    @Test("Unlink from should remove bidirectional relationship")
    func unlinkFromShouldRemoveBidirectionalRelationship() {
        let cell1 = Cell(location: TestLocation(position: 1))
        let cell2 = Cell(location: TestLocation(position: 2))
        cell1.linkWith(cell2)
        
        cell1.unlinkFrom(cell2)
        #expect(!cell1.isLinkedWith(cell2))
        #expect(!cell2.isLinkedWith(cell1))
        
        #expect(cell1.links.isEmpty)
        #expect(cell2.links.isEmpty)
    }
}
