import Foundation

/*
 На занятии сказали, что можно сделать что-то своё.
 Небольшая текстовая игра на повторение структур.
 
 Punch Youre Enemy v0.2
 */
var hitDiscriptions = ["смачный удар","сказочный шлепок","удар мезинцем ноги"]

enum Punches {
    case hight, middle, low
}

class Enemy {
    
    var nick: String
    var hp: Int
    var hpBottle: Int
    let hightPunchRand = Int.random(in: 10...20)
    let middlePunchRand = Int.random(in: 7...15)
    let lowPunchRand = Int.random(in: 4...10)
    
    init(nick: String, hp: Int, hpBottle: Int) {
        self.nick = nick
        self.hp = hp
        self.hpBottle = hpBottle
    }
    func Punch(_ punch: Punches){
        
        guard self.hp > 0 else {
            return print("HP кончилось")
        }
        switch punch {
        case .hight:
            
            self.hp -= hightPunchRand
            niceSeparator()
            print("Вы нанесли высокий \(hitDiscriptions[Int.random(in: 0..<hitDiscriptions.count)]) на \(hightPunchRand) hp")
            trySelfHeal()
        case .middle:
            self.hp -= middlePunchRand
            niceSeparator()
            print("Вы нанесли средний \(hitDiscriptions[Int.random(in: 0..<hitDiscriptions.count)]) на \(middlePunchRand) hp")
            trySelfHeal()
        case .low:
            self.hp -= lowPunchRand
            niceSeparator()
            print("Вы нанесли низкий \(hitDiscriptions[Int.random(in: 0..<hitDiscriptions.count)]) на \(lowPunchRand) hp")
            trySelfHeal()
        }
        print("У \(self.nick) \(self.hp) HP")
    }
    private func Heal (){
        guard self.hpBottle > 0 else {
            return print("Хилки кончились")
        }
        let rand = Int.random(in: 100...300)
        self.hp += rand
        self.hpBottle -= 1
        print("Благословенное лечение на \(rand) HP\nТеперь у \(self.nick) \(self.hp) HP")
        print("Остаток лечений: \(self.hpBottle)")
    }

    private func trySelfHeal(){
        if self.hp <= Int(Double(self.hp) * 0.9) {
            let rand = Double.random(in: 0.0 ... 0.9)
            print("Сейчас подлечусь!")
            rand > 0.59 ? Heal() : print("...Случился Факап с хилом ((...")
        }
    }
    
    private func niceSeparator(){
        print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
    }
    
}


class MageEnemy : Enemy {
    var mageShield: Bool
    init(nick: String, hp: Int = 100, hpBottle: Int, mageShield: Bool) {
        self.mageShield = mageShield
        super.init(nick: nick, hp: hp, hpBottle: hpBottle)
    }
    
    override func Punch(_ punch: Punches) {
        super.Punch(punch)
        switch punch {
        case .hight:
            mageShield ? magicBarier(getDamage: hightPunchRand) : nil
            print("Мы в hight")
        case .middle:
            mageShield ? magicBarier(getDamage: hightPunchRand) : nil
            print("мы в middle")
        case .low:
            mageShield ? magicBarier(getDamage: hightPunchRand) : nil
            print("мы в low ")
        }
        
    }
    
    private func magicBarier(getDamage: Int){
        let reflectDamage = Double(getDamage) * Double.random(in: 0...0.5)
        self.hp += Int(reflectDamage)
        print("\(self.nick) использовал Магический барьер, отразив \(Int(reflectDamage)) урона")
        print("у \(self.nick) \(self.hp) HP")
    }
}



var mage = MageEnemy(nick: "mage", hpBottle: 5, mageShield: true)
mage.Punch(.hight)
mage.Punch(.middle)
mage.Punch(.low)

