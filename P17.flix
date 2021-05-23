// Split a list into two parts; the length of the first part is given.
namespace P17 {
  pub def split(l: List[a], n: Int): (List[a], List[a]) = match (l, n) {
    case (Nil, _) => (Nil, Nil)
    case (_, n1) if n1 <= 0 => (Nil, l)
    case (hd :: tl, _) => match split(tl, n - 1) {
      case (left, right) => (hd :: left, right)
    }
  }

  @test
  def testSplit01(): Bool = split(Nil: List[Int], 100) == (Nil, Nil)

  @test
  def testSplit02(): Bool = split(1 :: 2 :: 3 :: Nil, -5) == (Nil, 1 :: 2 :: 3 :: Nil)

  @test
  def testSplit03(): Bool = split(1 :: 2 :: 3 :: Nil, 5) == (1 :: 2 :: 3 :: Nil, Nil)

  @test
  def testSplit04(): Bool = 
    split('a' :: 'b' :: 'c' :: 'd' :: 'e' :: 'f' :: 'g' :: 'h' :: 'i' :: 'k' :: Nil, 3) ==
    ('a' :: 'b' :: 'c' :: Nil, 'd' :: 'e' :: 'f' :: 'g' :: 'h' :: 'i' :: 'k' :: Nil)
}