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
        let c = genericAdd(a: 10, b: 10) // Type c value is Int
        let d = genericAdd(a: 11.22, b: 10) //Type d value is Double
    }
}

