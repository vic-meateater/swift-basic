import UIKit

protocol Car: AnyObject {
    var color: String { get }
    var model: String { get }
    var topSpeed: Int { get }
    var typeFuel: String { get }
    var trunkVolume: Int { get }
    var windowsIsOpen: Bool { get set }
}
    
    

extension Car {
    func openWindows(){
        if windowsIsOpen {
            print("Окна у \(model) уже открыты")
        }else{
            print("Окна у \(model) открыты")
            windowsIsOpen = true
        }
    }
    func closeWindows(){
        if windowsIsOpen{
            print("Окна у \(model) закрыты")
            windowsIsOpen = false
        }else{
            print("Окна у \(model) уже закрыты")
        }
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
    let model: String = "Porsche Cayenne"
    let topSpeed: Int = 240
    let useFuelMark = 220
    let typeFuel: String = "Electro"
    let autoPilot = true
    let trunkVolume = 50
    var windowsIsOpen = false

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
    let trunkVolume = 450
    var windowsIsOpen = true
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Вы за рулем грузовика"
    }
    
}


var sportCar = SportСar()
sportCar.openWindows()
sportCar.openWindows()
sportCar.closeWindows()
sportCar.color
sportCar.autoPilot
sportCar.trunkVolume
var trunkCar = TrunkCar()
trunkCar.topSpeed
trunkCar.closeWindows()
trunkCar.closeWindows()
print(sportCar)
print(trunkCar)
