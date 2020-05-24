//
//  Grid.swift
//  MoodTracker_v2
//
//  Created by Dhittaya and Nattarika on 21/5/2563 BE.
//  Copyright © 2563 Dhittaya and Nattarika. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct Grid<Content: View>: View {

    let rows: Int
    let cols: Int
    let content: (Int, Int) -> Content

    var body: some View {

        VStack {
            ForEach(0..<self.rows) { row in
                HStack {
                    ForEach(0..<self.cols) { col in
                        Spacer()
                        self.content(row, col)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                }

            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.cols = columns
        self.content = content
    }
}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid(rows: 5, columns: 7) { row, col in
        Text("1")

        }
    }
}
