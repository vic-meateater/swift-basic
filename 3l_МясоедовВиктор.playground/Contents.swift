import UIKit

//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.

enum Engine {
    case start, stop
}

enum Windows {
    case open, close
}

enum Trunk {
    case load, unload
}

struct SportCar {
    let brand: String
    let yearOfProduction: Int
    let FullTrunkVolume: Int
    let TrunkVolume: Int
    var windowsState: Windows
    var engineState: Engine
    
    
    mutating func closeWindows(){
        
    }
}

struct TrunkCar {
    let brand: String
    let yearOfProduction: Int
    let FullTrunkVolume: Int
    let TrunkVolume: Int
}
