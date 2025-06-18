import SwiftUI

struct GameCardView: View {
    let game: Videojuego
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: game.imagenURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                case .empty:
                    Color.gray.opacity(0.3)
                @unknown default:
                    Color.red
                }
            }
            .frame(height: 120)
            .cornerRadius(10)
            .clipped()

            Text(game.nombre)
                .font(.headline)
                .foregroundColor(.white)
                .font(.headline)
            
            Text("Categoría: \(game.genero)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(15)
        .contentShape(Rectangle()) // ← Esto hace que todo el área sea tocable
        .onTapGesture {
            onTap()
        }
    }
}
