// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AllCountriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllCountries {
      Country {
        __typename
        name
        alpha2Code
        capital
        subregion {
          __typename
          region {
            __typename
            name
          }
        }
        population
        currencies {
          __typename
          name
        }
        officialLanguages {
          __typename
          name
        }
        timezones {
          __typename
          name
        }
        callingCodes {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "AllCountries"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Country", type: .list(.object(Country.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(country: [Country?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Country": country.flatMap { (value: [Country?]) -> [ResultMap?] in value.map { (value: Country?) -> ResultMap? in value.flatMap { (value: Country) -> ResultMap in value.resultMap } } }])
    }

    public var country: [Country?]? {
      get {
        return (resultMap["Country"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Country?] in value.map { (value: ResultMap?) -> Country? in value.flatMap { (value: ResultMap) -> Country in Country(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Country?]) -> [ResultMap?] in value.map { (value: Country?) -> ResultMap? in value.flatMap { (value: Country) -> ResultMap in value.resultMap } } }, forKey: "Country")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Country"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("alpha2Code", type: .nonNull(.scalar(String.self))),
          GraphQLField("capital", type: .nonNull(.scalar(String.self))),
          GraphQLField("subregion", type: .object(Subregion.selections)),
          GraphQLField("population", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currencies", type: .list(.object(Currency.selections))),
          GraphQLField("officialLanguages", type: .list(.object(OfficialLanguage.selections))),
          GraphQLField("timezones", type: .list(.object(Timezone.selections))),
          GraphQLField("callingCodes", type: .list(.object(CallingCode.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, alpha2Code: String, capital: String, subregion: Subregion? = nil, population: Double, currencies: [Currency?]? = nil, officialLanguages: [OfficialLanguage?]? = nil, timezones: [Timezone?]? = nil, callingCodes: [CallingCode?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Country", "name": name, "alpha2Code": alpha2Code, "capital": capital, "subregion": subregion.flatMap { (value: Subregion) -> ResultMap in value.resultMap }, "population": population, "currencies": currencies.flatMap { (value: [Currency?]) -> [ResultMap?] in value.map { (value: Currency?) -> ResultMap? in value.flatMap { (value: Currency) -> ResultMap in value.resultMap } } }, "officialLanguages": officialLanguages.flatMap { (value: [OfficialLanguage?]) -> [ResultMap?] in value.map { (value: OfficialLanguage?) -> ResultMap? in value.flatMap { (value: OfficialLanguage) -> ResultMap in value.resultMap } } }, "timezones": timezones.flatMap { (value: [Timezone?]) -> [ResultMap?] in value.map { (value: Timezone?) -> ResultMap? in value.flatMap { (value: Timezone) -> ResultMap in value.resultMap } } }, "callingCodes": callingCodes.flatMap { (value: [CallingCode?]) -> [ResultMap?] in value.map { (value: CallingCode?) -> ResultMap? in value.flatMap { (value: CallingCode) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// ISO 3166-1 alpha-2 codes are two-letter country codes defined in ISO 3166-1, part of the ISO 3166 standard published by the International Organization for Standardization (ISO), to represent countries, dependent territories, and special areas of geographical interest. https://en.m.wikipedia.org/wiki/ISO_3166-1_alpha-2
      public var alpha2Code: String {
        get {
          return resultMap["alpha2Code"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "alpha2Code")
        }
      }

      public var capital: String {
        get {
          return resultMap["capital"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "capital")
        }
      }

      public var subregion: Subregion? {
        get {
          return (resultMap["subregion"] as? ResultMap).flatMap { Subregion(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "subregion")
        }
      }

      public var population: Double {
        get {
          return resultMap["population"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "population")
        }
      }

      public var currencies: [Currency?]? {
        get {
          return (resultMap["currencies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Currency?] in value.map { (value: ResultMap?) -> Currency? in value.flatMap { (value: ResultMap) -> Currency in Currency(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Currency?]) -> [ResultMap?] in value.map { (value: Currency?) -> ResultMap? in value.flatMap { (value: Currency) -> ResultMap in value.resultMap } } }, forKey: "currencies")
        }
      }

      public var officialLanguages: [OfficialLanguage?]? {
        get {
          return (resultMap["officialLanguages"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [OfficialLanguage?] in value.map { (value: ResultMap?) -> OfficialLanguage? in value.flatMap { (value: ResultMap) -> OfficialLanguage in OfficialLanguage(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [OfficialLanguage?]) -> [ResultMap?] in value.map { (value: OfficialLanguage?) -> ResultMap? in value.flatMap { (value: OfficialLanguage) -> ResultMap in value.resultMap } } }, forKey: "officialLanguages")
        }
      }

      public var timezones: [Timezone?]? {
        get {
          return (resultMap["timezones"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Timezone?] in value.map { (value: ResultMap?) -> Timezone? in value.flatMap { (value: ResultMap) -> Timezone in Timezone(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Timezone?]) -> [ResultMap?] in value.map { (value: Timezone?) -> ResultMap? in value.flatMap { (value: Timezone) -> ResultMap in value.resultMap } } }, forKey: "timezones")
        }
      }

      public var callingCodes: [CallingCode?]? {
        get {
          return (resultMap["callingCodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [CallingCode?] in value.map { (value: ResultMap?) -> CallingCode? in value.flatMap { (value: ResultMap) -> CallingCode in CallingCode(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [CallingCode?]) -> [ResultMap?] in value.map { (value: CallingCode?) -> ResultMap? in value.flatMap { (value: CallingCode) -> ResultMap in value.resultMap } } }, forKey: "callingCodes")
        }
      }

      public struct Subregion: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Subregion"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("region", type: .object(Region.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(region: Region? = nil) {
          self.init(unsafeResultMap: ["__typename": "Subregion", "region": region.flatMap { (value: Region) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var region: Region? {
          get {
            return (resultMap["region"] as? ResultMap).flatMap { Region(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "region")
          }
        }

        public struct Region: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Region"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Region", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct Currency: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Currency"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Currency", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct OfficialLanguage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Language"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Language", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Timezone: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Timezone"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Timezone", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct CallingCode: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CallingCode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "CallingCode", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}
