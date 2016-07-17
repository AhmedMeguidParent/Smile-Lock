//
//  PasswordUIValidation.swift
//
//  Created by rain on 4/21/16.
//  Copyright © 2016 Recruit Lifestyle Co., Ltd. All rights reserved.
//

public class PasswordUIValidation<T> {
    public typealias Failure    = Void -> Void
    public typealias Success    = T -> Void
    public typealias Validation = String -> T?
    
    public var failure: Failure?
    public var success: Success?
    
    public var validation: Validation?
    
    public var view: PasswordContainerView!
    
    public init(in stackView: UIStackView, width: CGFloat? = nil, digit: Int) {
        self.view = PasswordContainerView.create(in: stackView, digit: digit)
        self.view.delegate = self
        guard let width = width else { return }
        self.view.width = width
    }
    
    public func resetUI() {
        self.view.clearInput()
    }
}

extension PasswordUIValidation: PasswordInputCompleteProtocol {
    public func passwordInputComplete(passwordContainerView: PasswordContainerView, input: String) {
        guard let model = self.validation?(input) else {
            passwordContainerView.wrongPassword()
            self.failure?()
            return
        }
        self.success?(model)
    }
}
