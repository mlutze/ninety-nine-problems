namespace P20 {
  def removeAt(l: List[a], n: Int): List[a] = match P17.split(l, n) {
    case (_, Nil) => l
    case (left, _ :: tl) => left ::: tl
  }

  @test
  def testRemoveAt01(): Bool = removeAt(1 :: 2 :: 3 :: 4 :: Nil, 2) == 1 :: 2 :: 4 :: Nil
}