//
//  CustomError.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

enum CustomError: Error {
    case invalidUrl(String)
    case serviceError(String)
    case networkError(String)
    case decodeError(String)
    case unknown
}
