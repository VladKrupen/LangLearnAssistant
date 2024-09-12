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
                        CardItem() {
                            
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
            
            Button {
                listViewModel.isShowAddView.toggle()
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
    
    @State var offsetX: CGFloat = 0
    
    var onDelete: () -> Void
    
    var body: some View {
        ZStack(alignment: .trailing) {
            removeImage()
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
                    Text("car alfdfkd")
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(x: offsetX)
            .gesture(DragGesture()
                .onChanged{ value in
                    if value.translation.width < 0 {
                        offsetX = value.translation.width
                    }
                }
                .onEnded{ value in
                    withAnimation {
                        if screenSize().width * 0.7 < -value.translation.width {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            withAnimation {
                                offsetX = -screenSize().width
                                onDelete()
                            }
                        } else {
                            offsetX = .zero
                        }
                    }
                }
            )
        }
    }
    
    
    func removeImage() -> some View {
        return Image(systemName: "xmark")
            .resizable()
            .frame(width: 10, height: 10)
            .offset(x: 30)
            .offset(x: offsetX * 0.5)
            .scaleEffect(CGSize(width: 0.1 * -offsetX * 0.08,
                                height: 0.1 * -offsetX * 0.08))
    }
}

#Preview {
    TabBarView()
}
