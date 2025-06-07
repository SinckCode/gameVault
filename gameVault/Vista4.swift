import SwiftUI

struct Vista4: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                
                // Barra superior
                HStack {
                    Text("Game Vault")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                }
                .padding()
                
                // Contenido principal con recuadros de juegos favoritos
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(1..<6) { index in
                            GameCardView(title: "Juego Favorito \(index)")
                        }
                    }
                    .padding(.bottom, 80) // espacio para no tapar por el TabBar
                    .padding(.horizontal)
                }
            }
            
            // Barra inferior fija
            TabBarView()
                .padding(.horizontal)
                .padding(.bottom, 10)
        }
    }
}

struct GameCardView: View {
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(height: 120)
            
            HStack {
                // Icono de juego a la izquierda
                Image(systemName: "gamecontroller.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                // Texto del juego
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
                
                // Icono de favorito a la derecha
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.title2)
            }
            .padding(.horizontal)
        }
        .shadow(radius: 5)
    }
}



struct TabBarView1: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "house.fill")
                Text("Inicio")
                    .font(.caption)
            }
            Spacer()
            VStack {
                Image(systemName: "magnifyingglass")
                Text("Buscar")
                    .font(.caption)
            }
            Spacer()
            VStack {
                Image(systemName: "star.fill")
                Text("Favoritos")
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
        .background(Color.blue.opacity(0.95))
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}

#Preview {
    Vista4()
}


