// MARK: - Mocks generated from file: Countries Info/Factories/ImageFactory.swift at 2020-12-24 15:37:01 +0000

//
//  ImageFactory.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 17.12.2020.
//

import Cuckoo
@testable import Countries_Info

import Foundation


 class MockImageFactoryProtocol: ImageFactoryProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = ImageFactoryProtocol
    
     typealias Stubbing = __StubbingProxy_ImageFactoryProtocol
     typealias Verification = __VerificationProxy_ImageFactoryProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ImageFactoryProtocol?

     func enableDefaultImplementation(_ stub: ImageFactoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func imageGenerator(code: String?, completion: @escaping (Data?) -> Void)  {
        
    return cuckoo_manager.call("imageGenerator(code: String?, completion: @escaping (Data?) -> Void)",
            parameters: (code, completion),
            escapingParameters: (code, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.imageGenerator(code: code, completion: completion))
        
    }
    

	 struct __StubbingProxy_ImageFactoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func imageGenerator<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(code: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String?, (Data?) -> Void)> where M1.OptionalMatchedType == String, M2.MatchedType == (Data?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, (Data?) -> Void)>] = [wrap(matchable: code) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockImageFactoryProtocol.self, method: "imageGenerator(code: String?, completion: @escaping (Data?) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ImageFactoryProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func imageGenerator<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(code: M1, completion: M2) -> Cuckoo.__DoNotUse<(String?, (Data?) -> Void), Void> where M1.OptionalMatchedType == String, M2.MatchedType == (Data?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, (Data?) -> Void)>] = [wrap(matchable: code) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("imageGenerator(code: String?, completion: @escaping (Data?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ImageFactoryProtocolStub: ImageFactoryProtocol {
    

    

    
     func imageGenerator(code: String?, completion: @escaping (Data?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockImageFactory: ImageFactory, Cuckoo.ClassMock {
    
     typealias MocksType = ImageFactory
    
     typealias Stubbing = __StubbingProxy_ImageFactory
     typealias Verification = __VerificationProxy_ImageFactory

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ImageFactory?

     func enableDefaultImplementation(_ stub: ImageFactory) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func imageGenerator(code: String?, completion: @escaping (Data?) -> Void)  {
        
    return cuckoo_manager.call("imageGenerator(code: String?, completion: @escaping (Data?) -> Void)",
            parameters: (code, completion),
            escapingParameters: (code, completion),
            superclassCall:
                
                super.imageGenerator(code: code, completion: completion)
                ,
            defaultCall: __defaultImplStub!.imageGenerator(code: code, completion: completion))
        
    }
    

	 struct __StubbingProxy_ImageFactory: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func imageGenerator<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(code: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(String?, (Data?) -> Void)> where M1.OptionalMatchedType == String, M2.MatchedType == (Data?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, (Data?) -> Void)>] = [wrap(matchable: code) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockImageFactory.self, method: "imageGenerator(code: String?, completion: @escaping (Data?) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ImageFactory: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func imageGenerator<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(code: M1, completion: M2) -> Cuckoo.__DoNotUse<(String?, (Data?) -> Void), Void> where M1.OptionalMatchedType == String, M2.MatchedType == (Data?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, (Data?) -> Void)>] = [wrap(matchable: code) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("imageGenerator(code: String?, completion: @escaping (Data?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ImageFactoryStub: ImageFactory {
    

    

    
     override func imageGenerator(code: String?, completion: @escaping (Data?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Countries Info/Managers/ApolloManager.swift at 2020-12-24 15:37:01 +0000

//
//  ApolloManager.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 26.11.2020.
//

import Cuckoo
@testable import Countries_Info

import Apollo
import Foundation


 class MockApolloManager: ApolloManager, Cuckoo.ClassMock {
    
     typealias MocksType = ApolloManager
    
     typealias Stubbing = __StubbingProxy_ApolloManager
     typealias Verification = __VerificationProxy_ApolloManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ApolloManager?

     func enableDefaultImplementation(_ stub: ApolloManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var apollo: ApolloClient {
        get {
            return cuckoo_manager.getter("apollo",
                superclassCall:
                    
                    super.apollo
                    ,
                defaultCall: __defaultImplStub!.apollo)
        }
        
    }
    

    

    
    
    
     override func fetch<Query: GraphQLQuery, T: Codable>(query: Query, type: T.Type, completion: @escaping (T) -> Void)  {
        
    return cuckoo_manager.call("fetch(query: Query, type: T.Type, completion: @escaping (T) -> Void)",
            parameters: (query, type, completion),
            escapingParameters: (query, type, completion),
            superclassCall:
                
                super.fetch(query: query, type: type, completion: completion)
                ,
            defaultCall: __defaultImplStub!.fetch(query: query, type: type, completion: completion))
        
    }
    

	 struct __StubbingProxy_ApolloManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var apollo: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockApolloManager, ApolloClient> {
	        return .init(manager: cuckoo_manager, name: "apollo")
	    }
	    
	    
	    func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, Query: GraphQLQuery, T: Codable>(query: M1, type: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(Query, T.Type, (T) -> Void)> where M1.MatchedType == Query, M2.MatchedType == T.Type, M3.MatchedType == (T) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Query, T.Type, (T) -> Void)>] = [wrap(matchable: query) { $0.0 }, wrap(matchable: type) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockApolloManager.self, method: "fetch(query: Query, type: T.Type, completion: @escaping (T) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ApolloManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var apollo: Cuckoo.VerifyReadOnlyProperty<ApolloClient> {
	        return .init(manager: cuckoo_manager, name: "apollo", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, Query: GraphQLQuery, T: Codable>(query: M1, type: M2, completion: M3) -> Cuckoo.__DoNotUse<(Query, T.Type, (T) -> Void), Void> where M1.MatchedType == Query, M2.MatchedType == T.Type, M3.MatchedType == (T) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Query, T.Type, (T) -> Void)>] = [wrap(matchable: query) { $0.0 }, wrap(matchable: type) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return cuckoo_manager.verify("fetch(query: Query, type: T.Type, completion: @escaping (T) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ApolloManagerStub: ApolloManager {
    
    
     override var apollo: ApolloClient {
        get {
            return DefaultValueRegistry.defaultValue(for: (ApolloClient).self)
        }
        
    }
    

    

    
     override func fetch<Query: GraphQLQuery, T: Codable>(query: Query, type: T.Type, completion: @escaping (T) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

