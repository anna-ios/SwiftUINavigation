//
// CatFactsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class CatFactsAPI {
    /**
     Returns a list of cat facts
     
     - parameter animalType: (query)  (optional)
     - parameter amount: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getCatFacts(animalType: String? = nil, amount: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [CatFact]?,_ error: Error?) -> Void)) {
        getCatFactsWithRequestBuilder(animalType: animalType, amount: amount).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Returns a list of cat facts
     - GET /facts/random
     - parameter animalType: (query)  (optional)
     - parameter amount: (query)  (optional)
     - returns: RequestBuilder<[CatFact]> 
     */
    open class func getCatFactsWithRequestBuilder(animalType: String? = nil, amount: Int? = nil) -> RequestBuilder<[CatFact]> {
        let path = "/facts/random"
        let URLString = "https://cat-fact.herokuapp.com" + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "animal_type": animalType?.encodeToJSON(), 
            "amount": amount?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<[CatFact]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
