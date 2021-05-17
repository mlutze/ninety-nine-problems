// Flatten a nested list structure.
namespace P07 {

  type alias BumpyList[a] = List[Node[a]]

  enum Node[a] {
    case Flat(a)
    case Bump(BumpyList[a])
  }

  def flatten(l: BumpyList[a]): List[a] = {
    List.flatMap(flattenNode, l)
  }

  def flattenNode(node: Node[a]): List[a] = match node {
    case Flat(x) => x :: Nil
    case Bump(l) => flatten(l)
  }

  @test
  def testFlatten01(): Bool = flatten(Nil: BumpyList[Int]) == Nil

  @test
  def testFlatten02(): Bool = flatten(Flat(0) :: Nil) == 0 :: Nil

  @test
  def testFlatten03(): Bool = {
    // [a, [b, [c, d], e]]
    let l = Flat('a') :: Bump(Flat('b') :: Bump(Flat('c') :: Flat('d') :: Nil) :: Flat('e') :: Nil) :: Nil;
    flatten(l) == 'a' :: 'b' :: 'c' :: 'd' :: 'e' :: Nil
  }
}