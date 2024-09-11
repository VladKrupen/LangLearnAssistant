//
//  TabBarView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListView()
                .tag(1)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("List")
                    }
                }
            RandomWordView()
                .tag(2)
                .tabItem {
                    VStack {
                        Image(systemName: "textformat.abc")
                        Text("Words")
                    }
                }
            Text("Links")
                .tag(3)
                .tabItem {
                    VStack {
                        Image(systemName: "link")
                        Text("Links")
                    }
                }
        }
    }
}
    
    #Preview {
        TabBarView()
    }
