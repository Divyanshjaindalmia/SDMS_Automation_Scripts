*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    ../Resources/Utility.py
Library    Collections
Library    String
Library    ScreenCapLibrary
Resource    ../POM/RebateProcessSchemeCreation.robot
Resource    ../POM/SchemeIndex.robot
Resource    ../POM/SchemeApproval.robot
Resource    ../POM/PreCalculate.robot
Resource    ../POM/CalculationVerification.robot
Resource    ../POM/CalculationPosting.robot
Resource    ../POM/DBValidation.robot
Suite Setup    Launch Application
Suite Teardown    Close Browser window

*** Variables ***
${Rownumber}    5
${Rateperbag}   //tbody/tr[1]/td[2]/input[1]

*** Test Cases ***
TC06_CreateScheme4_RakeDiscountDirechDispatchScheme
    [Tags]    SDMS    Scheme4_RakeDiscountDirechDispatchScheme
    Log To Console    Scheme4_RakeDiscountDirechDispatchScheme Starts
    Create new scheme type4 rake Discount
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    # PreCalculate Approved Scheme
    Download Calculation
    Validate Rate According to Days
    Log To File    Scheme4_RakeDiscountDirechDispatchScheme Ends