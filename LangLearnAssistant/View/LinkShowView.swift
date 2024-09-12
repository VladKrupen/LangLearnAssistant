//
//  LinkShowView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import SwiftUI

struct LinkShowView: View {
    
    @Binding var url: String
    @State var isLoaded: Bool = false
    @State var title: String = ""
    @EnvironmentObject var linkViewModel: LinkViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Circle()
                        .frame(width: 30)
                        .foregroundStyle(isLoaded ? Color(red: 0.314, green: 0.631, blue: 0.498) : Color(.black))
                    Spacer()
                    Text(title)
                        .padding(.trailing, 10)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        linkViewModel.isShowLinkContent.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(.black))
                    }
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
                .background(Color(.systemGray5))
                
                WebView(url: $url) { isLoad in
                    self.isLoaded = isLoad
                }
            }
        }
        .onAppear {
            if let url = URL(string: url) {
                self.title = url.host(percentEncoded: true) ?? ""
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
