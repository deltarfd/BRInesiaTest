//
//  MainView.swift
//  BRInesiaTest
//
//  Created by Delta Rahmat Fajar Delviansyah on 11/10/21.
//

import SwiftUI

struct MainView: View {
    @State var index = 0
    var body: some View {
        TabView {
            FibonacciView()
                .tabItem {
                    VStack {
                        Image(systemName: "f.circle.fill")
                        Text("Fibonacci")
                    }
                }.tag(1)
            AnagramView()
                .tabItem {
                    VStack {
                        Image(systemName: "a.circle.fill")
                        Text("Anagram")
                    }
                }.tag(2)
            PermutationView()
                .tabItem {
                    VStack {
                        Image(systemName: "p.circle.fill")
                        Text("Permutation")
                    }
                }.tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
