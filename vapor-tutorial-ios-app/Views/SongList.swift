//
//  SongList.swift
//  vapor-tutorial-ios-app
//
//  Created by Aston Martinez on 12/14/23.
//

import SwiftUI

struct SongList: View {
    @StateObject var viewModel = SongListViewModel()
    var body: some View {

        NavigationView {
            List {
                ForEach(viewModel.songs) { song in
                    Button {
                        print("selected")
                    } label: {
                        Text(song.title)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("🎵 Songs"))
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("❌ Error: \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        SongList()
    }
}

