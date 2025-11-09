import Testing
@testable import MazeMaker

@Suite("Grid Tests")
struct GridTests {
    struct TestLayout: Layout {
        func build(_ grid: Grid) {
        }
        
        func renderAsString(_ grid: Grid) -> String {
            return ""
        }
    }
    
    let grid = Grid(layout: TestLayout())
    
    @Test("Grid should start empty")
    func testGridShouldStartEmpty() {
        #expect(grid.cells.isEmpty)
    }
    
    @Test("Add should insert cell into grid")
    func testAddShouldInsertCellIntoGrid() {
        let cell = Cell(location: TestLocation(position: 1))
        
        grid.add(cell)
        #expect(grid.cells.contains(cell))
    }
    
    @Test("Remove should remove cell from grid")
    func testRemoveShouldRemoveCellFromGrid() {
        let cell = Cell(location: TestLocation(position: 1))
        
        grid.add(cell)
        grid.remove(cell)
        
        #expect(grid.cells.isEmpty)
    }
    
    @Test("At should return cell at location")
    func testAtShouldReturnCellAtLocation() {
        let cell1 = Cell(location: TestLocation(position: 1))
        let cell2 = Cell(location: TestLocation(position: 2))
        
        grid.add(cell1)
        grid.add(cell2)
        
        #expect(grid.at(cell1.location) == cell1)
        #expect(grid.at(cell2.location) == cell2)
    }
    
    @Test("Sample should return random cell")
    func testSampleShouldReturnRandomCell() {
        let cell1 = Cell(location: TestLocation(position: 1))
        let cell2 = Cell(location: TestLocation(position: 2))
        
        grid.add(cell1)
        grid.add(cell2)
        
        let cell = grid.sample()
        #expect(cell == cell1 || cell == cell2)
    }
    
    @Test("Reset should reset links of all cells")
    func testResetShouldResetLinksOfAllCells() {
        let cell1 = Cell(location: TestLocation(position: 1))
        let cell2 = Cell(location: TestLocation(position: 2))
        
        grid.add(cell1)
        grid.add(cell2)
        
        cell1.linkWith(cell2)
        #expect(cell1.isLinkedWith(cell2))
        
        grid.reset()
        #expect(!cell1.isLinkedWith(cell2))
    }
}
