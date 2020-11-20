import Foundation

/*
 На занятии сказали, что можно сделать что-то своё.
 Небольшая текстовая игра на повторение структур.
 
 Punch Youre Enemy v0.1
 */
var hitDiscriptions = ["смачный удар","сказочный шлепок","удар мезинцем ноги"]

enum Punches {
    case hight, middle, low
}

struct Enemy {
    
    var nick: String //Ник
    var hp: Int = 10 //Количество ХП
    var hpBottle: Int = 2 //Сколько раз сможет отхилиться
    
    mutating func Punch(_ punch: Punches){
        guard self.hp > 0 else {
            return print("HP кончилось")
        }
        switch punch {
        case .hight:
            let rand = Int.random(in: 7...17)
            self.hp -= rand
            print("Вы нанесли высокий \(hitDiscriptions[Int.random(in: 0..<hitDiscriptions.count)]) на \(rand) hp")
            trySelfHeal()
        case .middle:
            let rand = Int.random(in: 10...20)
            self.hp -= rand
            print("Вы нанесли средний \(hitDiscriptions[Int.random(in: 0..<hitDiscriptions.count)]) на \(rand) hp")
            trySelfHeal()
        case .low:
            let rand = Int.random(in: 3...6)
            self.hp -= rand
            print("Вы нанесли низкий \(hitDiscriptions[Int.random(in: 0..<hitDiscriptions.count)]) на \(rand) hp")
            trySelfHeal()
        }
        print("У \(self.nick) \(self.hp) HP")
    }
    mutating private func Heal (){
        guard self.hpBottle > 0 else {
            return print("Хилки кончились")
        }
        let rand = Int.random(in: 100...500)
        self.hp += rand
        self.hpBottle -= 1
        print("Благословенное лечение на \(rand) HP\nТеперь у \(self.nick) \(self.hp) HP")
        print("Остаток лечений: \(self.hpBottle)")
    }

    mutating func trySelfHeal(){
        let rand = Double.random(in: 0.0 ... 0.9)
        print("Сейчас подлечусь!")
        rand > 0.59 ? Heal() : print("...Случился Факап с хилом ((...")
    }
    
}

var enemy = Enemy(nick: "SomeEnemy", hp: 100, hpBottle: 5)
print(enemy)
enemy.Punch(.hight)
enemy.Punch(.low)
