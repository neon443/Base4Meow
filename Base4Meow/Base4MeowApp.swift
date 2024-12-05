//
//  Base4MeowApp.swift
//  Base4Meow
//
//  Created by Nihaal Sharma on 04/12/2024.
//

import SwiftUI

@main
struct Base4MeowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func number2meow(_ num: Int) -> String {
	guard num > 0 else { return "m" }
	
	let meowMap = ["m", "e", "o", "w"]
	var base4Digits: [Int] = []
	
	var number: Int = num
	while number > 0 {
		base4Digits.append(number % 4)
		number /= 4
	}
	
	base4Digits.reverse()
	
	return "m" + base4Digits.map { meowMap[Int($0)] }.joined() //m means pos number
	
}

func meow2number(_ meow: String) -> Int {
	let meowMap: [Character: Int] = ["m": 0, "e": 1, "o": 2, "w": 3]
	let meowString = meow.dropFirst() //first char is sign of number
	
	var result = 0
	for (index, char) in meowString.enumerated() {
		if let digit = meowMap[char] {
			result += digit * Int(pow(4.0, Double(meowString.count - index - 1)))
		}
	}
	return result
}
