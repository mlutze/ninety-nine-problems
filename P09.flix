// Pack consecutive duplicates of list elements into sublists.
namespace P09 {
  def pack(l: List[a]): List[List[a]] with Eq[a] = match l {
    case Nil => Nil
    case hd :: tl => match pack(tl) {
      // Case 1: head matches head of tail
      case (tlHdHd :: tlHdTl) :: tlTl if hd == tlHdHd => 
        (hd :: tlHdHd :: tlHdTl) :: tlTl
      // Case 2: head doesn't match head of tail
      case packedTail => (hd :: Nil) :: packedTail
    }
  }

  @test
  def testPack01(): Bool = pack(Nil: List[Int]) == Nil

  @test
  def testPack02(): Bool = 
    pack('a' :: 'a' :: 'a' :: 'a' :: 'b' :: 'c' :: 'c' :: 'a' :: 'a' :: 'd' :: 'e' :: 'e' :: 'e' :: 'e' :: Nil) ==
    ('a' :: 'a' :: 'a' :: 'a' :: Nil) :: ('b' :: Nil) :: ('c' :: 'c' :: Nil) :: ('a' :: 'a' :: Nil) :: ('d' :: Nil) :: ('e' :: 'e' :: 'e' :: 'e' :: Nil) :: Nil
}