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
${CalVerificationMenu}  //a[contains(text(),'Calculation Verification')]
${CalStatus}    //button[contains(text(),'Status')]
${ApproveSchemeCalButton}   //input[@id='CalcApproved']
${SubmitCalApprove}     //button[contains(text(),'Submit')]

*** Keywords ***
Calculation Verification
    Approve And Verify Calculation    ${SchemeNumber}

Approve And Verify Calculation
    [Arguments]  ${SchemeNumber}
    sleep   5
    Wait Until Element Is Visible    ${CalVerificationMenu}    timeout=30s
    Click Element   ${CalVerificationMenu}
    Wait Until Element Is Visible    //*[@id="rebateIndex"]/a[1]    timeout=30s
    Click Element   //*[@id="rebateIndex"]/a[1]
    Wait Until Element Is Visible    ${Refresh}    timeout=30s
    Click Element   ${Refresh}
    Wait Until Element Is Visible    ${CalVerificationMenu}    timeout=30s
    Click Element   ${CalVerificationMenu}
    Sleep   10
    Wait Until Element Is Visible   ${Filters}    timeout=30s
    Click Element   ${Filters}
    Wait Until Element Is Visible    ${SchemeNumber_loc}    timeout=30s
    Click Element   ${SchemeNumber_loc}
    Input Text  ${SchemeNumber_loc}    ${SchemeNumber}
    Wait Until Element Is Visible    ${CloseFilter}    timeout=30s
    Click Element   ${CloseFilter}
    Wait Until Element Is Enabled    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Wait Until Element Is Visible    ${CalStatus}    timeout=30s
    Click Element   ${CalStatus}
    Wait Until Element Is Visible    ${ApproveSchemeCalButton}    timeout=30s
    Click Element   ${ApproveSchemeCalButton}
    Wait Until Element Is Visible    ${SubmitCalApprove}    timeout=30s
    Click Element   ${SubmitCalApprove}
    Sleep    2
    ${AlertText}    Handle Alert