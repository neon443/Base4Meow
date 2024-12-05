import SwiftUI

struct ContentView: View {
	@State var numberb10: Int = 100
	@State var meow: String = "meoem"
	
	var body: some View {
		VStack(spacing: 20) {
			// Section for "Number to Meow"
			VStack {
				Text("Number to Meow")
					.font(.headline)
					.padding(.top, 20)
				
				HStack {
					VStack {
						Image(systemName: "arrowshape.down.circle.fill")
							.foregroundColor(.blue)
							.font(.largeTitle)
						Text("Number to Meow")
							.font(.subheadline)
							.foregroundColor(.gray)
					}
					.frame(maxWidth: 60)
					
					VStack {
						TextField("Enter number", value: $numberb10, formatter: NumberFormatter())
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.padding()
						
						Text(number2meow(numberb10))
							.font(.body)
							.padding()
							.background(Color.blue.opacity(0.1))
							.clipShape(RoundedRectangle(cornerRadius: 10))
							.foregroundColor(.blue)
					}
				}
				.padding(.horizontal)
			}
			.background(Color.white)
			.cornerRadius(10)
			.shadow(radius: 5)
			
			// Section for "Meow to Number"
			VStack {
				Text("Meow to Number")
					.font(.headline)
					.padding(.top, 20)
				
				HStack {
					VStack {
						Image(systemName: "arrowshape.down.circle.fill")
							.foregroundColor(.green)
							.font(.largeTitle)
						Text("Meow to Number")
							.font(.subheadline)
							.foregroundColor(.gray)
					}
					.frame(maxWidth: 60)
					
					VStack {
						TextField("Enter meow", text: $meow)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.padding()
						
						Text(String(meow2number(meow)))
							.font(.body)
							.padding()
							.background(Color.green.opacity(0.1))
							.clipShape(RoundedRectangle(cornerRadius: 10))
							.foregroundColor(.green)
					}
				}
				.padding(.horizontal)
			}
			.background(Color.white)
			.cornerRadius(10)
			.shadow(radius: 5)
			
			Spacer()
		}
		.padding()
		.background(Color.gray.opacity(0.1))
	}
	
	func number2meow(_ num: Int) -> String {
		guard num > 0 else { return "m" }
		
		let meowMap = ["m", "e", "o", "w"]
		var base4Digits: [Int] = []
		
		var number = num
		while number > 0 {
			base4Digits.append(number % 4)
			number /= 4
		}
		
		base4Digits.reverse()
		
		return "m" + base4Digits.map { meowMap[$0] }.joined()
	}
	
	func meow2number(_ meow: String) -> Int {
		let meowMap: [Character: Int] = ["m": 0, "e": 1, "o": 2, "w": 3]
		let meowString = meow.dropFirst()  // Remove leading "m"
		
		var result = 0
		for (index, char) in meowString.enumerated() {
			if let digit = meowMap[char] {
				result += digit * Int(pow(4.0, Double(meowString.count - index - 1)))
			}
		}
		
		return result
	}
}

#Preview {
	ContentView()
}
