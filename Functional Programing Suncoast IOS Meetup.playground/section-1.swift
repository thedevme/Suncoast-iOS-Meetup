// Playground - noun: a place where people can play

//Suncoast iOS Meetup Functional Programming

import UIKit

func basicFunc () -> () -> () {
    func inner() {
        println("Inner function")
    }
    return inner
}

var myFunc = basicFunc()
myFunc() // "Inner Function"

func deposit(amount:Float) -> String {
    return String ( format: "You have deposited $%.2f into your account", amount)
}

func withdraw(amount:Float) -> String {
    return String ( format: "You have withdrawn $%.2f from your account", amount)
}

func bankTransaction ( type:String) -> (Float) -> (String) {
    if type == "withdraw" {
        return withdraw
    }
    return deposit
}

let morningTransaction = bankTransaction("deposit")
morningTransaction(234.04)

let eveningTransaction = bankTransaction("withdraw")
eveningTransaction(100.00)

// Imparative version formatting numbers
let arrNumbers = [ 1000, 2045, 3500, 4099, 5777, 6331, 7000]

var formattedNumbers: [String] = []

for number in arrNumbers {
    let formattedNumber = NSNumberFormatter.localizedStringFromNumber(number, numberStyle: .DecimalStyle)
    formattedNumbers.append(formattedNumber)
}

formattedNumbers

// Map function formatting numbers
let mapFormattedNumbers = arrNumbers.map {
    NSNumberFormatter.localizedStringFromNumber($0, numberStyle: .DecimalStyle)
}

mapFormattedNumbers

// Filter Function
let filterEvenNumbersonly = arrNumbers.filter { $0 % 2 == 0 }
filterEvenNumbersonly

// Reduce Function Suming numbers
let totalSum = arrNumbers.reduce(0) { $0 + $1 }
totalSum

// Chaining
struct Person {
    let name: String
    let age: UInt
}

let people = [
    Person(name: "Alice", age: 22),
    Person(name: "Bob", age: 23),
    Person(name: "Mallory", age: 25)
]

let ageSum = people.map({$0.age}).reduce(0, combine: +)
ageSum

// Chaining Example Continued
let morePeople = [
    Person(name: "Alice", age: 22),
    Person(name: "Bob", age: 23),
    Person(name: "Mallory", age: 25),
    Person(name: "Toni", age: 23),
    Person(name: "Zach", age: 21)
]

let namesBeforeJason = morePeople.map({$0.name}).filter {
    name in name.compare("Jason") == NSComparisonResult.OrderedAscending
}
namesBeforeJason


let namesAfterJason = morePeople.map({$0.name}).filter {
    name in name.compare("Jason") == NSComparisonResult.OrderedDescending
}
namesAfterJason

// Pure Functions

// Imperative Example
var sum     = 0.0
var numbers = [10,20,30,40]

func meanImperative() -> Double {
    for number in numbers {
        sum += Double(number)
    }
    
    let mean = sum / Double(numbers.count)
    return mean
}

// Everytime the function is call the value is change.
meanImperative()
meanImperative()

// Mean functional example
func meanFunctional(numbers:[Int]) -> Double {
    let sum = numbers.reduce(0, combine: {$0 + $1})
    let mean = Double(sum) / Double(numbers.count)
    return mean
}

// Always returns the correct value
meanFunctional(numbers)
meanFunctional(numbers)

// Struct VS. Class

// Immutability Example
struct StructName {
    var firstName: String
    var lastName:  String
}

class ClassName {
    var firstName: String
    var lastName:  String
    
    init(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName  = lastName
    }
}

let aStruct = StructName (firstName: "Craig", lastName: "Clayton")
// Uncomment the following line to see the error where the value cannot be changed
//aStruct.firstName = "Hello"

let aClass = ClassName(firstName: "Neeraj", lastName: "Kumar")
aClass.firstName = "Hello"

// Currying

// Impartive example of converting Miles to Kilometers
func converter(factor:Double, unit:String, toConvert: Double) -> String {
    return "\(toConvert * factor) \(unit)"
}

let miles2kmConvert  = converter(1.6, "km", 25)
let pounds2kgConvert = converter(0.45, "kg", 50)

// Functional Example
func converter(factor:Double)(unit:String)(toConvert:Double) -> String {
    return "\(toConvert * factor) \(unit)"
}

let miles2kms = converter(1.6)(unit:"km")
miles2kms(toConvert: 25)

let pounds2kg = converter(0.45)(unit: "kg")
pounds2kg(toConvert: 50)
pounds2kg(toConvert: 100)

