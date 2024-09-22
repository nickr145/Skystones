//
//  GIFView.swift
//  Skystones
//
//  Created by Nicholas Rebello on 2024-09-22.
//

import SwiftUI
import WebKit

struct GIFView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.isOpaque = false

        if let path = Bundle.main.path(forResource: gifName, ofType: "gif") {
            let gifURL = URL(fileURLWithPath: path)
            let gifData = try? Data(contentsOf: gifURL)
            webView.load(gifData!, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: gifURL.deletingLastPathComponent())
        }
        
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

#Preview {
    ZStack {
        GIFView(gifName: "BoardBG")
            .scaledToFill()
    }
}


