import UIKit
//WE WANT AN ARRAY WHICH RETURN FIRST AND LAST ELEMENT OF ARRAY
//let number = [1,2,3,4,5,6]
//func firstLast(_ numbers:[Int])->(Int,Int)
//{
//    return(numbers[0] , numbers[number.count-1] )
//}
//
//let (fisrt , last ) = firstLast(number)
//print(fisrt)
//print(last)
//
//// THIS FUNCTION WILL WORK FINE NOW I WANT A ARRAY OF STRING TO RETURN FIRST AND LAST ELEMENT
//
//let number2 = ["1","2","3","4","5","6"]
//func firstLast2(_ numbers:[String])->(String,String)
//{
//    return(numbers[0] , numbers[number.count-1] )
//}
//
//let (fisrt2 , last2 ) = firstLast2(number2)
//print(fisrt2)
//print(last2)

/// TWO FUNCTION SAME CODE  CAN WE CREATE SOME FUNCTION THAT WORKS FOR ALL THEM HERE COMES THE GENERIC
/// GENERIC ARE DONOT CARE THEY DONOT CARE WHAT ARE PASS THEY JUST PERFOM IT AND RETURN OF THAT TYPR
func firstLast<T>(_ list:[T])->(T,T)
{
    return(list[0] , list[list.count-1] )
}
//let number = [1,2,3,4,5,6]
// NOW THIS FUNCTION WILL ALSO WORK FOR STRING ARRAY OR ANY TYPE OF ARRAY ENEN CUSTOME ARRAY
let number2 = ["1","2","3","4","5","6"]
let (fisrt , last ) = firstLast(number2)

//for itr in 0...number2.count
//{
//    print(itr)
//}
print(fisrt)
print(last)


//constraint in generics




