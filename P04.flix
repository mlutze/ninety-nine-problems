// Find the number of elements of a list.
namespace P04 {
    def length(l: List[a]): Int = lengthHelper(l, 0)

    def lengthHelper(l: List[a], acc: Int): Int = match l {
        case Nil => acc
        case _ :: tail => lengthHelper(tail, acc + 1)
    }

    @test
    def testLength01(): Bool = 
        length(Nil) == 0

    @test
    def testLength02(): Bool = 
        length(1 :: Nil) == 1
    
    @test
    def testLength03(): Bool = 
        length(1 :: 2 :: 3 :: 4 :: Nil) == 4

}
