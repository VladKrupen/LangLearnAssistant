//
//  TabBarView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var listViewModel = ListViewModel()
    @ObservedObject var linkViewModel = LinkViewModel()
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        ZStack {
            TabView {
                ListView()
                    .environmentObject(listViewModel)
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
                LinksView()
                    .environmentObject(linkViewModel)
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image(systemName: "link")
                            Text("Links")
                        }
                    }
            }
            
            if listViewModel.isShowAddView {
                AddNewWordView()
                    .environmentObject(listViewModel)
            }
            if linkViewModel.isShowAddLink {
                AddNewLinkView()
                    .environmentObject(linkViewModel)
            }
        }
    }
}
    
#Preview {
    TabBarView()
}
