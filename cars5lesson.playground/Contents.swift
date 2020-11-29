import UIKit

protocol Car {
    var color: String { get }
    var model: String { get }
    var topSpeed: Int { get }
    var typeFuel: String { get }
    func openWindow()
}
    
    

extension Car {
    func openWindow(){
        print("Окно открыто")
    }
    func closeWindow(){
         print("Окно закрыто")
        
    }
    
    func startEngine(){
        print("Двигатель запущен")
    }
    func stopEngine(){
        print("Двигатель заглушен")
    }
}

class SportСar: Car {
    let color: String = "red"
    let model: String = "Porshe Cayen"
    let topSpeed: Int = 240
    let useFuelMark = 220
    let typeFuel: String = "Electro"
    let autoPilot = true
    let trunkVolume = 50

}
extension SportСar: CustomStringConvertible {
    var description: String {
        return "Вы за рулем крутой тачки"
    }
    
}

class TrunkCar: Car {
    let color: String = "grey"
    let model: String = "BAW"
    let topSpeed: Int = 120
    let useFuelMark = 95
    let typeFuel: String = "Benzin"
    let autoPilot = false
    let trunkVolume = 450
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Вы за рулем грузовика"
    }
    
}


var sportCar = SportСar()
sportCar.closeWindow()
sportCar.color
sportCar.autoPilot
sportCar.trunkVolume
var trunkCar = TrunkCar()
trunkCar.topSpeed
trunkCar.closeWindow()
print(sportCar)
print(trunkCar)
