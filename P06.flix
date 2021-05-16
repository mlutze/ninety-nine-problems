// Find out whether a list is a palindrome.
namespace P06 {
  def isPalindrome(l: List[a]): Bool with Eq[a] = l == P05.reverse(l)

  @test
  def testIsPalindrome01(): Bool = isPalindrome(Nil: List[Int]) == true

  @test
  def testIsPalindrome02(): Bool = isPalindrome(0 :: Nil) == true

  @test
  def testIsPalindrome03(): Bool = isPalindrome(0 :: 1 :: Nil) == false

  @test
  def testIsPalindrome04(): Bool = isPalindrome(0 :: 1 :: 0 :: Nil) == true
}