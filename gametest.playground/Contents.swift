import UIKit
protocol Attack {
}
    var weapons: [String:Int] = ["LongSword": 10, "Waraxe": 20]

struct CharacterTemplate {
    var name: String
    var health: Int
    var strength: Int
    var magic: Int
    var character: Character
    }
    
    init(name: String, health: Int, strength: Int, magic: Int) {
        self.name = name
        self.health = health
        self.strength = strength
        self.magic = magic
      
    }
func attackBadGuy() {


}


let goodGuy = CharacterTemplate(name: "Alan", health: 20, strength: 10, magic: 10)
let badGuy = CharacterTemplate(name: "DrEvil", health: 15, strength: 5, magic: 20)

