//
//  ContentView.swift
//  Assignment
//
//  Created by Reddy Bharadwaj Chowdary on 31/08/24.
//



import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var searchBarOffset: CGFloat = 0
    @State private var isSearchBarPinned = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 10) {
                        // Image Carousel
                        CarouselView(images: viewModel.images, selectedIndex: $viewModel.selectedIndex)
                            .frame(height: 300)
                        
                        // Sticky Search Bar
                        GeometryReader { geo in
                            PinnedSearchBarView(text: $viewModel.searchText)
                                .background(Color(.systemGray6))
                                .onAppear {
                                    searchBarOffset = geo.frame(in: .global).minY
                                }
                                .onChange(of: geo.frame(in: .global).minY) { newOffset in
                                    if newOffset < searchBarOffset {
                                        isSearchBarPinned = true
                                    } else {
                                        isSearchBarPinned = false
                                    }
                                }
                        }
                        .frame(height: 60)
                        .padding(.horizontal)

                        // List
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.filteredItems) { item in
                                Text(item.name)
                                    .padding()
                                Divider()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Conditionally render the pinned search bar
                if isSearchBarPinned {
                    PinnedSearchBarView(text: $viewModel.searchText)
                        .background(Color(.systemGray6))
                        .shadow(color: .gray, radius: 4, x: 0, y: 2)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                        .transition(.slide)
                        .animation(.easeInOut)
                }
            }
        }
        .edgesIgnoringSafeArea(isSearchBarPinned ? .top : [])
    }
}
