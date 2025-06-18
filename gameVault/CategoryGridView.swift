//
//  CategoryGridView.swift
//  gameVault
//
//  Created by Onesto on 15/06/25.
//

import SwiftUI

struct CategoryGridView: View {
    let categorias = [
        "Aventura", "Acción", "Estrategia",
        "RPG", "Shooter", "Puzzle"
    ]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Categorías")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal)

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(categorias, id: \.self) { categoria in
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.4))
                            .frame(height: 80)
                        Text(categoria)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
