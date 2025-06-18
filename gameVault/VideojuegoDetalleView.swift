import SwiftUI

struct VideojuegoDetalleView: View {
    let juego: Videojuego
    let onBack: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Botón de regreso
                Button("← Regresar") {
                    onBack()
                }
                .padding(.top)
                .padding(.horizontal)
                .foregroundColor(.blue)
                .font(.headline)
                
                // Imagen del videojuego
                if let url = URL(string: juego.imagenURL) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
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
                    .frame(height: 200)
                    .padding(.horizontal)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(juego.nombre)
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Género: \(juego.genero)")
                        .font(.headline)

                    Text("Rating: \(juego.rating)")
                        .font(.headline)

                    Text("Plataformas: \(juego.plataformas)")
                        .font(.headline)

                    Text(String(format: "Precio: $%.2f", juego.precio))
                        .font(.headline)

                    Divider().padding(.vertical, 10)

                    Text(juego.descripcion)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                }
                .padding(.horizontal)

                Spacer()
            }
            .foregroundColor(.white)
        }
        .background(Color.black.ignoresSafeArea())
    }
}
