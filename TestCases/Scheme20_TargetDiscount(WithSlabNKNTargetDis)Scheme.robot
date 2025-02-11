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
Resource    ../POM/DBValidation.robot

Suite Setup    Launch Application
Suite Teardown    Close Browser window

*** Variables ***
${Rownumber}    22

*** Test Cases ***
TC023_CreateScheme20
    [Tags]    SDMS    Scheme20_TargetDiscountScheme
    Log To File    Scheme20_TargetDiscountScheme Starts
    Create New Scheme Type20
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download Calculation
    Check Whether the Customer with Rate is Qualified For Discount and Validate Discount If Qualified
    Log To File    Scheme20_TargetDiscountScheme Ends