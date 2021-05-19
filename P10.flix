namespace P10 {
  def encode(l: List[a]): List[(Int, a)] with Eq[a] = {
    let packed = P09.pack(l);
    List.map(group -> (Nel.length(group), Nel.head(group)))(packed)
  }

  @test
  def testEncode01(): Bool = encode(Nil: List[Int]) == Nil

  @test
  def testEncode02(): Bool = 
    encode('a' :: 'a' :: 'a' :: 'a' :: 'b' :: 'c' :: 'c' :: 'a' :: 'a' :: 'd' :: 'e' :: 'e' :: 'e' :: 'e' :: Nil) ==
    (4, 'a') :: (1, 'b') :: (2, 'c') :: (2, 'a') :: (1, 'd') :: (4, 'e') :: Nil
}