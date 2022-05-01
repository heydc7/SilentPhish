//
// PhishNet.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class PhishNetInput : MLFeatureProvider {

    /// haveIp as double value
    var haveIp: Double

    /// haveAtSign as double value
    var haveAtSign: Double

    /// length as double value
    var length: Double

    /// depth as double value
    var depth: Double

    /// redirection as double value
    var redirection: Double

    /// httpDomain as double value
    var httpDomain: Double

    /// tinyUrl as double value
    var tinyUrl: Double

    /// prefixSuffix as double value
    var prefixSuffix: Double

    /// scheme as double value
    var scheme: Double

    /// port as double value
    var port: Double

    /// dots as double value
    var dots: Double

    /// query as double value
    var query: Double

    /// stats as double value
    var stats: Double

    var featureNames: Set<String> {
        get {
            return ["haveIp", "haveAtSign", "length", "depth", "redirection", "httpDomain", "tinyUrl", "prefixSuffix", "scheme", "port", "dots", "query", "stats"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "haveIp") {
            return MLFeatureValue(double: haveIp)
        }
        if (featureName == "haveAtSign") {
            return MLFeatureValue(double: haveAtSign)
        }
        if (featureName == "length") {
            return MLFeatureValue(double: length)
        }
        if (featureName == "depth") {
            return MLFeatureValue(double: depth)
        }
        if (featureName == "redirection") {
            return MLFeatureValue(double: redirection)
        }
        if (featureName == "httpDomain") {
            return MLFeatureValue(double: httpDomain)
        }
        if (featureName == "tinyUrl") {
            return MLFeatureValue(double: tinyUrl)
        }
        if (featureName == "prefixSuffix") {
            return MLFeatureValue(double: prefixSuffix)
        }
        if (featureName == "scheme") {
            return MLFeatureValue(double: scheme)
        }
        if (featureName == "port") {
            return MLFeatureValue(double: port)
        }
        if (featureName == "dots") {
            return MLFeatureValue(double: dots)
        }
        if (featureName == "query") {
            return MLFeatureValue(double: query)
        }
        if (featureName == "stats") {
            return MLFeatureValue(double: stats)
        }
        return nil
    }
    
    init(haveIp: Double, haveAtSign: Double, length: Double, depth: Double, redirection: Double, httpDomain: Double, tinyUrl: Double, prefixSuffix: Double, scheme: Double, port: Double, dots: Double, query: Double, stats: Double) {
        self.haveIp = haveIp
        self.haveAtSign = haveAtSign
        self.length = length
        self.depth = depth
        self.redirection = redirection
        self.httpDomain = httpDomain
        self.tinyUrl = tinyUrl
        self.prefixSuffix = prefixSuffix
        self.scheme = scheme
        self.port = port
        self.dots = dots
        self.query = query
        self.stats = stats
    }

}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class PhishNetOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// label as double value
    lazy var label: Double = {
        [unowned self] in return self.provider.featureValue(for: "label")!.doubleValue
    }()

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(label: Double) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["label" : MLFeatureValue(double: label)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class PhishNet {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "PhishNet", withExtension:"mlmodelc")!
    }

    /**
        Construct PhishNet instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of PhishNet.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `PhishNet.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct PhishNet instance by automatically loading the model from the app's bundle.
    */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct PhishNet instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct PhishNet instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<PhishNet, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct PhishNet instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> PhishNet {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct PhishNet instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<PhishNet, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(PhishNet(model: model)))
            }
        }
    }

    /**
        Construct PhishNet instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> PhishNet {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return PhishNet(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as PhishNetInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as PhishNetOutput
    */
    func prediction(input: PhishNetInput) throws -> PhishNetOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as PhishNetInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as PhishNetOutput
    */
    func prediction(input: PhishNetInput, options: MLPredictionOptions) throws -> PhishNetOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return PhishNetOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - haveIp as double value
            - haveAtSign as double value
            - length as double value
            - depth as double value
            - redirection as double value
            - httpDomain as double value
            - tinyUrl as double value
            - prefixSuffix as double value
            - scheme as double value
            - port as double value
            - dots as double value
            - query as double value
            - stats as double value

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as PhishNetOutput
    */
    func prediction(haveIp: Double, haveAtSign: Double, length: Double, depth: Double, redirection: Double, httpDomain: Double, tinyUrl: Double, prefixSuffix: Double, scheme: Double, port: Double, dots: Double, query: Double, stats: Double) throws -> PhishNetOutput {
        let input_ = PhishNetInput(haveIp: haveIp, haveAtSign: haveAtSign, length: length, depth: depth, redirection: redirection, httpDomain: httpDomain, tinyUrl: tinyUrl, prefixSuffix: prefixSuffix, scheme: scheme, port: port, dots: dots, query: query, stats: stats)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [PhishNetInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [PhishNetOutput]
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [PhishNetInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [PhishNetOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [PhishNetOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  PhishNetOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
