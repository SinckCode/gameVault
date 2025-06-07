import SwiftUI

struct ContentView: View {
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
                
                
                
                // Barra inferior fija
                TabBarView()
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
        }
    }
}



struct TabBarView: View {
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
    ContentView()
}
