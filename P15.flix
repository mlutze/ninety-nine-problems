namespace P15 {
  def dupli(l: List[a], n: Int): List[a] = List.flatMap(x -> List.repeat(x, n))(l)

  @test
  def testDupli01(): Bool = dupli(Nil: List[Int], 3) == Nil

  @test
  def testDupli02(): Bool = 
    dupli('a' :: 'b' :: 'c' :: Nil, 3) ==
    ('a' :: 'a' :: 'a' :: 'b' :: 'b' :: 'b' :: 'c' :: 'c' :: 'c' :: Nil)
}