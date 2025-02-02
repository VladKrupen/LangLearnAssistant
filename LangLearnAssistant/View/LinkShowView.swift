//
//  LinkShowView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import SwiftUI

struct LinkShowView: View {
    
    @State var url: String
    @State var isLoaded: Bool = false
    @State var title: String = ""
    @EnvironmentObject var linkViewModel: LinkViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                WebView(url: $url) { isLoad in
                    self.isLoaded = isLoad
                }
            }
            .navigationTitle(title)
            .foregroundStyle(Color(.black))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Circle()
                        .frame(width: 30)
                        .foregroundStyle(isLoaded ? Color(red: 0.314, green: 0.631, blue: 0.498) : Color(.black))
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
