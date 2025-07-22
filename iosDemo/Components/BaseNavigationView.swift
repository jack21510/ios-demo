//
//  BaseNavigationView.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/20.
//

import SwiftUI

struct BaseNavigationView<Content: View>: View {
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        NavigationView {
            content()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline) // 支援大標題樣式
        }
        .navigationViewStyle(StackNavigationViewStyle()) //  強制使用手機式樣
    }
}

