//
//  WebView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    @Binding var url: String
    var isLoad: (Bool) -> ()
    
    func makeUIView(context: Context) -> some UIView {
        
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        guard let openUrl = URL(string: url) else {
            return WKWebView()
        }
    
        let urlComponent = URLComponents(url: openUrl, resolvingAgainstBaseURL: true)
        let request = URLRequest(url: urlComponent?.url ?? openUrl)
        
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator { isLoad in
            self.isLoad(isLoad)
        }
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    let isLoad: (Bool) -> Void
    
    init(isLoad: @escaping (Bool) -> Void) {
        self.isLoad = isLoad
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isLoad(true)
    }
}

