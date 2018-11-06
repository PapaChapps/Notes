import UIKit


enum DayOfWeek { //it is defined as a type
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

let dayOfWeek = DayOfWeek.wednesday
print(dayOfWeek)

var day: DayOfWeek?
day = .sunday



func printDay(day: DayOfWeek) {
    print(day)
}

printDay(day: .saturday)

func printNextDay(day: DayOfWeek) {
    switch day {
    case DayOfWeek.sunday:
        print(DayOfWeek.monday)
    case .monday:
        print(DayOfWeek.sunday)
    case .tuesday:
        print(DayOfWeek.wednesday)
    case .wednesday:
        print(DayOfWeek.thursday)
    case .thursday:
        print(DayOfWeek.friday)
    case .friday:
        print(DayOfWeek.saturday)
    case .saturday:
        print(DayOfWeek.sunday)
    }
}

enum Character{
    case hero, badGuy
    
}
enum Stats {
    case health, stamina, magic
}
struct CharacterTemplate {
    var name: Character
    var health: Stats?
    var strength: Stats?
    var magic: Stats?
    
}


    


let myGuy = CharacterTemplate(name: .hero, health: .health, strength: .stamina, magic: .magic)

let badguy = CharacterTemplate(name: .badGuy, health: .health, strength: .stamina, magic: .magic)





































