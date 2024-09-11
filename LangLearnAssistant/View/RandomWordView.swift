//
//  RandomWordView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI

struct RandomWordView: View {
    
    @State var isShowTranslate: Bool = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                Spacer()
                VStack(spacing: 23) {
                    VStack(alignment: .leading) {
                        Text("TR")
                            .font(.system(size: 12, weight: .black))
                            .padding(.bottom, 0)
                        Text("Araba")
                            .font(.system(size: 36, weight: .black))
                    }
                    ZStack {
                        Text("Машина")
                            .font(.system(size: 26, weight: .thin))
                            .opacity(isShowTranslate ? 1 : 0)
                        Button {
                            withAnimation {
                                isShowTranslate.toggle()
                            }
                        } label: {
                            Text("Show translate")
                                .padding(.vertical, 13)
                                .padding(.horizontal, 60)
                                .foregroundStyle(Color(.white))
                                .background(Color(red: 0.314, green: 0.631, blue: 0.498))
                                .clipShape(Capsule())
                        }
                        .opacity(isShowTranslate ? 0 : 1)
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    HStack {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color(red: 0.314, green: 0.631, blue: 0.498))
                }
                .padding(.bottom, 30)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TabBarView()
}
