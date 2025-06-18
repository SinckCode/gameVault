import SwiftUI

struct EmpresaCardView: View {
    let company: Company

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: company.imagenURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 180, height: 100)
            .clipped()
            .cornerRadius(10)

            Text(company.nombre)
                .font(.headline)
                .foregroundColor(.white)

            Text("Fundada: \(company.fundacion)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(15)
    }
}
