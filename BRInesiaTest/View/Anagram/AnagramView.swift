//
//  AnagramView.swift
//  BRInesiaTest
//
//  Created by Delta Rahmat Fajar Delviansyah on 11/10/21.
//

import SwiftUI

struct AnagramView: View {
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var isAnagram = false
    private var anagram = Anagram()
    var body: some View {
        NavigationView(){
            VStack(alignment: .center, spacing: 16, content: {
                Text("Text 1:")
                    .frame(width: UIScreen.main.bounds.width-32,  alignment: .leading)
                    .padding(.top, 16)
                TextField("Enter Your Text 1", text: $text1)
                    .padding()
                    .background(Color(.darkGray))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .foregroundColor(Color("PrimaryColor"))
                
                Text("Text 2:")
                    .frame(width: UIScreen.main.bounds.width-32,  alignment: .leading)
                    .padding(.top, 16)
                TextField("Enter Your Text 2", text: $text2)
                    .padding()
                    .background(Color(.darkGray))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .foregroundColor(Color("PrimaryColor"))
                
                Button(action: {
                    isAnagram = anagram.isAnagram(firstString: text1, secondString: text2)
                }){
                    Text("Check")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 120).padding()
                }.background(Color("PrimaryColor"))
                .clipShape(Capsule())
                .padding()
                Text(isAnagram ? "Anagram" : "Not Anagram")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryColor"))
                    .multilineTextAlignment(.center)
                    .padding()
            })
            .navigationTitle("Anagram")
        }
    }
}

struct AnagramView_Previews: PreviewProvider {
    static var previews: some View {
        AnagramView()
    }
}
