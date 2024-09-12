//
//  LinksView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI
import RealmSwift

struct LinksView: View {
    
    @EnvironmentObject var linkViewModel: LinkViewModel
    @ObservedResults(LinkItem.self) var linkItems
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(linkItems, id:\.id) { linkItem in
                            NavigationLink {
                                LinkShowView(url: linkItem.link)
                            } label: {
                                CardLink(linkItem: linkItem) {
                                    $linkItems.remove(linkItem)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Links")
                
                Button {
                    linkViewModel.isShowAddLink.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 56)
                            .foregroundStyle(Color(red: 0.314, green: 0.631, blue: 0.498))
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color(.white))
                    }
                }
                .offset(x: -20, y: -30)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct CardLink: View {
    
    @EnvironmentObject var linkViewModel: LinkViewModel
    var linkItem: LinkItem
    var onDelete: () -> ()
    
    var body: some View {
        HStack() {
            HStack(spacing: 15) {
                Image(systemName: "link")
                Text(linkItem.linkName)
                    .font(.system(size: 14))
            }
            .foregroundStyle(Color(.black))
            Spacer()
            Button {
                onDelete()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color(.black))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TabBarView()
}
