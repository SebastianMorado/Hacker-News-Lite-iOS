//
//  ContentView.swift
//  H4X0R News
//
//  Created by Sebastian Morado on 5/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    VStack(alignment: .leading){
                        HStack {
                            Text("\(post.points) pts • \(getDate(post.created_at).timeAgoDisplay())")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        Text(post.title)
                            .fontWeight(.medium)
                    }
                }
                .padding(.vertical,5)
            }
            .navigationBarTitle("Hacker News Lite")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
    
    func getDate(_ time: String) -> Date {
        return dateFormatter.date(from: time) ?? .distantPast
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

