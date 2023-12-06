//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by Михаил Чертов on 05.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            NavigationStack {
                NavigationLink("Чиатать", destination: NewsListView())
            }.navigationTitle("НОВОСТИ")
        }
    }
}

#Preview {
    ContentView()
}
