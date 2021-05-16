// Reverse a list.
namespace P05 {
    pub def reverse(l: List[a]): List[a] = reverseHelper(l, Nil)

    def reverseHelper(l: List[a], acc: List[a]): List[a] = match l {
        case Nil => acc
        case head :: tail => reverseHelper(tail, head :: acc)
    }

    @test
    def testReverse01(): Bool =
        reverse(Nil: List[Int]) == Nil: List[Int]
    
    @test
    def testReverse02(): Bool =
        reverse(1 :: Nil) == 1 :: Nil

    @test
    def testReverse03(): Bool =
        reverse(1 :: 2 :: 3 :: Nil) == 3 :: 2 :: 1 :: Nil
}