import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var videojuegos: [Videojuego] = []
    @State private var selectedJuego: Videojuego?

    var filteredGames: [Videojuego] {
        if searchText.isEmpty {
            return videojuegos
        } else {
            return videojuegos.filter { $0.nombre.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if let juego = selectedJuego {
                VideojuegoDetalleView(juego: juego, onBack: {
                    selectedJuego = nil
                })
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Buscar videojuego...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding()

                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(filteredGames) { juego in
                                GameCardView(game: juego) {
                                    selectedJuego = juego
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
            }
        }
        .foregroundColor(.white)
        .onAppear(perform: fetchVideojuegos)
    }

    func fetchVideojuegos() {
        APIService.shared.fetchVideojuegos { data in
            self.videojuegos = data
        }
    }
}
