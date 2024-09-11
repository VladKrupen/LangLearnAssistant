//
//  ListView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI

struct ListView: View {
    
    @State var searchText = ""
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 25) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                        TextField("Search", text: $searchText)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    VStack(spacing: 20) {
                      
                    }
                }
                .padding(.horizontal, 15)
            }
            
            Button {
                
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
    }
}

#Preview {
    TabBarView()
}
