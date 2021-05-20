namespace P11 {
  pub enum Group[a] {
    case One(a)
    case Many(Int, a)
  }

  instance Eq[Group[a]] with Eq[a] {
    pub def eq(x: Group[a], y: Group[a]): Bool = match (x, y) {
      case (One(x1), One(y1)) => x1 == y1
      case (Many(xn, x1), Many(yn, y1)) => xn == yn and x1 == y1
      case _ => false
    }
  }

  def encodeModified(l: List[a]): List[Group[a]] with Eq[a] = {
    let packed = P09.pack(l);
    List.map(group -> match group {
      case Nel(x, Nil) => One(x)
      case Nel(x, _) => Many(Nel.length(group), x)
    })(packed)
  }

  @test
  def testEncodeModified01(): Bool = encodeModified(Nil: List[Int]) == Nil

  @test
  def testEncodeModified02(): Bool = 
    encodeModified('a' :: 'a' :: 'a' :: 'a' :: 'b' :: 'c' :: 'c' :: 'a' :: 'a' :: 'd' :: 'e' :: 'e' :: 'e' :: 'e' :: Nil) ==
    Many(4, 'a') :: One('b') :: Many(2, 'c') :: Many(2, 'a') :: One('d') :: Many(4, 'e') :: Nil
}