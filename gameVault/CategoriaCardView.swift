//
//  CategoriaCardView.swift
//  gameVault
//
//  Created by Onesto on 15/06/25.
//

import SwiftUI

struct CategoriaCardView: View {
    let categoria: String

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(height: 80)

            Text(categoria)
                .font(.caption)
                .foregroundColor(.white)
                .font(.headline)
        }
    }
}
