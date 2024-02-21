//
//  CharacterListRepositoryProtocol.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

protocol CharacterListRepositoryProtocol {
    
    /**
     *  Fetch a list of characters from an endpoint
     * - Parameter pageNumber: The page of characters to fetch
     * - Returns: A DTO with the result of fetching a list of charaters
     * - Throws: **CustomError.invalidUrl:** when the url is not valid when appending the parameter to the endpoint. **CustomError.serviceError:**  when the response status code is not OK.  **CustomError.decodeError:**  when It is not possible to decode the response. **CustomError.networkError:** When there is another error with the service call
     */
    func fetch(pageNumber: Int) async throws -> CharacterListDTO
}
