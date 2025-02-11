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
${Rownumber}    3

*** Test Cases ***
TC04_CreateScheme3_IncrementalQuantityActual_QuantityDiscountGrowthScheme
    [Tags]    SDMS    Scheme3_QuantityDiscountGrowthScheme_IncrementalQtyActual
    # Sleep   5
    Log To File    Scheme3_QuantityDiscountGrowthScheme_IncrementalQtyActual Starts
    create new scheme of type3 with Incremental Quantity Actual
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    # PreCalculate Unblocked Scheme
    Download PreCalculation To Get Total BilledQuantity
    Check If Customer is Qualified With Incremental Qty Actual
    Calculate Increment And Discount
    Log To File    Scheme3_QuantityDiscountGrowthScheme_IncrementalQtyActual Ends