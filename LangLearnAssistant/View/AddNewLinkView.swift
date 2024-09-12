//
//  AddNewLinkView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import SwiftUI

struct AddNewLinkView: View {
    
    @State var linkTitle = ""
    @State var link = ""
    @EnvironmentObject var linkViewModel: LinkViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("New link")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    withAnimation {
                        linkViewModel.isShowAddLink.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.black)
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    TextField("Title", text: $linkTitle)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack {
                    TextField("Link", text: $link)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))


            }
            
            Spacer()
            Button {
                
            } label: {
                Text("Save")
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.314, green: 0.631, blue: 0.498))
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(16)
        .background(.white)
    }
}

#Preview {
    AddNewLinkView()
}
