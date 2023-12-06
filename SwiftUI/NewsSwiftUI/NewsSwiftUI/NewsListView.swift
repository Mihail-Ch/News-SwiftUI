//
//  TestView.swift
//  NewsSwiftUI
//
//  Created by Михаил Чертов on 06.12.2023.
//

import SwiftUI
import Combine

struct NewsListView: View {
    
    @State private var news: [News] = []
    @State private var cancellables: Set<AnyCancellable> = []
    
    var body: some View {
        List(news, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.formattedDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            fetchData()
        }
        .navigationTitle("Новости")
    }
    
    func fetchData() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/`") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [News].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    break
                case .failure(let error):
                    print("ERROR:---\(error.localizedDescription)")
                }
            } receiveValue: { news in
                self.news = news
            }
            .store(in: &cancellables)
    }
}



