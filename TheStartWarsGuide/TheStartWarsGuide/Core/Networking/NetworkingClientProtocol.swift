//
//  NetworkingClientProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import Foundation

/**
 *  Handle networking calls
 * - Parameter url: The endpoint to perform the service call
 * - Returns: A Decodable instance
 * - Throws: An error if something goes wrong
 */
protocol NetworkingClientProtocol {
    func fetch<T: Decodable>(from url: URL) async throws -> T
}
