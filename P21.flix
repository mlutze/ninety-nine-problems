namespace P21 {
  def insertAt(x: a, l: List[a], i: Int): List[a] = match P17.split(l, i) {
    case (left, right) => left ::: (x :: Nil) ::: right
  }

  @test
  def testInsertAt(): Bool = insertAt("alfa", "a" :: "b" :: "c" :: "d" :: Nil, 3) == "a" :: "b" :: "c" :: "alfa" :: "d" :: Nil
}