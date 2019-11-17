//
//  SegmentPickerView.swift
//  MovieForToday
//
//  Created by Руслан Кукса on 20.10.2019.
//  Copyright © 2019 Руслан Кукса. All rights reserved.
//

import SwiftUI

struct SegmentPickerView: View {
    @State private var selection = 1
    
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Text("Popular").tag(1)
                Text("In Сinemas").tag(2)
                Text("Upcoming").tag(3)
                Text("Top Rated").tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.black)
            .colorScheme(.dark)
            .cornerRadius(8)
            .padding()
            
            if selection == 1 {
                MovieList(parameter: "popular?")
            }
            
            if selection == 2 {
               MovieList(parameter: "now_playing?")
            }
            
            if selection == 3 {
                MovieList(parameter: "upcoming?")
            }
            
            if selection == 4 {
                MovieList(parameter: "top_rated?")
            }
        }
        .colorScheme(.dark)
    }
}

struct SegmentPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentPickerView().previewLayout(.sizeThatFits)
    }
}

func dateFormatter(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-dd"
    return formatter.string(from: date)
}
