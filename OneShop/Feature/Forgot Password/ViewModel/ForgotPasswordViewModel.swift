//
//  ForgotPasswordViewModel.swift
//  OneShop
//
//  Created by user198375 on 11/8/21.
//

import Foundation
import Combine


protocol ForgotPasswordViewModel {
    func sendPasswordReset()
    var service: ForgotPasswordService {get}
    var email: String {get}
//    var userDetails: RegistrationDetails {get}
    init(service: ForgotPasswordService)
}

final class ForgotPasswordViewModelImpl: ObservableObject, ForgotPasswordViewModel {
    
    
    @Published var email: String = ""
    let service: ForgotPasswordService
    
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    func sendPasswordReset() {
        service
            .sendPasswordReset(to: email)
            .sink { res in
                
                switch res {
                case .failure(let err):
                    print("Failed: \(err)")
                default: break
                }
            } receiveValue: {
                print("Sent Password Reset Request")
            }
            .store(in: &subscriptions)
    }
}


