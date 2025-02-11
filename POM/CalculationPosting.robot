*** Settings ***
Library  Process
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    Collections
Library    String
Library    ../Resources/Utility.py
Resource    RebateProcessSchemeCreation.robot
Resource    SchemeApproval.robot
Resource    PreCalculate.robot
*** Variables ***
${CalculationPostingMenu}   //a[contains(text(),'Calculation Posting')]
${PostCalculations}     //button[contains(text(),'Post Calculations')]
${PostButton}   //button[contains(text(),'Post')]
${CheckBox}     //thead/tr[1]/th[1]/input[1]



*** Keywords ***
Calculation Posting
    Post Calculation After Verification    ${SchemeNumber}

Post Calculation After Verification
    [Arguments]    ${SchemeNumber}
    Wait Until Element Is Visible    ${CalculationPostingMenu}   timeout=10s
    Click Element   ${CalculationPostingMenu}
    Sleep   10
    Wait Until Element Is Visible   ${Filters}    timeout=30s
    Click Element   ${Filters}
    Sleep   5
    Click Element   ${SchemeNumber_loc}
    Input Text  ${SchemeNumber_loc}    ${SchemeNumber}
    Sleep   5
    Click Element   ${CloseFilter}
    Sleep   5
    Click Element   ${SelectScheme}
    Sleep   5
    Wait Until Element Is Visible   ${PostCalculations}   timeout=10s
    Click Element   ${PostCalculations}
    Sleep   5
    Click Element   ${CheckBox}
    Wait Until Element Is Visible   ${PostButton}   timeout=10s
    Click Element   ${PostButton}
    Log  Scheme has been Posted
    