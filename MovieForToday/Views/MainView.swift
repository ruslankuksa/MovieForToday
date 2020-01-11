//
//  ContentView.swift
//  MovieForToday
//
//  Created by Руслан Кукса on 20.10.2019.
//  Copyright © 2019 Руслан Кукса. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    SegmentPickerView()
                    .navigationBarTitle("Movies")
                }
            }
        .colorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
