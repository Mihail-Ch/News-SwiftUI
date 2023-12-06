//
//  ModelNews.swift
//  NewsSwiftUI
//
//  Created by Михаил Чертов on 06.12.2023.
//


import SwiftUI

struct News: Codable, Identifiable {
    
    var id: Int
    var title: String
    var publicDate: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case publicDate = "publication_date"
    }
    
    var formattedDate: String {
        let date = Date.init(timeIntervalSince1970: TimeInterval(publicDate))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormatter.string(from: date)
//        if let date = dateFormatter.date(from: date) {
//            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
//            return dateFormatter.string(from: date)
//        } else {
//            return "Error format Date"
//        }
    }
}



