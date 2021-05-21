namespace P13 {
  use P11.Group;
  use P11.Group.{One, Many};

  def encodeDirect(l: List[a]): List[Group[a]] with Eq[a] = match l {
    case Nil => Nil
    case hd :: tl => match encodeDirect(tl) {
      // Case 1: head matches a single value in tail
      case One(x) :: tlTl if hd == x => Many(2, x) :: tlTl
      // Case 2: head matches multi-value in tail
      case Many(n, x) :: tlTl if hd == x => Many(n + 1, x) :: tlTl
      // Case 2: head doesn't match head of tail
      case packedTail => One(hd) :: packedTail
    }
  }

  @test
  def testEncodeDirect01(): Bool = encodeDirect(Nil: List[Int]) == Nil

  @test
  def testEncodeDirect02(): Bool = 
    encodeDirect('a' :: 'a' :: 'a' :: 'a' :: 'b' :: 'c' :: 'c' :: 'a' :: 'a' :: 'd' :: 'e' :: 'e' :: 'e' :: 'e' :: Nil) ==
    Many(4, 'a') :: One('b') :: Many(2, 'c') :: Many(2, 'a') :: One('d') :: Many(4, 'e') :: Nil
}