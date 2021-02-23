//
//  WebView.swift
//  Socer swiftui
//
//  Created by hosam on 2/23/21.
//

import SwiftUI
import UIKit
import WebKit

//struct WebView: UIViewRepresentable{
//
//    var url: URL?     // optional, if absent, one of below search servers used
//    @Binding var reload: Bool
//
//    private let urls = [URL(string: "https://google.com/")!, URL(string: "https://bing.com")!]
//    private let webview = WKWebView()
//
//    fileprivate func loadRequest(in webView: WKWebView) {
//        if let url = url {
//            webView.load(URLRequest(url: url))
//        } else {
//            let index = Int(Date().timeIntervalSince1970) % 2
//            webView.load(URLRequest(url: urls[index]))
//        }
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
//        loadRequest(in: webview)
//        return webview
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
//        if reload {
//            loadRequest(in: uiView)
//            DispatchQueue.main.async {
//                self.reload = false     // must be async
//            }
//        }
//    }
//}

struct WebView: UIViewRepresentable {
     var urlString: String
  func makeUIView(context: Context) -> WKWebView {
  let view = WKWebView()
  guard let url = URL(string: urlString) else { return view }
  view.load(URLRequest(url: url))
  return view
  }

  func updateUIView(_ view: WKWebView, context: Context) {

  }
}
