namespace P16 {
  def drop(l: List[a], n: Int): List[a] = match P17.split(l, n - 1) {
    case (left, _ :: tl) => left ::: drop(tl, n)
    case (left, Nil) => left
  }

  @test
  def testDrop01(): Bool =
    drop('a' :: 'b' :: 'c' :: 'd' :: 'e' :: 'f' :: 'g' :: 'h' :: 'i' :: 'k' :: Nil, 3) ==
    ('a' :: 'b' :: 'd' :: 'e' :: 'g' :: 'h' :: 'k' :: Nil)
}