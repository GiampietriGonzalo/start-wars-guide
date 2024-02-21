//
//  CustomError.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

enum CustomError: Error {
    case invalidUrl
    case serviceError
    case networkError
    case decodeError
    case unknown
}
