import Foundation

//1. Решить квадратное уравнение.
let a: Double = 1,
    b: Double = -8,
    c: Double = 12

var x: Double = 0

if((pow(b, 2) - 4*a*c) >= 0){
    x = ((-b) + sqrt(b*b - 4*a*c))/(2*a)
    print("Первый корень = \(x)")
    x = ((-b) - sqrt(b*b - 4*a*c))/(2*a)
    print("Второй корень = \(x)")
}else{
    print("Дискриминант меньше 0, корни невещественные.")
}

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let a2: Double = 2,
    b2: Double = 3

var c2: Double = 0,
    s: Double = 0,
    p: Double = 0

s = 0.5 * a2 * b2
print("Площадь = \(s)")
p = a2 + b2 + c2
print("Периметр = \(p)")
c2 = sqrt((pow(a2, 2) + pow(b2, 2)))
print("Гипотенуза = \((c2*1000).rounded()/1000)")

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let deposit = 100,
    persentOfDeposit = 10
var summ = 0
summ = (deposit * persentOfDeposit / 100) + deposit
print("Сумма вклада за 1 год: \(summ)")
for year in 2...5 {
    summ = (summ * persentOfDeposit / 100) + summ
    print("Сумма вклада за \(year) год: \(summ)")
}

