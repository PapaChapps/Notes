import UIKit
/* here is a Npc Struct. Make a new instance called badGuy, name him whatever you want and set both hp and attack to 10 for now. make another instance of goodGuy and do the same.
 */
struct Npc {
    var name: String
    var hp: Int
    var attack: Int
}

/* now create a function using guard to call the attack of goodGuy and subtract that value from the hp of badGuy
 print the value
 */






/* does this work? why or why not? */


/* what is the difference between guard and if? */




/* enumerations
 take this Armory struct and add an enum of 4 of your favorite weapons. then set a switch on your weapons for these scenarios you would best use them for. "RedDawn", "Aliens" "zombieAppocalypse", "fortnight"*/
struct Armory {
    var weaponOfChoice: String

}

/* try setting values now to the weapons of type Int. does this work? why or why not? */

/*
 type casting:
how could this run better?
 */

import Foundation

class LivingBeing {
    var age :Int!
    
    init(age:Int!) {
        if let age = age {
            self.age = age
        }
    }
}

class Human: LivingBeing {
    var name:String!
    
    init(name:String?, age:Int!) {
        if let name = name {
            self.name = name
        }
        super.init(age: age ?? 0)
    }
}

class Animal: LivingBeing {
    var isMammals:Bool!
    
    init(isMammals:Bool!, age:Int!) {
        if let isMammals = isMammals {
            self.isMammals = isMammals
        }
        super.init(age: age ?? 0)
    }
}

let livingBeingArray = [Animal(isMammals:true, age:12),Human(name:"Abhilash",age:25)]
/* create a failable initializer that checks to see if a human is tall enough to ride the rollercoaster. set the requred hight to 4 feat */



/* SCOPE: Debug the following lines of code and explain why they didn't work in a print statement.
 */

for _ in 0...15 {
    let cohort2 = 11
}
print("cohort2 has \(cohort2) students in the class")



/* SCOPE: Create a function called printMyName that contains a for-in loop that will print a greeting and your name
 */




/* SCOPE: Create an initializer for the struct below containing name and age, then print the outcome
 */

struct Person {
    var name: String
    var age: Int
}


/* SEGUES AND NAVIGATION CONTROLLERS: Make a print statement describing a navigation controller and what they do
 */




/* TAB BAR CONTROLLERS: Write a print statement explaining what kind of apps would use a Tab Bar Controller
 */
