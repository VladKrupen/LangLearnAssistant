//
//  LinksView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI

struct LinksView: View {
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView {
                VStack(spacing: 10) {
                   LinkItem(text: "Урок по грамматике языка")
                   LinkItem(text: "Урок 3. Личные местоимения. Аффиксы сказуемости")
                   LinkItem(text: "Урок по грамматике языка")
                }
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
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal, 15)
    }
}

struct LinkItem: View {
    var text: String
    
    var body: some View {
        HStack() {
            HStack(spacing: 15) {
                Image(systemName: "link")
                Text(text)
                    .font(.system(size: 14))
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color(.black))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            
        }
    }
}

#Preview {
    TabBarView()
}
