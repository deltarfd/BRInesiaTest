//
//  PermutationView.swift
//  BRInesiaTest
//
//  Created by Delta Rahmat Fajar Delviansyah on 11/10/21.
//

import SwiftUI

struct PermutationView: View {
    @State private var objectNumber = "0"
    @State private var sampleSize = "0"
    @State private var permutationNum = [[Int]]()
    private var permutation = Permutation()
    var body: some View {
        NavigationView(){
            ScrollView{
                VStack(alignment: .center, spacing: 16, content: {
                    Text("Total Number of Objects (n):")
                        .frame(width: UIScreen.main.bounds.width-32,  alignment: .leading)
                        .padding(.top, 16)
                    TextField("Enter your Object Number", text: $objectNumber)
                        .padding()
                        .background(Color(.darkGray))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .foregroundColor(Color("PrimaryColor"))
                    Text("Sample size (r):")
                        .frame(width: UIScreen.main.bounds.width-32,  alignment: .leading)
                        .padding(.top, 16)
                    TextField("Enter your Sample size", text: $sampleSize)
                        .padding()
                        .background(Color(.darkGray))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .foregroundColor(Color("PrimaryColor"))
                    Button(action: {
                        permutationNum = permutation.permute(n: Int(objectNumber) ?? 0, r: Int(sampleSize) ?? 0)
                    }){
                        Text("Calculate")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 120).padding()
                    }.background(Color("PrimaryColor"))
                    .clipShape(Capsule())
                    .padding()
                    Text("Count of Permutation: \(permutationNum.count)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryColor"))
                        .multilineTextAlignment(.center)
                        .padding()
                    ForEach(permutationNum, id: \.self) { permutation in
                        HStack(alignment: .center){
                            ForEach(permutation, id: \.self) { num in
                                Text("\(num)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("PrimaryColor"))
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                        }
                    }
                    
                })
            }
            .navigationTitle("Permutation")
        }
    }
}

struct PermutationView_Previews: PreviewProvider {
    static var previews: some View {
        PermutationView()
    }
}
