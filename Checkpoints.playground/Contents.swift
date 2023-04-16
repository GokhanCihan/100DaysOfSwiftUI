import Cocoa

//MARK: CHECKPOINT 1
var fahrenheit: (Double) -> Double = { celcius in
    return 9 * celcius / 5 + 32
}
func describeTemperature(celsius: Double) {
    print("\(celsius) degree Celsius = \(fahrenheit(celsius)) degree Fahrenheit")
}
describeTemperature(celsius: 32.0)
describeTemperature(celsius: 17.0)

//MARK: CHECKPOINT 2
extension Array where Element == String {
    func arrayDescription() {
        var uniqueElements = Set<String>()
        self.forEach{ uniqueElements.insert($0) }
        print("Array has \(self.count) elements, \(uniqueElements.count) of them are unique.")
    }
}
let array = ["Gökhan", "Koray", "Hüseyin", "Emrah", "Gökhan", "Emrah"]
array.arrayDescription()

// MARK: CHECKPOINT 3
for i in 1...100 {
    if i % 15 == 0 {
        print("FizzBuzz")
    }else if i % 3 == 0 {
        print("Fizz")
    }else if i % 5 == 0 {
        print("Buzz")
    }else {
        print(i)
    }
}

// MARK: CHECKPOINT 4
enum SquareRootError: Error {
    case outOfBound
    case noRoot
}

extension Int {
    func sqrRoot() throws -> Int {
        var isRoot = false
        var squareRoot = Int()
        if self < 1 {
            throw SquareRootError.outOfBound
        }else if self > 10_000 {
            throw SquareRootError.outOfBound
        }
        
        while isRoot == false {
            for i in 1...self {
                if self/i == i {
                    isRoot.toggle()
                    squareRoot = i
                    break
                }
            }
            break
        }
        if isRoot {
            return squareRoot
        }else {
            throw SquareRootError.noRoot
        }
    }
}

let number = 9_999
do {
    try print(number.sqrRoot())
}catch {
    print(error)
}

// MARK: CHECKPOINT 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
luckyNumbers.filter{ !$0.isMultiple(of: 2) }.sorted().forEach{ print("\($0) is a lucky number") }

// MARK: CHECKPOINT 6
struct Car {
    private var model: String
    private var seats: Int
    private var numberOfGears: Int
    private var currentGear = 0 {
        didSet {
            print("You are moving on gear \(currentGear)")
        }
    }
    
    init(model: String, seats: Int, numberOfGears: Int){
        self.model = model
        self.seats = seats
        self.numberOfGears = numberOfGears
    }
    
    func description() {
        print("Model \"\(model)\" has \(seats) seats and can reach up to \(numberOfGears) gears.")
    }
    
    func getCurrentGear(){
        print("Current gear: \(currentGear)")
    }
    
    mutating func gearUp() {
        if currentGear == numberOfGears{
            print("Can't gear up!")
        }else{ currentGear += 1 }
    }
    
    mutating func gearDown() {
        if currentGear == 0 {
            print("You are not moving!")
        }else { currentGear -= 1 }
    }
}

var bmw = Car(model: "BMW-A9", seats: 5, numberOfGears: 7)

bmw.description()
bmw.getCurrentGear()
for _ in 1...8 {
    bmw.gearUp()
}
bmw.gearDown()
bmw.getCurrentGear()

// MARK: CHECKPOINT 7
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}
class Dog: Animal {
    init(){
        super.init(legs: 4)
    }
    
    func speak() {
        print("\"bark\"")
    }
}
class Cat: Animal {
    var isTame: Bool
    init(isTame: Bool){
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("\"meow\"")
    }
}
class Corgi: Dog {
    override func speak() {
        print("\"corgi bark\"")
    }
}
class Poodle: Dog {
    
    override func speak() {
        print("\"poodle bark\"")
    }
}
class Persian: Cat {
    override func speak() {
        print("\"persian meow\"")
    }
}
class Lion: Cat {
    override func speak() {
        print("\"Roarr\"")
    }
}

//MARK: Checkpoint 8
protocol Building {
    var type: String { get }
    var rooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get set }
    
    func summary()
}
extension Building {
    func summary() {
        print("This \(type) has \(rooms) rooms and costs $\(cost). You can contact with our representative \(estateAgent), if you are interested!")
    }
}

struct House: Building {
    var type: String
    
    var rooms: Int
    
    var cost: Int
    
    var estateAgent: String
}
struct Office: Building {
    var type: String
    
    var rooms: Int
    
    var cost: Int
    
    var estateAgent: String
}

let home = House(type: "house", rooms: 4, cost: 300_000, estateAgent: "Paul Hudson")
let office = Office(type: "office", rooms: 2, cost: 492_000, estateAgent: "John Wick")
home.summary()
office.summary()

//MARK: Checkpoint 9
func selectRandomNumber(from numbers: [Int]?) -> Int {
    //guard let number = numbers?.randomElement() else { return Int.random(in: 1...100)}
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}

let numbers: [Int]? = []
print(selectRandomNumber(from: numbers))
