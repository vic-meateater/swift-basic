import UIKit


struct Queue<T> {
    private var array = [T]()
    
    mutating func push(_ elem: T){
        array.append(elem)
        show()
    }
    
    func show(){
        print("Элементы в массиве: \(array):")
    }
    
    mutating func pop() -> T? {
        if array.count > 0 {
            return array.removeFirst()
        }
        print("Нет элементов для удаления")
        return nil
    }
    
    mutating func filter(closure: (T) -> Bool) -> [T]{
        var tmpArray = [T]()
        for el in array {
            if closure(el){
                tmpArray.append(el)
            }
        }
        return tmpArray
    }
    
    
}

var myArray = Queue<Int>()
myArray.push(1)
myArray.push(2)
myArray.push(3)
myArray.push(4)
myArray.push(6)
myArray.show()
myArray.pop()
myArray.show()
myArray.filter { $0 % 2 == 0 }
