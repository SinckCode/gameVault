import SwiftUI

struct CompanyView: View {
    @State private var companies: [Company] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Empresas de videojuegos")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                ForEach(companies) { company in
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: company.imagenURL)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(height: 150)
                        .cornerRadius(10)

                        Text(company.nombre)
                            .font(.headline)
                            .foregroundColor(.white)

                        Text("Fundada: \(company.fundacion)")
                            .foregroundColor(.gray)
                            .font(.headline)

                        Text(company.historia)
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            APIService.shared.fetchCompanies { data in
                self.companies = data
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
