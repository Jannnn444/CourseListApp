//
//  DefaultImageView.swift
//  Course List
//
//  Created by yucian huang on 2024/3/13.
//

import SwiftUI

struct DefaultImageView: View {
    var body: some View {
        VStack {
            ProgressView()
                .padding()
            Image(systemName: "books.vertical")
                .font(.largeTitle)
                .padding(.bottom, 3)
            Text("Grabbing the image...")
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 60)
        .frame(maxWidth: .infinity)
        .background {
            Color.gray
                .opacity(0.5)
        }
    }
}

#Preview {
    DefaultImageView()
}
