//
//  RegistrationService.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

// RegistrationKeys stores the keys that are going to be used with firebase
enum RegistrationKeys: String {
    case firstName
    case lastName
    case occupation
}

// Code reference: Firebase Auth docs

protocol RegistrationService{
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        Deferred {
            Future{ promise in
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password: details.password) { res, error in
                        if let err = error {
                            promise(.failure(err))
                        }
                        else {
                            if let uid = res?.user.uid { // get the user id from the user safely
                                
                                // let values is a dictionary with values that we can actually store in firebase
                                let values = [RegistrationKeys.firstName.rawValue: details.firstName,
                                              RegistrationKeys.lastName.rawValue: details.lastName,
                                RegistrationKeys.occupation.rawValue: details.occupation] as [String: Any]
                            
                                // Firebase database function to update our user with the above values
                                Database.database() // access
                                    .reference() // references database
                                    .child("users") // table name "users"
                                    .child(uid) // child node with use id
                                    .updateChildValues(values) { error, ref in
                                        
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(())) // void success method
                                        }
                                    }
                            
                            } else {
                                promise(.failure(NSError(domain: "Invalid User ID", code: 0, userInfo: nil)))
                            }
                        }
                        
                    }
            }
        }
        .receive(on: RunLoop.main) // receive publisher on the main thread. Explanantion for this is that any responses that are received from the firebase are back on the main thread, so we can update our UI accordingly to this.
        .eraseToAnyPublisher() // turn the publisher into a generic one.
    }
}
