//
//  CustomError.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

enum CustomError: Error {
    case invalidUrl
    case serviceError
    case networkError
    case decodeError
    case unknown
}
