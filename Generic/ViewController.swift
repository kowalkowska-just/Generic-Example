//
//  ViewController.swift
//  Generic
//
//  Created by Justyna Kowalkowska on 19/02/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        useLinearSearch()
        usePersonExample()
    }
    
    //MARK: - Basic example of Generic
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func add(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func genericAdd<T: Numeric>(a: T, b: T) -> T {
        return a + b
    }
    
    func useAdd() {
        _ = genericAdd(a: 10, b: 10) // Type c value is Int
        _ = genericAdd(a: 11.22, b: 10) //Type d value is Double
    }
    
    //MARK: - LinearSearch Function using Equatable
    
    func linearSearch(array: [String], key: String) -> Int? {
        for i in 0..<array.count {
            if array[i] == key {
                return i
            }
        }
        return nil
    }
    
    /* EQUATABLE is the protocol which requires any conforming type to implement the equal to operator (==)
    and the not equal to operator (!=) to compare any two values of that type. */
    
    /* Another notation of the function is:
    func genericLinearSearch<T>(array: [T], key: T) -> Int? where T: Equatable
    */
    
    func genericLinearSearch<T: Equatable>(array: [T], key: T) -> Int? {
        for i in 0..<array.count {
            if array[i] == key {
                return i
            }
        }
        return nil
    }
    
    func useLinearSearch() {
        let cars = ["Honda", "Toyota", "Ford", "Tesla"]
        let carKey = "Ford"
        if let carIndex = genericLinearSearch(array: cars, key: carKey) {
            print("The cars have the \(carKey) on index \(carIndex)")
        }
        
        let items = [1, 2, 3, 4, 5, 10, 12, 13]
        let itemKey = 10
        if let itemIndex = genericLinearSearch(array: items, key: itemKey) {
            print("The items have a value of \(itemKey) on index \(itemIndex)")
        }
    }
    
    struct Person: Equatable {
        let name: String
        let age: Int
        
        static func == (lhs: Person, rhs: Person) -> Bool {
            if lhs.name == rhs.name && lhs.age == rhs.age {
                return true
            }
            return false
        }
    }
    
    func usePersonExample() {
        let jim1 = Person(name: "Jim", age: 23)
        let jim2 = Person(name: "Jim", age: 23)
        
        let bob1 = Person(name: "Bob", age: 40)
        
        print(jim1 == jim2) // Will print true
        print(jim2 == bob1) // Will print false
        
        let people = [jim1, jim2, bob1]
        
        if let bobIndex = genericLinearSearch(array: people, key: bob1) {
            print(people[bobIndex].age)
        }
    }
}

//MARK: - Protocol

protocol Drivable {
    func speed()
}

class Car: Drivable {
    func speed() {
        print("Top speed 160mph")
    }
}

// 

protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Addable { }

extension Double: Addable { }

func customAdd<T: Addable>(a: T, b: T) -> T {
    return a + b
}

func customAddExample() {
    let addInt = customAdd(a: 4, b: 5)
    print(addInt)
    
    let addDouble = customAdd(a: 3.14, b: 4.55)
    print(addDouble)
}
