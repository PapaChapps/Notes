import UIKit

struct Animal : Equatable, Comparable {
    static func < (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.age < rhs.age
    }
    
    let color: UIColor
    let height: Int
    let age: Int
    
    static func ==(lhs: Animal, rhs: Animal) -> Bool {
        return lhs.color == rhs.color
    }
}

let animal = Animal( color: .brown, height: 24, age: 2)
print(animal)
let animal2 = Animal(color: .gray, height: 48, age: 5)

if animal == animal2 {
    print("they are the same")
}

