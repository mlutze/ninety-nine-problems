namespace P14 {
  def dupli(l: List[a]): List[a] = List.flatMap(x -> x :: x :: Nil)(l)

  @test
  def testDupli01(): Bool = dupli(Nil: List[Int]) == Nil

  @test
  def testDupli02(): Bool = 
    dupli('a' :: 'b' :: 'c' :: 'c' :: 'd' :: Nil) ==
    ('a' :: 'a' :: 'b' :: 'b' :: 'c' :: 'c' :: 'c' :: 'c' :: 'd' :: 'd' :: Nil)
}