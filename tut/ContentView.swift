//
//  ContentView.swift
//  tut
//
//  Created by Sonal on 27/12/24.
//

import SwiftUI
import UIKit

//MARK: 1
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}


//MARK: 2
struct ContentView: View {
    var body: some View {
        Button("Present VC1") {
            if let topVC = UIApplication.shared.connectedScenes
                .compactMap({ ($0 as? UIWindowScene)?.keyWindow })
                .first?.rootViewController {
                
                let nav = UINavigationController(rootViewController: VC1())
                nav.modalPresentationStyle = .overFullScreen
                topVC.present(nav, animated: true)
            }
        }
    }
}
