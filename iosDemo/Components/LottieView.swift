//
//  LottieView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFill
        animationView.backgroundBehavior = .pauseAndRestore
        return animationView
    }

    func updateUIView(_ uiView: LottieAnimationView, context: Context) {}
}
