namespace P19 {
  def rotate(l: List[a], n: Int): List[a] = match l {
    case Nil => Nil
    case _ =>
      let len = List.length(l);
      match P17.split(l, (n % len + len) % len) {
        case (left, right) => right ::: left
      }
  }

  @test
  def testRotate01(): Bool = rotate(Nil: List[Int], 9999) == Nil

  @test
  def testRotate02(): Bool = rotate(Nil: List[Int], -9999) == Nil

  @test
  def testRotate03(): Bool = 
    rotate('a' :: 'b' :: 'c' :: 'd' :: 'e' :: 'f' :: 'g' :: 'h' :: Nil, 3) ==
    'd' :: 'e' :: 'f' :: 'g' :: 'h' :: 'a' :: 'b' :: 'c' :: Nil

  @test
  def testRotate04(): Bool = 
    rotate('a' :: 'b' :: 'c' :: 'd' :: 'e' :: 'f' :: 'g' :: 'h' :: Nil, -2) ==
    'g' :: 'h' :: 'a' :: 'b' :: 'c' :: 'd' :: 'e' :: 'f' :: Nil
}