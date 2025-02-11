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
${Rownumber}    18

*** Test Cases ***
TC019_CreateScheme16_OPCIAORCScheme
    [Tags]    SDMS    Scheme16_CumulativeOPCScheme
    Log To File    Scheme16_CumulativeOPCScheme Starts   
    Create New Scheme Type16 For OPC
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download Calculation
    Retrieve OPC Material and Reference Number of Customer
    Retrieve Billed Quantity Of Vendor OPC and Validate Discount with Slab
    Validate Vendor Details From DB
    Check Whether the Material Is OPC Or Not
    Retrieve Billed Quantity From DB Using Reference Number
    Log To File    Scheme16_CumulativeOPCScheme Ends