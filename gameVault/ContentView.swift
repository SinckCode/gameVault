import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                // Título alineado a la izquierda
                HStack {
                    Text("GameVault")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.horizontal)
                    Spacer()
                }

                // Vista principal según pestaña
                Group {
                    switch selectedTab {
                    case 0:
                        HomeView()
                    case 1:
                        SearchView()
                    case 2:
                        FavoritesView()
                    default:
                        HomeView()
                    }
                }
                .padding(.bottom, 60) // ← espacio para la barra inferior

                Spacer(minLength: 0)
            }

            // Barra inferior flotante
            TabBarView(selectedTab: $selectedTab)
                .padding(.horizontal)
                .padding(.bottom, 10)
        }
    }
}
