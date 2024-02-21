//
//  NetworkClientMock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo.Giampietri on 20/02/2024.
//

import Foundation
@testable import TheStartWarsGuide

final class NetworkClientMock: NetworkingClientProtocol {
    var dto: Decodable?
    var error: CustomError = .unknown
    
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        guard let dto = dto as? T else { throw error }
        return dto
    }
}
