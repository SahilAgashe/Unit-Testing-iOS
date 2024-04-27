//
//  SignupFormValidatorTests.swift
//  SAA-AppTests
//
//  Created by SAHIL AMRUT AGASHE on 27/04/24.
//

import XCTest
@testable import SAA_App

class SignupFormValidatorTests: XCTestCase {
    
    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError() {
        // Arrange
        let sut = SignupFormModelValidator() // sut: refers to system under test
        
        // Act and Assert
        XCTAssertThrowsError(try sut.isFirstNameValid("sahil!~@"), "The isFirstNameValid() should have thrown an error if user's first name contains illigal characters.") { error in
            XCTAssertEqual(error as? SignupError, SignupError.illigalCharactersFound)
        }
        
    }
    
    func testFirstNameValidation_WhenValidCharactersProvided_ThrowsNoErrors() {
        // Arrange
        let sut = SignupFormModelValidator() // sut: refers to system under test
        
        // Act and Assert
        XCTAssertNoThrow(try sut.isFirstNameValid("Sahil Amrut Agashe"), "The isFirstNameValid() should not have thrown an error when there are no illigal characters provided.")
    }
    
    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError_WithDoTryCatch() {
        // Arrange
        let sut = SignupFormModelValidator() // sut: refers to system under test
        
        // Act and Assert
        do {
            let _ = try sut.isFirstNameValid("sahil~!@")
            XCTFail("The isFirstNameValid() was supposed to throw an error when illigal characters used in User's first name.")
        } catch SignupError.illigalCharactersFound {
            // successfully passing
            return
        } catch {
            XCTFail("The isFirstNameValid() was supposed to throw the SignupError.illigalCharactersFound when illigal characters used in User's first name. A different error was thrown.")
            return
        }
        
    }
    
    func testFirstNameValidation_WhenValidCharactersProvided_ThrowsNoErrors_WithDoTryCatch() {
        // Arrange
        let sut = SignupFormModelValidator() // sut: refers to system under test
        
        // Act and Assert
        do {
            let _ = try sut.isFirstNameValid("Sahil Amrut Agashe")
        } catch {
            XCTFail("The isFirstNameValid() should not have thrown an error when there are valid characters provided")
        }
        
    }

}
