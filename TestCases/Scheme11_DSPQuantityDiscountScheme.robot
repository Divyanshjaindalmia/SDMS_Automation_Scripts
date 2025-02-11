*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    ../Resources/Utility.py
Library    Collections
Library    String
Library    DateTime
Library    ScreenCapLibrary
Resource    ../POM/RebateProcessSchemeCreation.robot
Resource    ../POM/SchemeIndex.robot
Resource    ../POM/SchemeApproval.robot
Resource    ../POM/PreCalculate.robot
Resource    ../POM/CalculationVerification.robot
Resource    ../POM/CalculationPosting.robot
Resource    ../POM/DBValidation.robot
Resource    ../POM/ProvisionSchemeList.robot
Resource    ../POM/ProvisionCalculation.robot
Resource    ../POM/ProvisionPosting.robot
Resource    ../POM/DBValidation.robot

Suite Setup    Launch Application
Suite Teardown    Close Browser window

*** Variables ***
${Rownumber}    12

*** Test Cases ***
TC013_CreateScheme11_DSPQuantityDiscountScheme
    [Tags]    SDMS    Scheme11_DSPQuantityDiscountScheme
    Log To File    Scheme11_DSPQuantityDiscountScheme Starts
    Create New Scheme Type11
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    # PreCalculate Approved Scheme
    Download PreCalculation To Get Total BilledQuantity
    Validate And Compare Billed Quantity
    Validate Absolute Value As Per Total BilledQuantity
    Log To File    Scheme11_DSPQuantityDiscountScheme Ends