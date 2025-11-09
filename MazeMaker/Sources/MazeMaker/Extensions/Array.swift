extension Array {
  public func sample() -> Array.Element? {
    return self.randomElement()
  }

  public func shuffle() -> Array {
    return self.shuffled()
  }
}
