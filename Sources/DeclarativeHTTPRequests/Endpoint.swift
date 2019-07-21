//
//  Endpoint.swift
//  DeclarativeHTTPRequests
//
//  Created by Andrew J Wagner on 7/20/19.
//

/// Core requirements for all endpoints
///
/// Do not implment this protocol directly. Instead, implement
/// EmptyEndpoint, InEndpoint, OutEndpoint, or InOutEndpoint
public protocol Endpoint {
    /// The service that provides this endpoint
    associatedtype Service: WebService

    /// The method to use when making a request to this endpoint
    static var method: Method {get}

    /// The path to be appended to the Service's base URL
    var path: String {get}
}

/// Requirements for endpoints with input
///
/// Do not implment this protocol directly. Instead, implement
/// EmptyEndpoint, InEndpoint, OutEndpoint, or InOutEndpoint
public protocol EndpointWithInput: Endpoint {
    associatedtype Input: Encodable
    static var inputFormat: InputFormat {get}
}

/// Requirements for endpoints with output
///
/// Do not implment this protocol directly. Instead, implement
/// EmptyEndpoint, InEndpoint, OutEndpoint, or InOutEndpoint
public protocol EndpointWithOutput: Endpoint {
    associatedtype Output: Decodable
}

/// Endpoint without input or output
public protocol EmptyEndpoint: Endpoint {}

/// Endpoint with only input
public protocol InEndpoint: EndpointWithInput {}

/// Endpoint with only output
public protocol OutEndpoint: EndpointWithOutput {}

/// Endpoint with both input and output
public protocol InOutEndpoint: EndpointWithInput, EndpointWithOutput {}

extension Endpoint {
    /// Default method to GET
    public static var method: Method { return .get }
}

extension EndpointWithInput {
    /// Default to JSON input
    public static var inputFormat: InputFormat { return .JSON }
}
