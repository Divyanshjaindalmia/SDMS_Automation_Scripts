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
${Rownumber}    19

*** Test Cases ***
TC020_CreateScheme17_TargetDiscountScheme
    [Tags]    SDMS    Scheme17_TargetDiscountScheme
    Log To File    Scheme17_TargetDiscountScheme Starts
    Create New Scheme Type17
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download Calculation
    Validate Discount Provided To Customer According To TargetQty And AchievementPercentage
    Log To File    Scheme17_TargetDiscountScheme Ends