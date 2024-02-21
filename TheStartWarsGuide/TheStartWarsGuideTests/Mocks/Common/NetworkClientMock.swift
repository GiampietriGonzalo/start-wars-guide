//
//  NetworkClientMock.swift
//  TheStartWarsGuideTests
//
//  Created by Gonzalo Giampietri
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
