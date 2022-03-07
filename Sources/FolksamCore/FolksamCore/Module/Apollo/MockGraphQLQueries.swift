//
//  MockGraphQLQueries.swift
//  FolksamCore
//
//  Created by Johan Torell on 2022-01-13.
//

import Foundation

enum MockGraphQLQueries {
    typealias JSONObject = [String: Any]
    
    case getUserAndPolicies
    case getUser
    case getClaims
    case getPolicies
    case getCases
    
    var responseString: String {
        switch self {
        case .getUserAndPolicies:
            return MockGraphQLQueries.getUserAndPoliciesResponseString
        case .getUser:
            return MockGraphQLQueries.getUserResponseString
        case .getClaims:
            return MockGraphQLQueries.getClaimsResponseString
        case .getPolicies:
            return MockGraphQLQueries.getPoliciesResponseString
        case .getCases:
            return MockGraphQLQueries.getCasesResponseString
        }
    }
    
    var responseObject: JSONObject {
        
        guard
            let data = responseString.data(using: .utf8),
            let object = try? JSONSerialization.jsonObject(with: data,
                                                           options: []) as? JSONObject
        else {
            return [:]
        }
        
        return object
    }
    
    private static let getUserResponseString =
    """
     {
       "data": {
         "user": {
           "__typename": "User",
           "email": "KIS2-TEST@FOLKSAM.SE",
           "address": {
             "__typename": "Address",
             "postalcode": "12055",
             "street": "SYRéNV 30 L1101       TEST",
             "subregion": "ÅRSTA"
           },
           "telephone": "0708114182",
           "customernumber": "PBB012195",
           "person": {
             "__typename": "Person",
             "firstname": "KURT",
             "surname": "WRETMAN",
             "birthdate": null
           }
         }
        }
    }
    """
    
    private static let getCasesResponseString =
    """
    {
        "data": {
            "cases": null
        }
    }
    """
    
    private static let getClaimsResponseString =
    """
    {
      "data": {
        "claims": [
          {
            "__typename": "Claim",
            "id": "FF025696477S",
            "status": "",
            "personId": "19640911-7196",
            "customerId": "ZDB-55593-8",
            "clientId": "CLTC72L49ZWMVOOOKONV",
            "branchCode": "Y75",
            "eventDate": "2017-01-12",
            "admin": "fdhe08",
            "policyId": "CV-1038665-293",
            "settlementDate": "9999-12-31",
            "settlementCost": "0",
            "elements": [
              "Hem Mellan"
            ]
          },
          {
            "__typename": "Claim",
            "id": "FF031548043S",
            "status": "",
            "personId": "19640911-7196",
            "customerId": "ZDB-55593-8",
            "clientId": "CLTC72L49ZWMVOOOKONV",
            "branchCode": "Y75",
            "eventDate": "2017-10-01",
            "admin": "System",
            "policyId": "CV-1038665-293",
            "settlementDate": "9999-12-31",
            "settlementCost": "0",
            "elements": [
              "Hem Mellan"
            ]
          },
          {
            "__typename": "Claim",
            "id": "FF038912218S",
            "status": "",
            "personId": "19640911-7196",
            "customerId": "ZDB-55593-8",
            "clientId": "CLTC72L49ZWMVOOOKONV",
            "branchCode": "Y75",
            "eventDate": "2020-05-28",
            "admin": "FJSA27",
            "policyId": "CV-2024614-840",
            "settlementDate": "9999-12-31",
            "settlementCost": "0",
            "elements": [
              "Övrigt"
            ]
          },
          {
            "__typename": "Claim",
            "id": "FF038915906S",
            "status": "",
            "personId": "19640911-7196",
            "customerId": "ZDB-55593-8",
            "clientId": "CLTC72L49ZWMVOOOKONV",
            "branchCode": "Y75",
            "eventDate": "2020-07-13",
            "admin": "FJSA27",
            "policyId": "CV-1038665-293",
            "settlementDate": "9999-12-31",
            "settlementCost": "0",
            "elements": [
              "Hem Mellan"
            ]
          },
          {
            "__typename": "Claim",
            "id": "FF038930780S",
            "status": "",
            "personId": "19640911-7196",
            "customerId": "ZDB-55593-8",
            "clientId": "CLTC72L49ZWMVOOOKONV",
            "branchCode": "Y75",
            "eventDate": "2021-01-26",
            "admin": "fiva02",
            "policyId": "CV-1038665-293",
            "settlementDate": "9999-12-31",
            "settlementCost": "0",
            "elements": [
              "Hem Mellan"
            ]
          },
          {
            "__typename": "Claim",
            "id": "FF038930798S",
            "status": "",
            "personId": "19640911-7196",
            "customerId": "ZDB-55593-8",
            "clientId": "CLTC72L49ZWMVOOOKONV",
            "branchCode": "Y75",
            "eventDate": "2021-01-26",
            "admin": "frle07",
            "policyId": "CV-1038665-293",
            "settlementDate": "9999-12-31",
            "settlementCost": "0",
            "elements": [
              "Hem Mellan",
              "Hem2"
            ]
          }
        ]
      }
    }
    """
    
    private static let getPoliciesResponseString =
    """
    {
      "data": {
        "policies": [
          {
            "__typename": "Policy",
            "policyId": "5609168249HF00",
            "groupPolicyId": "",
            "product": "Aktuell försäkring i Oliv",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": null
            }
          },
          {
            "__typename": "Policy",
            "policyId": "IN-5067077-114",
            "groupPolicyId": "165129799721",
            "product": "Bonusväxling",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Ålderspension Trad"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Återbetalningsskydd Trad"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Aktivt"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "CV-4042872-152",
            "groupPolicyId": "",
            "product": "Bostadsrätt kopplad till K-hem",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Hemförsäkring Stor"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Resklar"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Borätt Stor"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "MF-1050324-779",
            "groupPolicyId": "",
            "product": "XAP417 Bilförs Volkswagen",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Folksams Försäkring för VW"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Helförsäkring"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "CV-5023146-730",
            "groupPolicyId": "",
            "product": "Kollektiv Hemförsäkring",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Hemförsäkring Stor"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Resklar"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "CV-5086915-880",
            "groupPolicyId": "",
            "product": "Bostadsrättsförsäkring",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Borätt Stor"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "KF-0233931-005",
            "groupPolicyId": "13982-00001",
            "product": "",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Gruppliv medlem"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "KF-0279441-109",
            "groupPolicyId": "14158-00000",
            "product": "",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Olycksfall medlem"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LU-2026879-268",
            "groupPolicyId": "",
            "product": "FRTDR65TEMP10",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Fondförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori P"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LU-3026873-228",
            "groupPolicyId": "",
            "product": "FD(20)",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Fondförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori K"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "TU-3033477-658",
            "groupPolicyId": "",
            "product": "FTRS65H5",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Avtalspension Fond"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Ej aktivt"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori P"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Tjänstepension"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LI-1030726-234",
            "groupPolicyId": "",
            "product": "TR65TEMP5E",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Slutbetald"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Livförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori P"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LI-2030712-968",
            "groupPolicyId": "",
            "product": "DS(20)LE",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "LE-avtal med avisering"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Livförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori K"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          }
        ]
      }
    }
    """
    
    private static let getUserAndPoliciesResponseString =
    """
    {
      "data": {
        "user": {
          "__typename": "User",
          "email": "KIS2-TEST@FOLKSAM.SE",
          "address": {
            "__typename": "Address",
            "postalcode": "12055",
            "street": "SYRéNV 30 L1101       TEST",
            "subregion": "ÅRSTA"
          },
          "telephone": "0708114182",
          "customernumber": "PBB012195",
          "person": {
            "__typename": "Person",
            "firstname": "KURT",
            "surname": "WRETMAN",
            "birthdate": null
          }
        },
        "policies": [
          {
            "__typename": "Policy",
            "policyId": "5609168249HF00",
            "groupPolicyId": "",
            "product": "Aktuell försäkring i Oliv",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": null
            }
          },
          {
            "__typename": "Policy",
            "policyId": "IN-5067077-114",
            "groupPolicyId": "165129799721",
            "product": "Bonusväxling",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Ålderspension Trad"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Återbetalningsskydd Trad"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Aktivt"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "CV-4042872-152",
            "groupPolicyId": "",
            "product": "Bostadsrätt kopplad till K-hem",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Hemförsäkring Stor"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Resklar"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Borätt Stor"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "MF-1050324-779",
            "groupPolicyId": "",
            "product": "XAP417 Bilförs Volkswagen",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Folksams Försäkring för VW"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Helförsäkring"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "CV-5023146-730",
            "groupPolicyId": "",
            "product": "Kollektiv Hemförsäkring",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Hemförsäkring Stor"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Resklar"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "CV-5086915-880",
            "groupPolicyId": "",
            "product": "Bostadsrättsförsäkring",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Borätt Stor"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "KF-0233931-005",
            "groupPolicyId": "13982-00001",
            "product": "",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Gruppliv medlem"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "KF-0279441-109",
            "groupPolicyId": "14158-00000",
            "product": "",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Olycksfall medlem"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LU-2026879-268",
            "groupPolicyId": "",
            "product": "FRTDR65TEMP10",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Fondförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori P"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LU-3026873-228",
            "groupPolicyId": "",
            "product": "FD(20)",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Fondförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori K"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "TU-3033477-658",
            "groupPolicyId": "",
            "product": "FTRS65H5",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Avtalspension Fond"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Ej aktivt"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori P"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Tjänstepension"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LI-1030726-234",
            "groupPolicyId": "",
            "product": "TR65TEMP5E",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Slutbetald"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Livförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori P"
                }
              ]
            }
          },
          {
            "__typename": "Policy",
            "policyId": "LI-2030712-968",
            "groupPolicyId": "",
            "product": "DS(20)LE",
            "annullmentDate": "9999-12-31",
            "validToDate": "9999-12-31",
            "endedReasonText": "",
            "items": {
              "__typename": "PolicyItem",
              "itemType": "Generic",
              "elements": [
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "LE-avtal med avisering"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Livförsäkring"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Skattekategori K"
                },
                {
                  "__typename": "PolicyItemElement",
                  "elementText": "Särskild FMT"
                }
              ]
            }
          }
        ]
      }
    }
    """
}
