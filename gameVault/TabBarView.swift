//
//  TabBarView.swift
//  gameVault
//
//  Created by Onesto on 15/06/25.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            Spacer()

            Button(action: { selectedTab = 0 }) {
                Image(systemName: "house.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle()) // ← Esto elimina el fondo gris del sistema

            Spacer()

            Button(action: { selectedTab = 1 }) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())

            Spacer()

            Button(action: { selectedTab = 2 }) {
                Image(systemName: "star.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())

            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
        .background(Color.pink.opacity(0.95))
        .cornerRadius(15)
    }
}
