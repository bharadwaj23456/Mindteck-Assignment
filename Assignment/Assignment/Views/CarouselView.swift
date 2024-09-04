//
//  CarouselView.swift
//  Assignment
//
//  Created by Reddy Bharadwaj Chowdary on 31/08/24.
//

import SwiftUI

struct CarouselView: View {
    var images: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFit()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
