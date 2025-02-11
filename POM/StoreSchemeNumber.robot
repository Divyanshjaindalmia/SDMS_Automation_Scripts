*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    ../Resources/Utility.py
Library    Collections
Library    String
Library    DateTime
Library    ScreenCapLibrary
Library    RPA.FileSystem
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

*** Variables ***
${Directory}    ${EXECDIR}\\TestData\\SchemeNumber
${Directory2}    ${EXECDIR}\\TestData\\SchemeNumber9

*** Keywords ***

#Scheme6
Store Scheme Number
    CreateTextFileWithSchemeNumber    ${SchemeNumber}

Read Scheme Number
    ReadTextFileWithSchemeNumber

Remove Scheme Number
    DeleteTextFileWithSchemeNumber

CreateTextFileWithSchemeNumber
    [Arguments]    ${SchemeNumber}
    # ${SchemeNumber}    ${SchemeNumber}
    OperatingSystem.Append To File    ${Directory}   ${SchemeNumber}

ReadTextFileWithSchemeNumber
    ${SchemeNumber}=    Read File    ${Directory}
    ${SchemeNumber}=    Evaluate    '${SchemeNumber.strip()}'
    Log  ${SchemeNumber}
    Set Global Variable    ${SchemeNumber}
    Log To Console   ${SchemeNumber}

DeleteTextFileWithSchemeNumber
    OperatingSystem.Remove File    ${Directory}

#Scheme9
Store Scheme Number9
    CreateTextFileWithSchemeNumber9    ${SchemeNumber}

Read Scheme Number9
    ReadTextFileWithSchemeNumber9

Remove Scheme Number9
    DeleteTextFileWithSchemeNumber9

CreateTextFileWithSchemeNumber9
    [Arguments]    ${SchemeNumber}
    # ${SchemeNumber}    ${SchemeNumber}
    OperatingSystem.Create File    ${Directory2}   ${SchemeNumber}

ReadTextFileWithSchemeNumber9
    ${SchemeNumber}=    Read File    ${Directory2}
    ${SchemeNumber}=    Evaluate    '${SchemeNumber.strip()}'
    Log  ${SchemeNumber}
    Set Global Variable    ${SchemeNumber}
    Log To Console    ${SchemeNumber}

DeleteTextFileWithSchemeNumber9
    OperatingSystem.Remove File    ${Directory2}