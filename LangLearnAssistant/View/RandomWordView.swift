//
//  RandomWordView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI
import RealmSwift

struct RandomWordView: View {
    
    @State var isShowTranslate: Bool = false
    @ObservedResults(WordItem.self) var wordItems
    @State var offsetX: CGFloat = 0
    @State var opacity: CGFloat = 1
    @State var word = WordItem()
    @State var isWordsEmpty: Bool = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                Spacer()
                VStack(spacing: 23) {
                    VStack(alignment: .leading) {
                        Text("EN")
                            .font(.system(size: 12, weight: .black))
                            .padding(.bottom, 0)
                        Text(word.mainWord)
                            .font(.system(size: 36, weight: .black))
                    }
                    ZStack {
                        Text(word.wordTranslate)
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
                .opacity(opacity)
                .offset(x: offsetX)
                Spacer()
                Button {
                    withAnimation {
                        offsetX = -50
                        opacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isShowTranslate = false
                        getRandomWord()
                        offsetX = 50
                        withAnimation {
                            offsetX = 0
                            opacity = 1
                        }
                    }
                } label: {
                    HStack {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color(red: 0.314, green: 0.631, blue: 0.498))
                }
                .padding(.bottom, 30)
            }
            .opacity(isWordsEmpty ? 0 : 1)
            
            if isWordsEmpty {
                Text("Add words")
                    .font(.system(size: 25, weight: .black))
                    .opacity(isWordsEmpty ? 1 : 0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            isWordsEmpty = wordItems.isEmpty
            getRandomWord()
        }
    }
    
    func getRandomWord() {
        if !wordItems.isEmpty {
            let random = Int.random(in: 0...wordItems.count - 1)
            word = wordItems[random]
        }
    }
}

#Preview {
    TabBarView()
}
