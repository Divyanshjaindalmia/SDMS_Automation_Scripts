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
${Rownumber}    17

*** Test Cases ***
TC018_CreateScheme16_BlendedIAORCScheme
    [Tags]    SDMS    Scheme16_CumulativeBlendedScheme    CumulativeScheme
    Log To File    Scheme16_BlendedIAORCScheme Starts
    Create New Scheme Type16 For Blended
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download Calculation
    Retrieve Vendor Associated with Customer
    Retrieve Billed Quantity Of Vendor Blended and Validate Discount with Slab
    Validate Vendor Details From DB
    Check Whether the Material Is Blended Or Not
    Retrieve Billed Quantity From DB Using Reference Number
    Log To File    Scheme16_BlendedIAORCScheme Ends