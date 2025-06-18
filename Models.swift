//
//  Models.swift
//  gameVault
//
//  Created by Onesto on 15/06/25.
//

// Models.swift
// GameVault
// Definición de modelos de datos usados en la app
import Foundation

// Modelo de videojuegos
struct Videojuego: Codable, Identifiable {
    let id: String
    let nombre: String
    let descripcion: String
    let rating: String
    let plataformas: String
    let genero: String
    let precio: Double
    let imagenURL: String
}

// Modelo de compañías
struct Company: Codable, Identifiable {
    let id: String
    let nombre: String
    let fundacion: String
    let historia: String
    let imagenURL: String
}
