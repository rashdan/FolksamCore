// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

// swiftlint:disable all
public final class GetUserQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
        """
        query GetUser {
          user {
            __typename
            email
            address {
              __typename
              postalcode
              street
              subregion
            }
            telephone
            customernumber
            person {
              __typename
              firstname
              surname
              birthdate
            }
          }
        }
        """

    public let operationName: String = "GetUser"

    public let operationIdentifier: String? = "995e3010ff58a4358f8cf0676978e2d5847a0e44f3489fcc9a7507340537c978"

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]

        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("user", type: .object(User.selections)),
            ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
        }

        public var user: User? {
            get {
                return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
        }

        public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("email", type: .scalar(String.self)),
                    GraphQLField("address", type: .object(Address.selections)),
                    GraphQLField("telephone", type: .scalar(String.self)),
                    GraphQLField("customernumber", type: .scalar(String.self)),
                    GraphQLField("person", type: .object(Person.selections)),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(email: String? = nil, address: Address? = nil, telephone: String? = nil, customernumber: String? = nil, person: Person? = nil) {
                self.init(unsafeResultMap: ["__typename": "User", "email": email, "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }, "telephone": telephone, "customernumber": customernumber, "person": person.flatMap { (value: Person) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var email: String? {
                get {
                    return resultMap["email"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "email")
                }
            }

            public var address: Address? {
                get {
                    return (resultMap["address"] as? ResultMap).flatMap { Address(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "address")
                }
            }

            public var telephone: String? {
                get {
                    return resultMap["telephone"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "telephone")
                }
            }

            public var customernumber: String? {
                get {
                    return resultMap["customernumber"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "customernumber")
                }
            }

            public var person: Person? {
                get {
                    return (resultMap["person"] as? ResultMap).flatMap { Person(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "person")
                }
            }

            public struct Address: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Address"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("postalcode", type: .scalar(String.self)),
                        GraphQLField("street", type: .scalar(String.self)),
                        GraphQLField("subregion", type: .scalar(String.self)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(postalcode: String? = nil, street: String? = nil, subregion: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Address", "postalcode": postalcode, "street": street, "subregion": subregion])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var postalcode: String? {
                    get {
                        return resultMap["postalcode"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "postalcode")
                    }
                }

                public var street: String? {
                    get {
                        return resultMap["street"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "street")
                    }
                }

                public var subregion: String? {
                    get {
                        return resultMap["subregion"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "subregion")
                    }
                }
            }

            public struct Person: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Person"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("firstname", type: .scalar(String.self)),
                        GraphQLField("surname", type: .scalar(String.self)),
                        GraphQLField("birthdate", type: .scalar(String.self)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(firstname: String? = nil, surname: String? = nil, birthdate: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Person", "firstname": firstname, "surname": surname, "birthdate": birthdate])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var firstname: String? {
                    get {
                        return resultMap["firstname"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "firstname")
                    }
                }

                public var surname: String? {
                    get {
                        return resultMap["surname"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "surname")
                    }
                }

                public var birthdate: String? {
                    get {
                        return resultMap["birthdate"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "birthdate")
                    }
                }
            }
        }
    }
}

public final class GetCasesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
        """
        query GetCases {
          cases {
            __typename
            title
            id
            desc
            metadata {
              __typename
              user_has_unread_message
            }
            comments {
              __typename
              body
              timestamp
              isUser
            }
          }
        }
        """

    public let operationName: String = "GetCases"

    public let operationIdentifier: String? = "806aa4868503577739b738c3eb5615e892c1307a769deaf7c114b120bef720df"

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]

        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("cases", type: .list(.object(Case.selections))),
            ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(cases: [Case?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "cases": cases.flatMap { (value: [Case?]) -> [ResultMap?] in value.map { (value: Case?) -> ResultMap? in value.flatMap { (value: Case) -> ResultMap in value.resultMap } } }])
        }

        public var cases: [Case?]? {
            get {
                return (resultMap["cases"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Case?] in value.map { (value: ResultMap?) -> Case? in value.flatMap { (value: ResultMap) -> Case in Case(unsafeResultMap: value) } } }
            }
            set {
                resultMap.updateValue(newValue.flatMap { (value: [Case?]) -> [ResultMap?] in value.map { (value: Case?) -> ResultMap? in value.flatMap { (value: Case) -> ResultMap in value.resultMap } } }, forKey: "cases")
            }
        }

        public struct Case: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Case"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("title", type: .scalar(String.self)),
                    GraphQLField("id", type: .scalar(String.self)),
                    GraphQLField("desc", type: .scalar(String.self)),
                    GraphQLField("metadata", type: .object(Metadatum.selections)),
                    GraphQLField("comments", type: .list(.object(Comment.selections))),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(title: String? = nil, id: String? = nil, desc: String? = nil, metadata: Metadatum? = nil, comments: [Comment?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "Case", "title": title, "id": id, "desc": desc, "metadata": metadata.flatMap { (value: Metadatum) -> ResultMap in value.resultMap }, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var title: String? {
                get {
                    return resultMap["title"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "title")
                }
            }

            public var id: String? {
                get {
                    return resultMap["id"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "id")
                }
            }

            public var desc: String? {
                get {
                    return resultMap["desc"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "desc")
                }
            }

            public var metadata: Metadatum? {
                get {
                    return (resultMap["metadata"] as? ResultMap).flatMap { Metadatum(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "metadata")
                }
            }

            public var comments: [Comment?]? {
                get {
                    return (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
                }
                set {
                    resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
                }
            }

            public struct Metadatum: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["CaseMetadata"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("user_has_unread_message", type: .scalar(Bool.self)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(userHasUnreadMessage: Bool? = nil) {
                    self.init(unsafeResultMap: ["__typename": "CaseMetadata", "user_has_unread_message": userHasUnreadMessage])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var userHasUnreadMessage: Bool? {
                    get {
                        return resultMap["user_has_unread_message"] as? Bool
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "user_has_unread_message")
                    }
                }
            }

            public struct Comment: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["CaseComment"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("body", type: .scalar(String.self)),
                        GraphQLField("timestamp", type: .scalar(String.self)),
                        GraphQLField("isUser", type: .scalar(Bool.self)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(body: String? = nil, timestamp: String? = nil, isUser: Bool? = nil) {
                    self.init(unsafeResultMap: ["__typename": "CaseComment", "body": body, "timestamp": timestamp, "isUser": isUser])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var body: String? {
                    get {
                        return resultMap["body"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "body")
                    }
                }

                public var timestamp: String? {
                    get {
                        return resultMap["timestamp"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "timestamp")
                    }
                }

                public var isUser: Bool? {
                    get {
                        return resultMap["isUser"] as? Bool
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "isUser")
                    }
                }
            }
        }
    }
}

public final class GetClaimsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
        """
        query GetClaims {
          claims {
            __typename
            id
            status
            personId
            customerId
            clientId
            branchCode
            eventDate
            admin
            policyId
            settlementDate
            settlementCost
            elements
          }
        }
        """

    public let operationName: String = "GetClaims"

    public let operationIdentifier: String? = "491f5a6ce6588a2aababd5d67f3c585566cf4049d372e035e75bc6acc46a92ff"

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]

        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("claims", type: .list(.object(Claim.selections))),
            ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(claims: [Claim?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "claims": claims.flatMap { (value: [Claim?]) -> [ResultMap?] in value.map { (value: Claim?) -> ResultMap? in value.flatMap { (value: Claim) -> ResultMap in value.resultMap } } }])
        }

        public var claims: [Claim?]? {
            get {
                return (resultMap["claims"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Claim?] in value.map { (value: ResultMap?) -> Claim? in value.flatMap { (value: ResultMap) -> Claim in Claim(unsafeResultMap: value) } } }
            }
            set {
                resultMap.updateValue(newValue.flatMap { (value: [Claim?]) -> [ResultMap?] in value.map { (value: Claim?) -> ResultMap? in value.flatMap { (value: Claim) -> ResultMap in value.resultMap } } }, forKey: "claims")
            }
        }

        public struct Claim: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Claim"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .scalar(String.self)),
                    GraphQLField("status", type: .scalar(String.self)),
                    GraphQLField("personId", type: .scalar(String.self)),
                    GraphQLField("customerId", type: .scalar(String.self)),
                    GraphQLField("clientId", type: .scalar(String.self)),
                    GraphQLField("branchCode", type: .scalar(String.self)),
                    GraphQLField("eventDate", type: .scalar(String.self)),
                    GraphQLField("admin", type: .scalar(String.self)),
                    GraphQLField("policyId", type: .scalar(String.self)),
                    GraphQLField("settlementDate", type: .scalar(String.self)),
                    GraphQLField("settlementCost", type: .scalar(String.self)),
                    GraphQLField("elements", type: .list(.scalar(String.self))),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(id: String? = nil, status: String? = nil, personId: String? = nil, customerId: String? = nil, clientId: String? = nil, branchCode: String? = nil, eventDate: String? = nil, admin: String? = nil, policyId: String? = nil, settlementDate: String? = nil, settlementCost: String? = nil, elements: [String?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "Claim", "id": id, "status": status, "personId": personId, "customerId": customerId, "clientId": clientId, "branchCode": branchCode, "eventDate": eventDate, "admin": admin, "policyId": policyId, "settlementDate": settlementDate, "settlementCost": settlementCost, "elements": elements])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var id: String? {
                get {
                    return resultMap["id"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "id")
                }
            }

            public var status: String? {
                get {
                    return resultMap["status"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "status")
                }
            }

            public var personId: String? {
                get {
                    return resultMap["personId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "personId")
                }
            }

            public var customerId: String? {
                get {
                    return resultMap["customerId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "customerId")
                }
            }

            public var clientId: String? {
                get {
                    return resultMap["clientId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "clientId")
                }
            }

            public var branchCode: String? {
                get {
                    return resultMap["branchCode"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "branchCode")
                }
            }

            public var eventDate: String? {
                get {
                    return resultMap["eventDate"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "eventDate")
                }
            }

            public var admin: String? {
                get {
                    return resultMap["admin"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "admin")
                }
            }

            public var policyId: String? {
                get {
                    return resultMap["policyId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "policyId")
                }
            }

            public var settlementDate: String? {
                get {
                    return resultMap["settlementDate"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "settlementDate")
                }
            }

            public var settlementCost: String? {
                get {
                    return resultMap["settlementCost"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "settlementCost")
                }
            }

            public var elements: [String?]? {
                get {
                    return resultMap["elements"] as? [String?]
                }
                set {
                    resultMap.updateValue(newValue, forKey: "elements")
                }
            }
        }
    }
}

public final class GetPoliciesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
        """
        query GetPolicies {
          policies {
            __typename
            policyId
            groupPolicyId
            product
            annullmentDate
            validToDate
            endedReasonText
            items {
              __typename
              itemType
              elements {
                __typename
                elementText
              }
            }
          }
        }
        """

    public let operationName: String = "GetPolicies"

    public let operationIdentifier: String? = "8254f8d02c78382d05ed9d0635d0778c3b414b9e84c09a7f6a4a02e10ce6fac3"

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]

        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("policies", type: .list(.object(Policy.selections))),
            ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(policies: [Policy?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "policies": policies.flatMap { (value: [Policy?]) -> [ResultMap?] in value.map { (value: Policy?) -> ResultMap? in value.flatMap { (value: Policy) -> ResultMap in value.resultMap } } }])
        }

        public var policies: [Policy?]? {
            get {
                return (resultMap["policies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Policy?] in value.map { (value: ResultMap?) -> Policy? in value.flatMap { (value: ResultMap) -> Policy in Policy(unsafeResultMap: value) } } }
            }
            set {
                resultMap.updateValue(newValue.flatMap { (value: [Policy?]) -> [ResultMap?] in value.map { (value: Policy?) -> ResultMap? in value.flatMap { (value: Policy) -> ResultMap in value.resultMap } } }, forKey: "policies")
            }
        }

        public struct Policy: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Policy"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("policyId", type: .scalar(String.self)),
                    GraphQLField("groupPolicyId", type: .scalar(String.self)),
                    GraphQLField("product", type: .scalar(String.self)),
                    GraphQLField("annullmentDate", type: .scalar(String.self)),
                    GraphQLField("validToDate", type: .scalar(String.self)),
                    GraphQLField("endedReasonText", type: .scalar(String.self)),
                    GraphQLField("items", type: .object(Item.selections)),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(policyId: String? = nil, groupPolicyId: String? = nil, product: String? = nil, annullmentDate: String? = nil, validToDate: String? = nil, endedReasonText: String? = nil, items: Item? = nil) {
                self.init(unsafeResultMap: ["__typename": "Policy", "policyId": policyId, "groupPolicyId": groupPolicyId, "product": product, "annullmentDate": annullmentDate, "validToDate": validToDate, "endedReasonText": endedReasonText, "items": items.flatMap { (value: Item) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var policyId: String? {
                get {
                    return resultMap["policyId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "policyId")
                }
            }

            public var groupPolicyId: String? {
                get {
                    return resultMap["groupPolicyId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "groupPolicyId")
                }
            }

            public var product: String? {
                get {
                    return resultMap["product"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "product")
                }
            }

            public var annullmentDate: String? {
                get {
                    return resultMap["annullmentDate"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "annullmentDate")
                }
            }

            public var validToDate: String? {
                get {
                    return resultMap["validToDate"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "validToDate")
                }
            }

            public var endedReasonText: String? {
                get {
                    return resultMap["endedReasonText"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "endedReasonText")
                }
            }

            public var items: Item? {
                get {
                    return (resultMap["items"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "items")
                }
            }

            public struct Item: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["PolicyItem"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("itemType", type: .scalar(String.self)),
                        GraphQLField("elements", type: .list(.object(Element.selections))),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(itemType: String? = nil, elements: [Element?]? = nil) {
                    self.init(unsafeResultMap: ["__typename": "PolicyItem", "itemType": itemType, "elements": elements.flatMap { (value: [Element?]) -> [ResultMap?] in value.map { (value: Element?) -> ResultMap? in value.flatMap { (value: Element) -> ResultMap in value.resultMap } } }])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var itemType: String? {
                    get {
                        return resultMap["itemType"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "itemType")
                    }
                }

                public var elements: [Element?]? {
                    get {
                        return (resultMap["elements"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Element?] in value.map { (value: ResultMap?) -> Element? in value.flatMap { (value: ResultMap) -> Element in Element(unsafeResultMap: value) } } }
                    }
                    set {
                        resultMap.updateValue(newValue.flatMap { (value: [Element?]) -> [ResultMap?] in value.map { (value: Element?) -> ResultMap? in value.flatMap { (value: Element) -> ResultMap in value.resultMap } } }, forKey: "elements")
                    }
                }

                public struct Element: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["PolicyItemElement"]

                    public static var selections: [GraphQLSelection] {
                        return [
                            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                            GraphQLField("elementText", type: .scalar(String.self)),
                        ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                        resultMap = unsafeResultMap
                    }

                    public init(elementText: String? = nil) {
                        self.init(unsafeResultMap: ["__typename": "PolicyItemElement", "elementText": elementText])
                    }

                    public var __typename: String {
                        get {
                            return resultMap["__typename"]! as! String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "__typename")
                        }
                    }

                    public var elementText: String? {
                        get {
                            return resultMap["elementText"] as? String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "elementText")
                        }
                    }
                }
            }
        }
    }
}

public final class GetUserAndPoliciesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
        """
        query GetUserAndPolicies {
          user {
            __typename
            email
            address {
              __typename
              postalcode
              street
              subregion
            }
            telephone
            customernumber
            person {
              __typename
              firstname
              surname
              birthdate
            }
          }
          policies {
            __typename
            policyId
            groupPolicyId
            product
            annullmentDate
            validToDate
            endedReasonText
            items {
              __typename
              itemType
              elements {
                __typename
                elementText
              }
            }
          }
        }
        """

    public let operationName: String = "GetUserAndPolicies"

    public let operationIdentifier: String? = "7c1ff769269bd0b5df8d86a6c842287ac8fa9f2645499b16285a26cbacbf2aed"

    public init() {}

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]

        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("user", type: .object(User.selections)),
                GraphQLField("policies", type: .list(.object(Policy.selections))),
            ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(user: User? = nil, policies: [Policy?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "policies": policies.flatMap { (value: [Policy?]) -> [ResultMap?] in value.map { (value: Policy?) -> ResultMap? in value.flatMap { (value: Policy) -> ResultMap in value.resultMap } } }])
        }

        public var user: User? {
            get {
                return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
        }

        public var policies: [Policy?]? {
            get {
                return (resultMap["policies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Policy?] in value.map { (value: ResultMap?) -> Policy? in value.flatMap { (value: ResultMap) -> Policy in Policy(unsafeResultMap: value) } } }
            }
            set {
                resultMap.updateValue(newValue.flatMap { (value: [Policy?]) -> [ResultMap?] in value.map { (value: Policy?) -> ResultMap? in value.flatMap { (value: Policy) -> ResultMap in value.resultMap } } }, forKey: "policies")
            }
        }

        public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("email", type: .scalar(String.self)),
                    GraphQLField("address", type: .object(Address.selections)),
                    GraphQLField("telephone", type: .scalar(String.self)),
                    GraphQLField("customernumber", type: .scalar(String.self)),
                    GraphQLField("person", type: .object(Person.selections)),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(email: String? = nil, address: Address? = nil, telephone: String? = nil, customernumber: String? = nil, person: Person? = nil) {
                self.init(unsafeResultMap: ["__typename": "User", "email": email, "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }, "telephone": telephone, "customernumber": customernumber, "person": person.flatMap { (value: Person) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var email: String? {
                get {
                    return resultMap["email"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "email")
                }
            }

            public var address: Address? {
                get {
                    return (resultMap["address"] as? ResultMap).flatMap { Address(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "address")
                }
            }

            public var telephone: String? {
                get {
                    return resultMap["telephone"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "telephone")
                }
            }

            public var customernumber: String? {
                get {
                    return resultMap["customernumber"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "customernumber")
                }
            }

            public var person: Person? {
                get {
                    return (resultMap["person"] as? ResultMap).flatMap { Person(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "person")
                }
            }

            public struct Address: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Address"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("postalcode", type: .scalar(String.self)),
                        GraphQLField("street", type: .scalar(String.self)),
                        GraphQLField("subregion", type: .scalar(String.self)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(postalcode: String? = nil, street: String? = nil, subregion: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Address", "postalcode": postalcode, "street": street, "subregion": subregion])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var postalcode: String? {
                    get {
                        return resultMap["postalcode"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "postalcode")
                    }
                }

                public var street: String? {
                    get {
                        return resultMap["street"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "street")
                    }
                }

                public var subregion: String? {
                    get {
                        return resultMap["subregion"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "subregion")
                    }
                }
            }

            public struct Person: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Person"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("firstname", type: .scalar(String.self)),
                        GraphQLField("surname", type: .scalar(String.self)),
                        GraphQLField("birthdate", type: .scalar(String.self)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(firstname: String? = nil, surname: String? = nil, birthdate: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Person", "firstname": firstname, "surname": surname, "birthdate": birthdate])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var firstname: String? {
                    get {
                        return resultMap["firstname"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "firstname")
                    }
                }

                public var surname: String? {
                    get {
                        return resultMap["surname"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "surname")
                    }
                }

                public var birthdate: String? {
                    get {
                        return resultMap["birthdate"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "birthdate")
                    }
                }
            }
        }

        public struct Policy: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Policy"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("policyId", type: .scalar(String.self)),
                    GraphQLField("groupPolicyId", type: .scalar(String.self)),
                    GraphQLField("product", type: .scalar(String.self)),
                    GraphQLField("annullmentDate", type: .scalar(String.self)),
                    GraphQLField("validToDate", type: .scalar(String.self)),
                    GraphQLField("endedReasonText", type: .scalar(String.self)),
                    GraphQLField("items", type: .object(Item.selections)),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(policyId: String? = nil, groupPolicyId: String? = nil, product: String? = nil, annullmentDate: String? = nil, validToDate: String? = nil, endedReasonText: String? = nil, items: Item? = nil) {
                self.init(unsafeResultMap: ["__typename": "Policy", "policyId": policyId, "groupPolicyId": groupPolicyId, "product": product, "annullmentDate": annullmentDate, "validToDate": validToDate, "endedReasonText": endedReasonText, "items": items.flatMap { (value: Item) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var policyId: String? {
                get {
                    return resultMap["policyId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "policyId")
                }
            }

            public var groupPolicyId: String? {
                get {
                    return resultMap["groupPolicyId"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "groupPolicyId")
                }
            }

            public var product: String? {
                get {
                    return resultMap["product"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "product")
                }
            }

            public var annullmentDate: String? {
                get {
                    return resultMap["annullmentDate"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "annullmentDate")
                }
            }

            public var validToDate: String? {
                get {
                    return resultMap["validToDate"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "validToDate")
                }
            }

            public var endedReasonText: String? {
                get {
                    return resultMap["endedReasonText"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "endedReasonText")
                }
            }

            public var items: Item? {
                get {
                    return (resultMap["items"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "items")
                }
            }

            public struct Item: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["PolicyItem"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("itemType", type: .scalar(String.self)),
                        GraphQLField("elements", type: .list(.object(Element.selections))),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(itemType: String? = nil, elements: [Element?]? = nil) {
                    self.init(unsafeResultMap: ["__typename": "PolicyItem", "itemType": itemType, "elements": elements.flatMap { (value: [Element?]) -> [ResultMap?] in value.map { (value: Element?) -> ResultMap? in value.flatMap { (value: Element) -> ResultMap in value.resultMap } } }])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var itemType: String? {
                    get {
                        return resultMap["itemType"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "itemType")
                    }
                }

                public var elements: [Element?]? {
                    get {
                        return (resultMap["elements"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Element?] in value.map { (value: ResultMap?) -> Element? in value.flatMap { (value: ResultMap) -> Element in Element(unsafeResultMap: value) } } }
                    }
                    set {
                        resultMap.updateValue(newValue.flatMap { (value: [Element?]) -> [ResultMap?] in value.map { (value: Element?) -> ResultMap? in value.flatMap { (value: Element) -> ResultMap in value.resultMap } } }, forKey: "elements")
                    }
                }

                public struct Element: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["PolicyItemElement"]

                    public static var selections: [GraphQLSelection] {
                        return [
                            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                            GraphQLField("elementText", type: .scalar(String.self)),
                        ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                        resultMap = unsafeResultMap
                    }

                    public init(elementText: String? = nil) {
                        self.init(unsafeResultMap: ["__typename": "PolicyItemElement", "elementText": elementText])
                    }

                    public var __typename: String {
                        get {
                            return resultMap["__typename"]! as! String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "__typename")
                        }
                    }

                    public var elementText: String? {
                        get {
                            return resultMap["elementText"] as? String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "elementText")
                        }
                    }
                }
            }
        }
    }
}

public final class CreateCaseMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
        """
        mutation CreateCase($title: String!, $desc: String!) {
          createCase(type: CLAIM, category: CLAIM, title: $title, desc: $desc) {
            __typename
            id
            title
            desc
          }
        }
        """

    public let operationName: String = "CreateCase"

    public let operationIdentifier: String? = "6d026b179f87bb00e2ce0ba3c9f84dc955924e98513aebbc77aa9dfcb458734b"

    public var title: String
    public var desc: String

    public init(title: String, desc: String) {
        self.title = title
        self.desc = desc
    }

    public var variables: GraphQLMap? {
        return ["title": title, "desc": desc]
    }

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]

        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("createCase", arguments: ["type": "CLAIM", "category": "CLAIM", "title": GraphQLVariable("title"), "desc": GraphQLVariable("desc")], type: .object(CreateCase.selections)),
            ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(createCase: CreateCase? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mutation", "createCase": createCase.flatMap { (value: CreateCase) -> ResultMap in value.resultMap }])
        }

        public var createCase: CreateCase? {
            get {
                return (resultMap["createCase"] as? ResultMap).flatMap { CreateCase(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "createCase")
            }
        }

        public struct CreateCase: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Case"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .scalar(String.self)),
                    GraphQLField("title", type: .scalar(String.self)),
                    GraphQLField("desc", type: .scalar(String.self)),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(id: String? = nil, title: String? = nil, desc: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Case", "id": id, "title": title, "desc": desc])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var id: String? {
                get {
                    return resultMap["id"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "id")
                }
            }

            public var title: String? {
                get {
                    return resultMap["title"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "title")
                }
            }

            public var desc: String? {
                get {
                    return resultMap["desc"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "desc")
                }
            }
        }
    }
}
