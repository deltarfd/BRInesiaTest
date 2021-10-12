//
//  FibonacciView.swift
//  BRInesiaTest
//
//  Created by Delta Rahmat Fajar Delviansyah on 11/10/21.
//

import SwiftUI

struct FibonacciView: View {
    @State private var number = "0"
    @State private var fibonacciNumber = [Int]()
    private var fibonacci = Fibonacci()
    var body: some View {
        NavigationView(){
            ScrollView{
                VStack(alignment: .center, spacing: 16, content: {
                    Text("Number:")
                        .frame(width: UIScreen.main.bounds.width-32,  alignment: .leading)
                        .padding(.top, 16)
                    TextField("Enter Your Number", text: $number)
                        .padding()
                        .background(Color(.darkGray))
                        .cornerRadius(8)
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .foregroundColor(Color("PrimaryColor"))
                    
                    Button(action: {
                        fibonacciNumber = fibonacci.fibonacciList(Int(number) ?? 3)
                    }){
                        Text("Calculate")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 120).padding()
                    }.background(Color("PrimaryColor"))
                    .clipShape(Capsule())
                    .padding()
                    Text("Fibonacci Number")
                    ForEach(fibonacciNumber, id: \.self) { numb in
                        Text("\(numb)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryColor"))
                            .multilineTextAlignment(.center)
                            .padding(8.0)
                    }
                })
            }
            .navigationTitle("Fibonacci")
        }
    }
}

struct FibonacciView_Previews: PreviewProvider {
    static var previews: some View {
        FibonacciView()
    }
}
