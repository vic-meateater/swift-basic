import UIKit
import UIKit

struct Ticket {
    var price: Int
    var count: Int
    let destination: Destination
}
struct Destination {
    let name: String
}
enum TicketSaleErrors: Error {
    case notEnoughtMoney(moneyNeed: Int)
    case outOfTicket
    case wrongDestination
}
enum VipPerson: Error {
    case vipPersonNotFound
}

class SellingTerminal {
    var availableTikets = ["Thailand":Ticket(price: 2000, count:0 , destination: Destination(name: "Thailand")),
                           "Turkey":Ticket(price: 1500, count: 1, destination: Destination(name: "Turkey")),
                           "Egypt":Ticket(price: 1700, count: 12, destination: Destination(name: "Egypt")),
                          ]
    
    var deposit = 10000
    
    func buyTicket(to destinationName: String) -> (Destination?, TicketSaleErrors?){
        
        guard var newDestination = availableTikets[destinationName] else {
            return (nil, TicketSaleErrors.wrongDestination)
        }
        guard newDestination.count > 0 else {
            return (nil, TicketSaleErrors.outOfTicket)
        }
        guard deposit >= newDestination.price else {
            return (nil, TicketSaleErrors.notEnoughtMoney(moneyNeed: newDestination.price - deposit))
        }
        deposit -= newDestination.price
        newDestination.count -= 1
        availableTikets[destinationName] = newDestination
        print("Youre buy the ticket")
        return (newDestination.destination, nil)
    }
    
    func buyTickeysByVip(to destinationName: String) throws -> Destination {
        guard var newDestination = availableTikets[destinationName] else {
            throw TicketSaleErrors.wrongDestination
        }
        guard newDestination.count > 0 else {
            throw TicketSaleErrors.outOfTicket
        }
        guard deposit >= newDestination.price else {
            throw TicketSaleErrors.notEnoughtMoney(moneyNeed: newDestination.price - deposit)
        }
        deposit -= newDestination.price
        newDestination.count -= 1
        availableTikets[destinationName] = newDestination
        print("Youre buy the VIP ticket")
        return newDestination.destination
    }
}

func vipBuy(_ person: String, sellingTerminal: SellingTerminal) throws -> Destination {

    let vipDestiantion = ["Vic": "Thailand",
                          "Margo": "Turkey",
                          "Jack": "Egypt",]
    guard let destination = vipDestiantion[person] else {
        throw VipPerson.vipPersonNotFound
    }


    return try sellingTerminal.buyTickeysByVip(to: destination)
}
let sellingTerminal = SellingTerminal()
do { _ = try vipBuy("Jack", sellingTerminal: sellingTerminal)
        
    } catch TicketSaleErrors.notEnoughtMoney(let moneyNeed){
        print("Проблема с оплтаой \(moneyNeed)")
    } catch TicketSaleErrors.outOfTicket{
        print("Нехватает билетов")
    } catch TicketSaleErrors.wrongDestination{
        print("Такого направления не существует")
    } catch let error {
        print(error.localizedDescription)
    }


var buyer1 = SellingTerminal()
buyer1.buyTicket(to: "Thailand")
buyer1.buyTicket(to: "Turkey")
