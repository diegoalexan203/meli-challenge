//
//  Product.swift
//  diego8a.MeliApp
//
//  Created by Diego Ochoa on 23/06/22.
//

import Foundation

struct Product: Codable {
    let countryDefaultTimeZone, query: String
    let paging: Paging
    let results: [Result]
    let sort: Sort

    enum CodingKeys: String, CodingKey {
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results, sort

    }
}


// MARK: - Sort
struct Sort: Codable {
    let id: String?
    let name: String
}


// MARK: - Paging
struct Paging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let permalink: String
    let thumbnail: String
    let thumbnailID: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case permalink, thumbnail
        case thumbnailID = "thumbnail_id"
    }
}



// MARK: - Attribute
struct Attribute: Codable {
    let id: ID
    let valueID: String?
    let valueStruct: Struct?
    let values: [AttributeValue]
    let attributeGroupName: AttributeGroupName
    let source: Int
    let name: Name
    let valueName: String
    let attributeGroupID: AttributeGroupID

    enum CodingKeys: String, CodingKey {
        case id
        case valueID = "value_id"
        case valueStruct = "value_struct"
        case values
        case attributeGroupName = "attribute_group_name"
        case source, name
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
    }
}

enum AttributeGroupID: String, Codable {
    case adicionales = "ADICIONALES"
    case confort = "CONFORT"
    case dflt = "DFLT"
    case empty = ""
    case find = "FIND"
}

enum AttributeGroupName: String, Codable {
    case adicionales = "Adicionales"
    case confort = "Confort"
    case empty = ""
    case fichaTécnica = "Ficha técnica"
    case otros = "Otros"
}

enum ID: String, Codable {
    case brand = "BRAND"
    case doors = "DOORS"
    case engine = "ENGINE"
    case engineDisplacement = "ENGINE_DISPLACEMENT"
    case fuelType = "FUEL_TYPE"
    case hasAirConditioning = "HAS_AIR_CONDITIONING"
    case itemCondition = "ITEM_CONDITION"
    case kilometers = "KILOMETERS"
    case length = "LENGTH"
    case model = "MODEL"
    case passengerCapacity = "PASSENGER_CAPACITY"
    case power = "POWER"
    case singleOwner = "SINGLE_OWNER"
    case tractionControl = "TRACTION_CONTROL"
    case transmission = "TRANSMISSION"
    case trim = "TRIM"
    case vehicleYear = "VEHICLE_YEAR"
}

enum Name: String, Codable {
    case aireAcondicionado = "Aire acondicionado"
    case año = "Año"
    case capacidadDePersonas = "Capacidad de personas"
    case cilindrada = "Cilindrada"
    case condiciónDelÍtem = "Condición del ítem"
    case controlDeTracción = "Control de tracción"
    case kilómetros = "Kilómetros"
    case largo = "Largo"
    case marca = "Marca"
    case modelo = "Modelo"
    case motor = "Motor"
    case potencia = "Potencia"
    case puertas = "Puertas"
    case tipoDeCombustible = "Tipo de combustible"
    case transmisión = "Transmisión"
    case versión = "Versión"
    case únicoDueño = "Único dueño"
}

// MARK: - Struct
struct Struct: Codable {
    let number: Double
    let unit: Unit
}

enum Unit: String, Codable {
    case hp = "hp"
    case km = "km"
    case l = "L"
    case mm = "mm"
}

// MARK: - AttributeValue
struct AttributeValue: Codable {
    let id: String?
    let name: String
    let valueStruct: Struct?
    let source: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct = "struct"
        case source
    }
}

enum BuyingMode: String, Codable {
    case classified = "classified"
}

enum CategoryID: String, Codable {
    case mla1744 = "MLA1744"
}

enum Condition: String, Codable {
    case used = "used"
}

enum CurrencyID: String, Codable {
    case ars = "ARS"
    case usd = "USD"
}

enum DomainID: String, Codable {
    case mlaCarsAndVans = "MLA-CARS_AND_VANS"
}

enum ListingTypeID: String, Codable {
    case free = "free"
    case gold = "gold"
    case goldPremium = "gold_premium"
    case silver = "silver"
}

// MARK: - Location
struct Location: Codable {
    let addressLine, zipCode: String
    let subneighborhood: JSONNull?
    let neighborhood, city, state, country: Sort
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case subneighborhood, neighborhood, city, state, country, latitude, longitude
    }
}

// MARK: - Prices
struct Prices: Codable {
    let id: String
    let prices: [Price]
    let presentation: Presentation
    let paymentMethodPrices: [JSONAny]
    let referencePrices: [Price]
    let purchaseDiscounts: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id, prices, presentation
        case paymentMethodPrices = "payment_method_prices"
        case referencePrices = "reference_prices"
        case purchaseDiscounts = "purchase_discounts"
    }
}

// MARK: - Presentation
struct Presentation: Codable {
    let displayCurrency: CurrencyID

    enum CodingKeys: String, CodingKey {
        case displayCurrency = "display_currency"
    }
}

// MARK: - Price
struct Price: Codable {
    let id: String
    let type: TypeEnum
    let amount: Int
    let regularAmount: JSONNull?
    let currencyID: CurrencyID
    let lastUpdated: Date
    let conditions: Conditions
    let exchangeRateContext: ExchangeRateContext
    let metadata: Metadata?
    let tags: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case id, type, amount
        case regularAmount = "regular_amount"
        case currencyID = "currency_id"
        case lastUpdated = "last_updated"
        case conditions
        case exchangeRateContext = "exchange_rate_context"
        case metadata, tags
    }
}

// MARK: - Conditions
struct Conditions: Codable {
    let contextRestrictions: [ContextRestriction]
    let startTime, endTime: JSONNull?
    let eligible: Bool

    enum CodingKeys: String, CodingKey {
        case contextRestrictions = "context_restrictions"
        case startTime = "start_time"
        case endTime = "end_time"
        case eligible
    }
}

enum ContextRestriction: String, Codable {
    case channelMarketplace = "channel_marketplace"
}

enum ExchangeRateContext: String, Codable {
    case exchangeRateContextDEFAULT = "DEFAULT"
}

// MARK: - Metadata
struct Metadata: Codable {
}

enum TypeEnum: String, Codable {
    case minStandard = "min_standard"
    case standard = "standard"
}

// MARK: - Seller
struct Seller: Codable {
    let id: Int
    let permalink: String
    let registrationDate: String
    let carDealer, realEstateAgency: Bool
    let tags: [SellerTag]
    let sellerReputation: SellerReputation
    let eshop: Eshop?

    enum CodingKeys: String, CodingKey {
        case id, permalink
        case registrationDate = "registration_date"
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
        case tags
        case sellerReputation = "seller_reputation"
        case eshop
    }
}

// MARK: - Eshop
struct Eshop: Codable {
    let seller: Int
    let eshopRubro: JSONNull?
    let eshopID: Int
    let nickName: String
    let siteID: SiteID
    let eshopLogoURL: String
    let eshopStatusID, eshopExperience: Int
    let eshopLocations: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case seller
        case eshopRubro = "eshop_rubro"
        case eshopID = "eshop_id"
        case nickName = "nick_name"
        case siteID = "site_id"
        case eshopLogoURL = "eshop_logo_url"
        case eshopStatusID = "eshop_status_id"
        case eshopExperience = "eshop_experience"
        case eshopLocations = "eshop_locations"
    }
}

enum SiteID: String, Codable {
    case mla = "MLA"
}

// MARK: - SellerReputation
struct SellerReputation: Codable {
    let powerSellerStatus: JSONNull?
    let levelID: String?
    let metrics: Metrics
    let transactions: Transactions

    enum CodingKeys: String, CodingKey {
        case powerSellerStatus = "power_seller_status"
        case levelID = "level_id"
        case metrics, transactions
    }
}

// MARK: - Metrics
struct Metrics: Codable {
    let cancellations, claims, delayedHandlingTime: Cancellations
    let sales: Sales

    enum CodingKeys: String, CodingKey {
        case cancellations, claims
        case delayedHandlingTime = "delayed_handling_time"
        case sales
    }
}

// MARK: - Cancellations
struct Cancellations: Codable {
    let period: CancellationsPeriod
    let rate: Double
    let value: Int
}

enum CancellationsPeriod: String, Codable {
    case the365Days = "365 days"
    case the60Months = "60 months"
}

// MARK: - Sales
struct Sales: Codable {
    let period: CancellationsPeriod
    let completed: Int
}

// MARK: - Transactions
struct Transactions: Codable {
    let canceled: Int
    let period: TransactionsPeriod
    let total: Int
    let ratings: Ratings
    let completed: Int
}

enum TransactionsPeriod: String, Codable {
    case historic = "historic"
}

// MARK: - Ratings
struct Ratings: Codable {
    let negative, neutral, positive: Double
}

enum SellerTag: String, Codable {
    case carDealer = "car_dealer"
    case creditsActiveBorrower = "credits_active_borrower"
    case creditsOpenMarket = "credits_open_market"
    case creditsPriority1 = "credits_priority_1"
    case creditsPriority2 = "credits_priority_2"
    case creditsPriority3 = "credits_priority_3"
    case creditsProfile = "credits_profile"
    case eshop = "eshop"
    case messagesAsSeller = "messages_as_seller"
    case mshops = "mshops"
    case normal = "normal"
    case nsmLow = "nsm_low"
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    let id, comment, addressLine, zipCode: String
    let country, state, city: Sort?
    let latitude, longitude: String

    enum CodingKeys: String, CodingKey {
        case id, comment
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case country, state, city, latitude, longitude
    }
}

// MARK: - SellerContact
struct SellerContact: Codable {
    let contact, otherInfo, areaCode, phone: String
    let areaCode2, phone2, email, webpage: String

    enum CodingKeys: String, CodingKey {
        case contact
        case otherInfo = "other_info"
        case areaCode = "area_code"
        case phone
        case areaCode2 = "area_code2"
        case phone2, email, webpage
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool
    let mode: Mode
    let tags: [JSONAny]
    let logisticType: Mode?
    let storePickUp: Bool

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}

enum Mode: String, Codable {
    case notSpecified = "not_specified"
}

enum ResultTag: String, Codable {
    case draggedVisits = "dragged_visits"
    case goodQualityPicture = "good_quality_picture"
    case goodQualityThumbnail = "good_quality_thumbnail"
    case immediatePayment = "immediate_payment"
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

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

