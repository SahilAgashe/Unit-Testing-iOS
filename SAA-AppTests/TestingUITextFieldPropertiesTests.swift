//
//  TestingUITextFieldPropertiesTests.swift
//  SAA-AppTests
//
//  Created by SAHIL AMRUT AGASHE on 27/04/24.
//

import XCTest
@testable import SAA_App

class TestingUITextFieldPropertiesTests: XCTestCase {
    
    var sut: SignupViewController! // sut: refers System Under Test
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address textfield is not connected")
        
        XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email address textfield does not have an Email Address Content Type set")
    }
    
    func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address textfield is not connected")
        
        XCTAssertEqual(emailTextField.keyboardType, .emailAddress, "Email address textfield does not have an Email Keyboard Type set")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
        let emailTextField = try XCTUnwrap(sut.passwordTextField, "Password textfield is not connected")
        
        XCTAssertTrue(emailTextField.isSecureTextEntry, "Password textfield is not a Secure Text Entry Field")
    }
    
}
