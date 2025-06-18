import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Imagen de perfil simulada
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
                .padding(.top, 40)

            // Nombre de usuario simulado
            Text("Usuario GameVault")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            // Datos simulados
            VStack(alignment: .leading, spacing: 10) {
                Text("Correo: usuario@gamevault.com")
                Text("Miembro desde: 2024")
                Text("Total de juegos favoritos: 12")
            }
            .foregroundColor(.gray)
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Perfil")
    }
}
