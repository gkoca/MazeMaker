extension Set {
  public func sample() -> Set.Element? {
    if count > 0 {
        let offset = Int.random(in: 0..<count)
    
        let nIndex = index(startIndex, offsetBy: offset)//index.index(startIndex, offsetBy: offset)
        return self[nIndex]
    } else {
        return nil
    }
  }
}
