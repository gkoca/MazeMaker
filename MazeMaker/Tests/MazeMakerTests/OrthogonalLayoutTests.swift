import Testing
@testable import MazeMaker

struct OrthogonalLayoutTests {
    
    @Test("Layout should populate grid of cells with correct directional connections")
    func layoutShouldPopulateGridOfCells() {
        let layout = OrthogonalLayout(rows: 3, columns: 3)
        let grid = Grid(layout: layout)
        
        let a = grid.at(GridLocation(row: 0, column: 0)) as! OrthogonalCell
        let b = grid.at(GridLocation(row: 0, column: 1)) as! OrthogonalCell
        let c = grid.at(GridLocation(row: 0, column: 2)) as! OrthogonalCell
        let d = grid.at(GridLocation(row: 1, column: 0)) as! OrthogonalCell
        let e = grid.at(GridLocation(row: 1, column: 1)) as! OrthogonalCell
        let f = grid.at(GridLocation(row: 1, column: 2)) as! OrthogonalCell
        let g = grid.at(GridLocation(row: 2, column: 0)) as! OrthogonalCell
        let h = grid.at(GridLocation(row: 2, column: 1)) as! OrthogonalCell
        let i = grid.at(GridLocation(row: 2, column: 2)) as! OrthogonalCell
        
        #expect(a.north == nil)
        #expect(a.west == nil)
        #expect(a.east == b)
        #expect(a.south == d)
        
        #expect(b.north == nil)
        #expect(b.west == a)
        #expect(b.east == c)
        #expect(b.south == e)
        
        #expect(c.north == nil)
        #expect(c.east == nil)
        #expect(c.west == b)
        #expect(c.south == f)
        
        #expect(d.west == nil)
        #expect(d.north == a)
        #expect(d.east == e)
        #expect(d.south == g)
        
        #expect(e.north == b)
        #expect(e.west == d)
        #expect(e.east == f)
        #expect(e.south == h)
        
        #expect(f.east == nil)
        #expect(f.north == c)
        #expect(f.west == e)
        #expect(f.south == i)
        
        #expect(g.west == nil)
        #expect(g.south == nil)
        #expect(g.north == d)
        #expect(g.east == h)
        
        #expect(h.south == nil)
        #expect(h.north == e)
        #expect(h.west == g)
        #expect(h.east == i)
        
        #expect(i.east == nil)
        #expect(i.south == nil)
        #expect(i.north == f)
        #expect(i.west == h)
    }
}
