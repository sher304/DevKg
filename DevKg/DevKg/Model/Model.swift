//
//  Model.swift
//  DevKg
//
//  Created by Шермат Эшеров on 3/9/22.
//

import Foundation

// MARK: - DevResults
struct DevResults: Codable {
    let success: Bool
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let list: [List]
    let next: Bool
}

// MARK: - List
struct List: Codable {
    let type: TypeEnum
    let slug: String
    let currency: Currency
    let priceFrom, priceTo: Int
    let position: String
    let city: City?
    let salary: Salary
    let createdAt, updatedAt: String
    let isArchived: JSONNull?
    let gradient: Int
    let workday: JSONNull?
    let organizationName: String
    let organizationIcon: String?

    enum CodingKeys: String, CodingKey {
        case type, slug, currency
        case priceFrom = "price_from"
        case priceTo = "price_to"
        case position, city, salary
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isArchived = "is_archived"
        case gradient, workday
        case organizationName = "organization_name"
        case organizationIcon = "organization_icon"
    }
}

struct Link: Codable{
    let link: String?
}

enum City: String, Codable {
    case bishkek = "BISHKEK"
    case бишкек = "Бишкек"
}

enum Currency: String, Codable {
    case kgs = "kgs"
    case usd = "usd"
}

enum Salary: String, Codable {
    case monthly = "monthly"
}

enum TypeEnum: String, Codable {
    case office = "office"
    case remote = "remote"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
