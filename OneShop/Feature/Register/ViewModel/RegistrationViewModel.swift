//
//  RegistrationViewModel.swift
//  OneShop
//
//  Created by Mobin Akhter on 11/8/21.
// In the RegistrationViewModel we are going to have enums that allow us to handle events or the state of whether an event was successful or not

import Foundation
import Combine

enum RegistrationState{
    case successful
    case failed(error: Error)
    case na // not available
}

protocol RegistrationViewModel {
    func register()
    var hasError: Bool {get}
    var service: RegistrationService {get}
    var state: RegistrationState {get}
    var userDetails: RegistrationDetails {get}
    init(service: RegistrationService) // inject the service to the view model
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    @Published var hasError: Bool = false
    @Published var state: RegistrationState = .na // Current state not available
    
    let service: RegistrationService
    
    var userDetails: RegistrationDetails = RegistrationDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscriptions()
    }
    // register function is a publisher.
    func register() {
        service
            .register(with: userDetails)
            .sink { [weak self] res in // sink lets us get the values from the publisher
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions) // Store the result in a Set of AnyCancellable
    }
}

private extension RegistrationViewModelImpl {
    func setupErrorSubscriptions() {
        
        $state
            .map { state -> Bool in
                switch state {
                case .successful,
                     .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
