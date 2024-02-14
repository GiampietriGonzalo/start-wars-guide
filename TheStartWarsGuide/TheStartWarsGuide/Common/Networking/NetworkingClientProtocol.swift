//
//  NetworkingClientProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 14/02/2024.
//

import Foundation

protocol NetworkingClientProtocol {
    func fetch<T: Decodable>(from url: URL) async throws -> T
}
