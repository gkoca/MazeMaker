import Testing
@testable import MazeMaker

@Suite("GridLocation Tests")
struct GridLocationTests {
    
    @Test("Init should construct location")
    func initShouldConstructLocation() {
        let loc = GridLocation(row: 5, column: 10)
        #expect(loc.row == 5)
        #expect(loc.column == 10)
    }
    
    @Test("Equality should match locations")
    func equalityShouldMatchLocations() {
        let loc1 = GridLocation(row: 5, column: 10)
        let loc2 = GridLocation(row: 5, column: 10)
        let loc3 = GridLocation(row: 6, column: 10)
        let loc4 = GridLocation(row: 5, column: 11)
        
        #expect(loc1 == loc2)
        #expect(loc1 != loc3)
        #expect(loc1 != loc4)
    }
    
    @Test("Change by can change row")
    func changeByCanChangeRow() {
        let loc1 = GridLocation(row: 5, column: 10)
        let loc2 = loc1.change(rowBy: 2)
        #expect(loc1.row == 5)
        #expect(loc2.row == 7)
        #expect(loc2.column == 10)
    }
    
    @Test("Change by can change column")
    func changeByCanChangeColumn() {
        let loc1 = GridLocation(row: 5, column: 10)
        let loc2 = loc1.change(columnBy: 2)
        #expect(loc1.column == 10)
        #expect(loc2.row == 5)
        #expect(loc2.column == 12)
    }
}
