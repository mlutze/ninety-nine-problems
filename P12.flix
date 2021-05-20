namespace P12 {
  use P11.Group;
  use P11.Group.{One, Many};

  def decode(l: List[Group[a]]): List[a] with Eq[a] = {
    List.flatMap(group -> match group {
      case One(x) => x :: Nil
      case Many(n, x) => List.repeat(x, n)
    })(l)
  }

  @test
  def testDecode01(): Bool = Nil == decode(Nil: List[Group[Int]])

  @test
  def testDecode02(): Bool = 
    ('a' :: 'a' :: 'a' :: 'a' :: 'b' :: 'c' :: 'c' :: 'a' :: 'a' :: 'd' :: 'e' :: 'e' :: 'e' :: 'e' :: Nil) ==
    decode(Many(4, 'a') :: One('b') :: Many(2, 'c') :: Many(2, 'a') :: One('d') :: Many(4, 'e') :: Nil)
}