// Pack consecutive duplicates of list elements into sublists.
namespace P09 {
  pub def pack(l: List[a]): List[Nel[a]] with Eq[a] = match l {
    case Nil => Nil
    case hd :: tl => match pack(tl) {
      // Case 1: head matches head of tail
      case Nel(tlHdHd, tlHdTl) :: tlTl if hd == tlHdHd => 
        Nel(hd, tlHdHd :: tlHdTl) :: tlTl
      // Case 2: head doesn't match head of tail
      case packedTail => Nel(hd, Nil) :: packedTail
    }
  }

  @test
  def testPack01(): Bool = pack(Nil: List[Int]) == Nil

  @test
  def testPack02(): Bool = 
    pack('a' :: 'a' :: 'a' :: 'a' :: 'b' :: 'c' :: 'c' :: 'a' :: 'a' :: 'd' :: 'e' :: 'e' :: 'e' :: 'e' :: Nil) ==
    Nel('a', 'a' :: 'a' :: 'a' :: Nil) :: Nel('b', Nil) :: Nel('c', 'c' :: Nil) :: Nel('a', 'a' :: Nil) :: Nel('d',  Nil) :: Nel('e', 'e' :: 'e' :: 'e' :: Nil) :: Nil
}