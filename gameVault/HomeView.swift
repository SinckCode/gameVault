import SwiftUI

struct HomeView: View {
    @State private var categorias: [String] = []
    @State private var empresas: [Company] = []
    @State private var videojuegos: [Videojuego] = []
    @State private var selectedEmpresa: Company?
    @State private var selectedCategoria: String?
    @State private var selectedJuego: Videojuego?

    @State private var currentEmpresaIndex: Int = 0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if let juego = selectedJuego {
                VideojuegoDetalleView(juego: juego) {
                    selectedJuego = nil
                }
            } else if let empresa = selectedEmpresa {
                EmpresaDetalleView(empresa: empresa) {
                    selectedEmpresa = nil
                }
            } else if let categoria = selectedCategoria {
                CategoriaJuegosView(
                    categoria: categoria,
                    juegos: videojuegos,
                    onBack: { selectedCategoria = nil },
                    onSelect: { juego in
                        selectedJuego = juego
                    }
                )
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        // EMPRESAS
                        Text("Empresas de videojuegos")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .padding(.top, 5)
                            .foregroundColor(.white)

                        ScrollViewReader { scrollProxy in
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(Array(empresas.enumerated()), id: \.element.id) { index, empresa in
                                        Button(action: {
                                            selectedEmpresa = empresa
                                        }) {
                                            VStack(alignment: .leading, spacing: 10) {
                                                AsyncImage(url: URL(string: empresa.imagenURL)) { phase in
                                                    switch phase {
                                                    case .success(let image):
                                                        image
                                                            .resizable()
                                                            .scaledToFill()
                                                    case .failure(_):
                                                        Image(systemName: "photo")
                                                            .resizable()
                                                            .scaledToFit()
                                                                                                                
                                                    case .empty:
                                                        Color.gray.opacity(0.3)
                                                    @unknown default:
                                                        Color.red
                                                    }
                                                }
                                                .frame(width: 280, height: 160)
                                                .cornerRadius(15)
                                                .clipped()

                                                Text(empresa.nombre)
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)

                                                Text("Fundada: \(empresa.fundacion)")
                                                    .font(.caption)
                                                    
                                            }
                                            .frame(width: 280)
                                            .padding(.bottom, 3)
                                        }
                                        .id(index)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .onAppear {
                                startEmpresaCarousel(scrollProxy: scrollProxy)
                            }
                            .onDisappear {
                                timer?.invalidate()
                            }
                        }

                        // CATEGORÍAS
                        Text("Categorías")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .foregroundColor(.white)

                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                            ForEach(categorias, id: \.self) { categoria in
                                // Estado para detectar si el cursor está encima
                                @State var isHovering = false

                                Button(action: {
                                    selectedCategoria = categoria
                                }) {
                                    VStack {
                                        if let juego = videojuegos.first(where: { $0.genero == categoria }),
                                           let url = URL(string: juego.imagenURL) {
                                            AsyncImage(url: url) { phase in
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
                                                    Color.gray
                                                @unknown default:
                                                    Color.red
                                                }
                                            }
                                            .frame(height: 80)
                                            .cornerRadius(10)
                                        } else {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.blue)
                                                .frame(height: 80)
                                        }

                                        Text(categoria)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.top, 5)
                                            
                                    }
                                    .padding(.top, 12)
                                    .padding(.bottom, 12)
                                    .padding(.horizontal, 4)
                                    .background(isHovering ? Color.white.opacity(0.08) : Color.clear)
                                    .cornerRadius(10)
                                    .onHover { hovering in
                                        isHovering = hovering
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .onAppear {
            APIService.shared.fetchCompanies { empresas in
                self.empresas = empresas
            }
            APIService.shared.fetchVideojuegos { juegos in
                self.videojuegos = juegos
                self.categorias = Array(Set(juegos.map { $0.genero })).sorted()
            }
        }
    }

    private func startEmpresaCarousel(scrollProxy: ScrollViewProxy) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            guard !empresas.isEmpty else { return }
            withAnimation {
                currentEmpresaIndex = (currentEmpresaIndex + 1) % empresas.count
                scrollProxy.scrollTo(currentEmpresaIndex, anchor: .center)
            }
        }
    }
}
