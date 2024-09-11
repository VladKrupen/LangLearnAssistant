//
//  ListView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI

struct ListView: View {
    
    @State var searchText = ""
    @EnvironmentObject var listViewModel: ListViewModel
    
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
                        CardItem()
                        CardItem()
                        CardItem()
                    }
                }
                .padding(.horizontal, 15)
            }
            
            Button {
                withAnimation {
                    listViewModel.isShowAddView.toggle()
                }
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

struct CardItem: View {
    
    var body: some View {
        ZStack(alignment: .trailing) {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("TR")
                        .font(.system(size: 12, weight: .black))
                        .padding(.bottom, 5)
                    Text("Car")
                        .font(.system(size: 18, weight: .black))
                        .padding(.bottom, 4)
                    Text("Машина")
                        .font(.system(size: 18, weight: .light))
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("Примечание")
                        .font(.system(size: 12, weight: .black))
                        .foregroundStyle(Color(.systemGray))
                    Text("аова алвао давыа ов давыолаовы")
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TabBarView()
}
