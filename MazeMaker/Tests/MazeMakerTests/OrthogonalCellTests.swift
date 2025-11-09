import Testing
@testable import MazeMaker

@Suite("OrthogonalCell Tests")
struct OrthogonalCellTests {
    
    @Test("North should be accessor")
    func testNorthShouldBeAccessor() {
        let cell = OrthogonalCell(location: GridLocation(row: 2, column: 1))
        let north = OrthogonalCell(location: cell.gridLocation.change(rowBy: -1))
        
        #expect(cell.north == nil)
        
        cell.north = north
        #expect(cell.north == north)
    }
    
    @Test("South should be accessor")
    func testSouthShouldBeAccessor() {
        let cell = OrthogonalCell(location: GridLocation(row: 2, column: 2))
        let south = OrthogonalCell(location: cell.gridLocation.change(rowBy: 1))
        
        #expect(cell.south == nil)
        
        cell.south = south
        #expect(cell.south == south)
    }
    
    @Test("East should be accessor")
    func testEastShouldBeAccessor() {
        let cell = OrthogonalCell(location: GridLocation(row: 2, column: 2))
        let east = OrthogonalCell(location: cell.gridLocation.change(columnBy: 1))
        
        #expect(cell.east == nil)
        
        cell.east = east
        #expect(cell.east == east)
    }
    
    @Test("West should be accessor")
    func testWestShouldBeAccessor() {
        let cell = OrthogonalCell(location: GridLocation(row: 2, column: 2))
        let west = OrthogonalCell(location: cell.gridLocation.change(columnBy: -1))
        
        #expect(cell.west == nil)
        
        cell.west = west
        #expect(cell.west == west)
    }
    
    @Test("Neighbors should include all non-nil neighbors")
    func testNeighborsShouldIncludeAllNonNilNeighbors() {
        let cell = OrthogonalCell(location: GridLocation(row: 2, column: 2))
        
        let north = OrthogonalCell(location: cell.gridLocation.change(rowBy: -1))
        let south = OrthogonalCell(location: cell.gridLocation.change(rowBy: 1))
        let west = OrthogonalCell(location: cell.gridLocation.change(columnBy: -1))
        let east = OrthogonalCell(location: cell.gridLocation.change(columnBy: 1))
        
        #expect(cell.neighbors.isEmpty)
        
        cell.north = north
        #expect(cell.neighbors.contains(north))
        #expect(!cell.neighbors.contains(west))
        
        cell.west = west
        #expect(cell.neighbors.contains(west))
        
        cell.south = south
        cell.east = east
        
        #expect(cell.neighbors.count == 4)
        #expect(cell.neighbors.contains(south))
        #expect(cell.neighbors.contains(east))
    }
}

