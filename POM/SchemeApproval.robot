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
${Filters}  //button[@type='button' and contains(text(),' Filters ')]
${SchemeNumber_loc}   //input[@name='schemeNumber']
${GetData}  //span[contains(text(),'Get Data')]
${SelectScheme}    //input[@type='radio' and @name='ischecked']
${ViewSchemeToApprove}   //button[@title='View Scheme' and @type='button']
${PageTitle2}  Change Status
${SchemeUnblock}    //input[@type='radio' and @value='Created']
${SchemeRecommended}    //input[@type='radio' and @value='Recommended']
${SubmitInChangeStatus}  //*[@id="scheme"]/div[1]/div/div[1]/div[3]/div/button
${SchemeValidate}   //input[@type='radio' and @value='Validated']
${SchemeApprove}    //input[@type='radio' and @value='Approved']

*** Keywords ***
Unblock Scheme Successfully
    Filter Scheme   ${SchemeNumber}
    Sleep    2
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Wait Until Element Is Visible   ${ViewSchemeToApprove}    timeout=30s
    Click Element   ${ViewSchemeToApprove}
    # sleep   5
    Wait Until Element Is Visible   ${SchemeUnblock}    timeout=30s
    Click Element   ${SchemeUnblock}
    Wait Until Element Is Enabled    ${SubmitInChangeStatus}
    Click Element   ${SubmitInChangeStatus}
#    Sleep   5
    ${Alert_Unblocked}    Handle Alert
    Log To Console  ${Alert_Unblocked}

#select scheme to recommend scheme
Recommend Scheme Successfully
    Filter Scheme   ${SchemeNumber}
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Wait Until Element Is Visible   ${ViewSchemeToApprove}    timeout=30s
    Click Element   ${ViewSchemeToApprove}
    # sleep   5
    wait until element is visible   ${SchemeRecommended}    timeout=30s
    Click Element   ${SchemeRecommended}
    Wait Until Element Is Enabled    ${SubmitInChangeStatus}
    Click Element   ${SubmitInChangeStatus}
#    Sleep   5
    ${Alert_Recommended}    Handle Alert
    Log To Console  ${Alert_Recommended}

Validate Scheme Successfully
    Filter Scheme   ${SchemeNumber}
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Wait Until Element Is Visible   ${ViewSchemeToApprove}    timeout=30s
    Click Element   ${ViewSchemeToApprove}
    # sleep   2
    Wait Until Element Is Visible   ${SchemeValidate}    timeout=30s
    Click Element   ${SchemeValidate}
    Wait Until Element Is Enabled    ${SubmitInChangeStatus}    timeout=30s
    Click Element   ${SubmitInChangeStatus}
#    Sleep   5
    ${Alert_Validate}    Handle Alert
    Log To Console  ${Alert_Validate}

Approve Scheme Successfully
    Filter Scheme   ${SchemeNumber}
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Wait Until Element Is Visible   ${ViewSchemeToApprove}    timeout=30s
    Click Element   ${ViewSchemeToApprove}
    # sleep   2
    Wait Until Element Is Visible   ${SchemeApprove}    timeout=30s
    Click Element   ${SchemeApprove}
    Wait Until Element Is Enabled    ${SubmitInChangeStatus}    timeout=30s
    Click Element   ${SubmitInChangeStatus}
#    Sleep   5
    ${Alert_Approve}    Handle Alert
    Log To Console  ${Alert_Approve}












