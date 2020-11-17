import Foundation
//1. Написать функцию, которая определяет, четное число или нет.

func isEven(_ num: Int) -> String{
    return num % 2 == 0 ? "Четное" : "Не четное"
}
isEven(2)
isEven(3)
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDivideByThree(_ num: Int) -> String{
    return num % 3 == 0 ? "Делится" : "Не делится"
}
isDivideByThree(4)
isDivideByThree(21)

//3. Создать возрастающий массив из 100 чисел.
var array:[Int] = []
for num in 0..<100 {
    array.append(num)
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
let filteredArray = array.filter {$0 % 2 != 0 && $0 % 3 == 0}
print(filteredArray)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
