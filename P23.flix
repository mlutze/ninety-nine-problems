namespace P23 {
  pub def rndSelect(l: List[a], n: Int): List[a] & Impure = {
    helper(l, List.length(l), n)
  }

  def helper(l: List[a], len: Int, n: Int): List[a] & Impure = match l {
    case Nil => Nil
    case hd :: tl => 
      let random = Random.new();
      if (Random.nextNatWithMax(random, len) < n) {
        hd :: helper(tl, len - 1, n - 1)
      } else {
        helper(tl, len - 1, n)
      }
  }
}