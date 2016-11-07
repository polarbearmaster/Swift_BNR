//: Playground - noun: a place where people can play

import Cocoa

typealias Velocity = Double
extension Velocity {
    var kph: Velocity {return self * 1.60934 }
    var mph: Velocity {return self}
}
protocol VehicleType {
    var topSpeed: Velocity {get}
    var numberOfDoors: Int {get}
    var hasFlatbed: Bool {get}
}
struct Car {
    let make : String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must between 0 and 1.")
        }
    }
    let numberOfDoors: Int
}

extension Car: VehicleType {
    var topSpeed: Velocity { return 180 }
    var hasFlatbed: Bool { return false }
}

extension Car {
    init(carMake: String, carModel: String, carYear: Int, carDoors: Int) {
        self.init(make: carMake,
                  model: carModel,
                  year: carYear,
                  color: "Black",
                  nickname: "N/A",
                  gasLevel: 1.0,
                  numberOfDoors: carDoors)
    }
}

var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013, carDoors: 4)

extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}

c.kind.description

extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= gasLevel && amount > 0, "Amount to remove must between 0 and \(gasLevel).")
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(0.3)
c.gasLevel
c.emptyGas(0.6)
c.gasLevel
c.fillGas()
c.gasLevel

extension Int {
    var timesFive: Int {return 5 * self}
}

5.timesFive
