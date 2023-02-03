//
//  MeasuresViewModel.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/31/23.
//

import Foundation
import Combine

enum MeasuresCreationState {
    case successfull
    case failed(error: Error)
    case na
}

protocol MeasuresCreationViewModel {
    func measuresCreation()
    var service: MeasuresService {get}
    var state: MeasuresCreationState { get }
    var measurementDetails: MeasuresDetails { get }
    init (service: MeasuresService)
    
}

final class MeasuresDataCreationViewModelImpl: ObservableObject, MeasuresCreationViewModel {
    
    
    let service: MeasuresService
    var state: MeasuresCreationState = .na
    @Published var measurementDetails: MeasuresDetails = MeasuresDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
        var isValid: Bool {
            !measurementDetails.manShirtsMeasurments.fistWidth.isEmpty &&
            !measurementDetails.manShirtsMeasurments.back.isEmpty
        }
    func clearAll() {
        self.measurementDetails = .new
        
    }
    
    init(service: MeasuresService) {
        self.service = service
        
    }
    func measuresCreation() {
        service
            .createMeasures(with: measurementDetails)
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)
        
    }
}
