import SwiftUI

struct FavoritesView: View {
    @State private var favoritos: [Videojuego] = []
    @State private var selectedJuego: Videojuego?

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if let juego = selectedJuego {
                VideojuegoDetalleView(juego: juego, onBack: {
                    selectedJuego = nil
                })
            } else {
                VStack(alignment: .leading) {
                    Text("Tus favoritos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                        .foregroundColor(.white)

                    if favoritos.isEmpty {
                        Text("Aún no tienes favoritos.")
                            .padding()
                            .foregroundColor(.gray)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 15) {
                                ForEach(favoritos) { juego in
                                    GameCardView(game: juego) {
                                        selectedJuego = juego
                                    }
                                    .padding(.horizontal) // ← Aquí va el padding por tarjeta
                                }
                            }
                            .padding(.bottom)
                        }

                    }
                }
            }
        }
        .onAppear(perform: fetchFavoritos)
        .foregroundColor(.white)
    }

    func fetchFavoritos() {
        // Lógica temporal para mostrar algunos juegos como favoritos
        guard let url = URL(string: "https://whale-app-f76gv.ondigitalocean.app/videojuegos") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Videojuego].self, from: data) {
                    DispatchQueue.main.async {
                        self.favoritos = decoded.filter {
                            $0.nombre.contains("Zelda") || $0.nombre.contains("Mario")
                        }
                    }
                }
            }
        }.resume()
    }
}
