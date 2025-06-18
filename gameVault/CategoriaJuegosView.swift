import SwiftUI

struct CategoriaJuegosView: View {
    let categoria: String
    let juegos: [Videojuego]
    let onBack: () -> Void
    let onSelect: (Videojuego) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Button("← Regresar") {
                onBack()
            }
            .padding()
            .foregroundColor(.blue)
            .font(.headline)
            
            Text("Juegos de categoría: \(categoria)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(juegos.filter { $0.genero == categoria }) { juego in
                        GameCardView(game: juego) {
                            onSelect(juego)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom)
            }

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
