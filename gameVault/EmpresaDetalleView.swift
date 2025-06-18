import SwiftUI

struct EmpresaDetalleView: View {
    let empresa: Company
    let onBack: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button("← Regresar") {
                onBack()
            }
            .padding(.top)
            .foregroundColor(.blue)
            .font(.headline)
            
            Text(empresa.nombre)
                .font(.largeTitle)
                .fontWeight(.bold)

            if let url = URL(string: empresa.imagenURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 200)
            }

            Text("Fundada en: \(empresa.fundacion)")
                .font(.subheadline)

            Text(empresa.historia)
                .font(.body)

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
