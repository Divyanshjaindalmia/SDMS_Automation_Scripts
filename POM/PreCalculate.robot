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
Resource    CalculationVerification.robot
Resource    DBValidation.robot

*** Variables ***
${PreCal}    //button[@type='button' and contains(text(),' Pre Calulate ')]
${Calcluate}    //span[contains(text(),'Calculate')]
${Refresh}  //button[@type='button' and contains(text(),' Refresh ')]
${DownloadCal}  //button[@type='button' and contains(text(),' Download Pre Calculation ')]
${SaveCal}  //span[contains(text(),'Save')]
${RebateCalMenu}    //a[contains(text(),'Rebate Calculation')]
${RebateCalStatus}    //tbody/tr[1]/td[10]
${SchemeNumFromSaveWindow}  //*[@id="mat-dialog-0"]/calc-file-dialog/div[1]/mat-form-field/div/div[1]/comment()[1]
${CloseFilter}  //span[contains(text(),'Close')]
${CalculateDiscount}    //button[@type='button' and contains(text(),' Calculate ')]
# ${SubmitCalculation}    //button[@type='submit' and contains(text(),'Calculate')]
${SubmitCalculation}    //button[contains(text(),'Calculate')]
${CalculationStatus_scheme1}    //tbody/tr[1]/td[12]


*** Keywords ***
Download PreCalculation To Get Total BilledQuantity
    Download Calculation
    GetLatestDownloadedPreCalculationFile    precal

Download Precalculation And Discount Given To SubDealer
    Download Calculation
    Get Total Quantity Of SubDealer And Validate Discount    precal
    
Rebate Calculation
    Rebate Calculation After Precalculation    ${SchemeNumber}

 Download PreCalculation And Get Average Quantity
    Download Calculation
    GetLatestDownloadedPreCalculationFile    precal
    Calculate Average Quantity    5
    Calculate Average Quantity    10
    Calculate Average Quantity    ${rate}

Validate Absolute Value As Per Total BilledQuantity
    Validate AbsoluteValue As Per BilledQuantity    11500
    Validate AbsoluteValue As Per BilledQuantity    10000
    Validate AbsoluteValue As Per BilledQuantity    2000
    Validate AbsoluteValue As Per BilledQuantity    5000
    Validate AbsoluteValue As Per BilledQuantity    7000
    Validate AbsoluteValue As Per BilledQuantity    200
    Validate AbsoluteValue As Per BilledQuantity    500
    Validate AbsoluteValue As Per BilledQuantity    1000
    Validate AbsoluteValue As Per BilledQuantity    1200
    Validate AbsoluteValue As Per BilledQuantity    6000

Validate Discount Given To Customer
    Validate Rate Given To Customer    ${rate10}

Validate Rate
    Retrieve BilledQuantity And Material From Excel    ${rate12}

#Scheme14
Validate Rate And Achievement Percentage
    Validate TargetQuantity One
    Validate TargetQuantity Two
    Validate TargetQuantity Three
    Validate TargetQuantity Four

Validate TargetQuantity One
    Retrieve Customer And TargetQuantity From Excel    228
    Retrieve Billed Quantity From DB And Calculate Achievement Percentage
    Retrieve Rate Given To Customer From Precalculation

Validate TargetQuantity Two
    Retrieve Customer And TargetQuantity From Excel    630
    Retrieve Billed Quantity From DB And Calculate Achievement Percentage
    Retrieve Rate Given To Customer From Precalculation

Validate TargetQuantity Three
    Retrieve Customer And TargetQuantity From Excel    1800
    Retrieve Billed Quantity From DB And Calculate Achievement Percentage
    Retrieve Rate Given To Customer From Precalculation

Validate TargetQuantity Four
    Retrieve Customer And TargetQuantity From Excel    2120
    Retrieve Billed Quantity From DB And Calculate Achievement Percentage
    Retrieve Rate Given To Customer From Precalculation

Calcluate Growth and Validate Rate
    Validate Growth Zero
    Validate Growth One
    Validate Growth Two
    Validate Growth Three
    Validate Growth Four

Validate Growth Zero
    Get BilledQuantity From Precalculation and Validate Rate    0
    Retrieve BilledQuantity From DB for Prev Date to Calculate Growth
Validate Growth One
    Get BilledQuantity From Precalculation and Validate Rate    40
    Retrieve BilledQuantity From DB for Prev Date to Calculate Growth
Validate Growth Two
    Get BilledQuantity From Precalculation and Validate Rate    60
    Retrieve BilledQuantity From DB for Prev Date to Calculate Growth

Validate Growth Three
    Get BilledQuantity From Precalculation and Validate Rate    80
    Retrieve BilledQuantity From DB for Prev Date to Calculate Growth
Validate Growth Four
    Get BilledQuantity From Precalculation and Validate Rate    100
    Retrieve BilledQuantity From DB for Prev Date to Calculate Growth

Validate Truck Details
    Validate Quantity And TruckDetails One
    Validate Quantity And TruckDetails Two
    Validate Quantity And TruckDetails Three
    Validate Quantity And TruckDetails Four
    Validate Quantity And TruckDetails Five
    Validate Quantity And TruckDetails Six
Validate Quantity And TruckDetails One
    Get ReferenceNumber to Check Truck Details    0    
    Retrieve Truck Details From DB

Validate Quantity And TruckDetails Two
    Get ReferenceNumber to Check Truck Details    100   
    Retrieve Truck Details From DB

Validate Quantity And TruckDetails Three
    Get ReferenceNumber to Check Truck Details    120
    Retrieve Truck Details From DB

Validate Quantity And TruckDetails Four
    Get ReferenceNumber to Check Truck Details    140 
    Retrieve Truck Details From DB

Validate Quantity And TruckDetails Five
    Get ReferenceNumber to Check Truck Details    150
    Retrieve Truck Details From DB

Validate Quantity And TruckDetails Six
    Get ReferenceNumber to Check Truck Details    160
    Retrieve Truck Details From DB
    
#precalculation for approved scheme
PreCalculate Unblocked Scheme
    Filter Scheme   ${SchemeNumber}
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Sleep   5
    Wait Until Element Is Visible    ${PreCal}    timeout=30s
    Click Element   ${PreCal}
    Sleep   5
    Wait Until Element Is Visible    ${Calcluate}    timeout=30s
    Click Element   ${Calcluate}
    log  precalculation started
    Sleep    5
    ${Alert_Precalculation}    Handle Alert
    Log To Console  ${Alert_Precalculation}
    Sleep   5
    Wait Until Element Is Visible    ${CalVerificationMenu}    timeout=30s
    Click Element   ${CalVerificationMenu}
    Sleep    2
    Wait Until Element Is Visible    //*[@id="rebateIndex"]/a[1]    timeout=30s
    Click Element   //*[@id="rebateIndex"]/a[1]
    Sleep    2
    Wait Until Element Is Visible    ${Refresh}    timeout=30s
    Click Element   ${Refresh}
    FOR    ${i}    IN RANGE    100
        Click Element   ${Refresh}
        Sleep    20s
        ${precalamount}    SeleniumLibrary.Get Text    //tbody/tr[1]/td[13]
        ${status2}=    SeleniumLibrary.Get Text    //tbody/tr[1]/td[10]
        ${status}=    SeleniumLibrary.Get Text    ${CalculationStatus_scheme1}
        Run Keyword If    '${status}' == 'Calculated'    Exit For Loop
        log  ${status}
        Run Keyword If    '${status}' == 'Calc Failed'    
        ...    Fail    Calculation Failed
        Run Keyword If    '${precalamount}' == '0.00'
        ...    Fail    PreCalculation Amount is 0
    END

Precalculate Scheme6
    Filter Scheme   ${SchemeNumber}
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Sleep   5
    Click Element   ${PreCal}
    Sleep   5
    Click Element   ${Calcluate}
    log  precalculation started
    Sleep    5
    ${Alert_Precalculation}    Handle Alert
    Log To Console  ${Alert_Precalculation}
    Sleep   5
    Click Element   ${CalVerificationMenu}
    Sleep    2
    Click Element   //*[@id="rebateIndex"]/a[1]
    Sleep    2
    Click Element   ${Refresh}

Download Precalculation File For Scheme6
    Filter Scheme    ${SchemeNumber}
    Click Element   ${SelectScheme}    
    FOR    ${i}    IN RANGE    100
        Click Element   ${Refresh}
        Sleep    20s
        ${precalamount}    SeleniumLibrary.Get Text    //tbody/tr[1]/td[13]
        ${status2}=    SeleniumLibrary.Get Text    //tbody/tr[1]/td[10]
        ${status}=    SeleniumLibrary.Get Text    ${CalculationStatus_scheme1}
        Run Keyword If    '${status}' == 'Calculated'    Exit For Loop
        log  ${status}
        Run Keyword If    '${status}' == 'Calc Failed'    
        ...    Fail    Calculation Failed
        Run Keyword If    '${precalamount}' == '0.00'
        ...    Fail    PreCalculation Amount is 0
    END
    Click Element   ${CalVerificationMenu}
    Sleep    2
    Click Element   //*[@id="rebateIndex"]/a[1]
    Sleep    2
    Click Element   ${Refresh}
    Filter Scheme   ${SchemeNumber}
    Click Element   ${SelectScheme}
    Wait Until Element Is Visible   ${DownloadCal}
    Click Element   ${DownloadCal}
    Wait Until Element Is Visible   ${SaveCal}   timeout=40s
    Click Element   ${SaveCal}
    Sleep   5
    log  precalculation downloaded successfully
    
Download Calculation
    # Filter Scheme    ${SchemeNumber}
    # Click Element   ${SelectScheme}    
    # FOR    ${i}    IN RANGE    100
    #     Click Element   ${Refresh}
    #     Sleep    20s
    #     ${precalamount}    SeleniumLibrary.Get Text    //tbody/tr[1]/td[13]
    #     ${status2}=    SeleniumLibrary.Get Text    //tbody/tr[1]/td[10]
    #     ${status}=    SeleniumLibrary.Get Text    ${CalculationStatus_scheme1}
    #     Run Keyword If    '${status}' == 'Calculated'    Exit For Loop
    #     log  ${status}
    #     Run Keyword If    '${status}' == 'Calc Failed'    
    #     ...    Fail    Calculation Failed
    #     Run Keyword If    '${precalamount}' == '0.00'
    #     ...    Fail    PreCalculation Amount is 0
    # END
    # Click Element   ${CalVerificationMenu}
    # Sleep    2
    # Click Element   //*[@id="rebateIndex"]/a[1]
    # Sleep    2
    # Click Element   ${Refresh}
    Filter Scheme   ${SchemeNumber}
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element   ${SelectScheme}
    Wait Until Element Is Visible   ${DownloadCal}    timeout=30s
    Click Element   ${DownloadCal}
    Wait Until Element Is Visible   ${SaveCal}   timeout=50s
    Click Element   ${SaveCal}
    Sleep   5
    log  precalculation downloaded successfully

 GetLatestDownloadedPreCalculationFile
    [Arguments]    ${type}
    ${customer}=    getrandomvalue    ${type}    Customer    ${SchemeNumber}
    Log To File    Customer: ${customer}
    ${customer}=    Evaluate    int(${customer})    
    # ${customer}  Convert To Number  ${customer}
    Set Global Variable    ${randomcustomer}    ${customer}
    ${BilledQuantity}=    filter_excel_column    Customer    ${randomcustomer}    ${type}    ${SchemeNumber}
    Log To File    BilledQuantityOfCustomerFromPrecalculation: ${BilledQuantity}
    log  Billed Quantity is: ${BilledQuantity}
    Set Global Variable    ${BilledQuantityFromExcel}    ${BilledQuantity}    
    RETURN  ${BilledQuantityFromExcel}

#Scheme1
# Validate Rate With Slab Provided
#     IF    ${BilledQuantityFromExcel} >=10 and ${BilledQuantityFromExcel} < 50
#         Log    Rate is 5
#     ELSE IF    ${BilledQuantityFromExcel} >=50 and ${BilledQuantityFromExcel} < 100
#         Log    Rate is 10
#     ELSE IF    ${BilledQuantityFromExcel} >=100 and ${BilledQuantityFromExcel} < 250
#         Log    Rate is 15
#     ELSE IF    ${BilledQuantityFromExcel} >=250 and ${BilledQuantityFromExcel} < 500
#         Log    Rate is 20
#     ELSE IF    ${BilledQuantityFromExcel} >=500 and ${BilledQuantityFromExcel} < 750
#         Log    Rate is 25
#     ELSE IF    ${BilledQuantityFromExcel} >=750 and ${BilledQuantityFromExcel} < 1000
#         Log    Rate is 30
#     ELSE IF    ${BilledQuantityFromExcel} >=1000
#         Log    Rate is 35
#     ELSE
#         Log    No Data Found        
#     END

Validate Rate With Slab Provided
    Validate Rate with Slab Provided in Scheme    5
    Validate Rate with Slab Provided in Scheme    10
    Validate Rate with Slab Provided in Scheme    15
    Validate Rate with Slab Provided in Scheme    20
    Validate Rate with Slab Provided in Scheme    25
    Validate Rate with Slab Provided in Scheme    30
    Validate Rate with Slab Provided in Scheme    35

Validate Rate with Slab Provided in Scheme
    [Arguments]    ${input_rate}
    @{params}    Create List
    ${input_param_rate}    Evaluate    int(${input_rate})
    @{Params}    getRateAndSumOfBilledQty    ${input_param_rate}    precal    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${rate_value}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate_value}
            ${sum_of_billed_qty}=    Set Variable    ${params}[2]
            Set Global Variable    ${sum_of_billed_qty}
            Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer: ${customer_value}, Rate: ${rate_value}, BilledQtyFromPrecal: ${sum_of_billed_qty},
    ELSE
        Log    No Data Found
    END
    Run Keyword If    ${sum_of_billed_qty} >=10 and ${sum_of_billed_qty} < 50
    ...    Log    message: ${rate_value}
    Run Keyword If    ${sum_of_billed_qty} >= 50 and ${sum_of_billed_qty} < 100
    ...    Log    message: ${rate_value}
    Run Keyword If    ${sum_of_billed_qty} >= 100 and ${sum_of_billed_qty} <250
    ...    Log    message: ${rate_value}
    Run Keyword If    ${sum_of_billed_qty} >= 250 and ${sum_of_billed_qty} < 500
    ...    Log    message: ${rate_value}
    Run Keyword If    ${sum_of_billed_qty} >= 500 and ${sum_of_billed_qty} < 750
    ...    Log    message: ${rate_value}
    Run Keyword If    ${sum_of_billed_qty} >= 750 and ${sum_of_billed_qty} < 1000
    ...    Log    message: ${rate_value}
    Run Keyword If    ${sum_of_billed_qty} >= 1000
    ...    Log    message: ${rate_value}
    
#Scheme2
Validate Discount
    Validate Rate according to Quantity    ${rate2}
Validate Rate according to Quantity
    [Arguments]    ${input_rate}
    @{params}    Create List
    ${input_param_rate}    Evaluate    int(${input_rate})
    @{Params}    getRateAndSumOfBilledQty    ${input_param_rate}    precal    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${rate_value}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate_value}
            ${sum_of_billed_qty}=    Set Variable    ${params}[2]
            Set Global Variable    ${sum_of_billed_qty}
            Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer: ${customer_value}, Rate: ${rate_value}, BilledQtyFromPrecal: ${sum_of_billed_qty},
    ELSE
        Log    No Data Found
    END
    Run Keyword If    ${sum_of_billed_qty} >=30
    ...    Log    message: ${rate_value}

Rebate Calculation After Precalculation
    [Arguments]    ${SchemeNumber}
    Wait Until Element Is Visible    ${RebateCalMenu}    timeout=30s
    Click Element    ${RebateCalMenu}
    Sleep    2
    Wait Until Element Is Visible    ${Filters}    timeout=20s
    Wait Until Element Is Enabled    ${Filters}    timeout=20s
    Sleep    1
    Click Element    ${Filters}
    Sleep    1
    Wait Until Element Is Visible    ${SchemeNumber_loc}    timeout=30s
    Click Element    ${SchemeNumber_loc}
    Input Text    ${SchemeNumber_loc}    ${SchemeNumber}
    Sleep    1
    Wait Until Element Is Visible    ${CloseFilter}    timeout=30s
    Click Element    ${CloseFilter}
    Sleep    1
    Wait Until Element Is Visible    ${SelectScheme}    timeout=30s
    Click Element    ${SelectScheme}
    Sleep    1
    Wait Until Element Is Visible    ${CalculateDiscount}    timeout=30s
    Click Element    ${CalculateDiscount}
    # Force scroll to element    ${SubmitCalculation}
    Sleep    5
    Wait Until Element Is Visible    ${SubmitCalculation}    timeout=30s
    Click Element    ${SubmitCalculation}
    Run Keyword And Ignore Error    Handle Alert    timeout=30s
    Sleep    5
    FOR    ${i}    IN RANGE    20
        Wait Until Element Is Visible    ${Refresh}    timeout=30s
        Click Element    ${Refresh}
        Sleep    5s
        # ${status}=    SeleniumLibrary.Get Text    ${RebateCalStatus}
        # Run Keyword If    '${status}' == 'Calculated'    Exit For Loop
        # log  ${status}
        # Run Keyword If    '${status}' == 'Calc Failed'    
        # ...    Fail    Calculation Failed
        ${scheme_present}=    Run Keyword And Return Status    Element Should Be Visible    ${SelectScheme}
        Exit For Loop If    '${scheme_present}' == 'False'
    END

#Get avg qty for excel validation of Scheme7
Calculate Average Quantity
    [Arguments]    ${input_rate}
    @{params}    Create List
    ${input_param_rate}    Evaluate    int(${input_rate})
    @{Params}    getRateAndSumOfBilledQty    ${input_param_rate}    precal    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${rate_value}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate_value}
            ${sum_of_billed_qty}=    Set Variable    ${params}[2]
            Set Global Variable    ${sum_of_billed_qty}
            Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer: ${customer_value}, Rate: ${rate_value}, BilledQtyFromPrecal: ${sum_of_billed_qty},
    ELSE
        Log    No Data Found
    END
    ${AvgQty}=    Evaluate    ${sum_of_billed_qty}/12
    Log To File    Average Quantity: ${AvgQty}
    Log To File    Rate: ${rate_value}
    Set Global Variable    ${AvgQty}
    log  ${AvgQty}
    Run Keyword If    ${AvgQty} >=0 and ${AvgQty} < 50
    ...    Log    message: ${rate_value}
    Run Keyword If    ${AvgQty} >= 50 and ${AvgQty} < 200
    ...    Log    message: ${rate_value}
    Run Keyword If    ${AvgQty} >= 200
    ...    Log    message: ${rate_value}
    # Run Keyword If    ${AvgQty} >=0 and ${AvgQty} < 13
    # ...    Log    message: ${rate_value}
    # Run Keyword If    ${AvgQty} >= 13 and ${AvgQty} < 20
    # ...    Log    message: ${rate_value}
    # Run Keyword If    ${AvgQty} >= 20
    # ...    Log    message: ${rate_value}

#scheme9
Get Total Quantity Of SubDealer And Validate Discount
    [Arguments]    ${type}
    ${subdealerfromexcel}=    getrandomvalue    ${type}    Ship_to_Party    ${SchemeNumber}
    ${subdealerfromexcel}=    Evaluate    int(${subdealerfromexcel})
    # ${customer}  Convert To Number  ${customer}
    Set Global Variable    ${subdealerfromexcel}
    ${BilledQuantity}=    filter_excel_column    Ship_to_Party    ${subdealerfromexcel}    ${type}    ${SchemeNumber}
    log  Billed Quantity is: ${BilledQuantity}
    Log To File    BilledQuantityOfSubDealerFromPrecalculation: ${BilledQuantity}
    Set Global Variable    ${BilledQuantityFromExcel}    ${BilledQuantity}
    IF    ${BilledQuantityFromExcel} >= 10 and ${BilledQuantityFromExcel} < 20
        Log    Rate is 10
    ELSE IF    ${BilledQuantityFromExcel} >= 20 and ${BilledQuantityFromExcel} < 50
        Log    Rate is 20
    ELSE IF    ${BilledQuantityFromExcel} >= 50
        Log    Rate is 30
    ELSE
        Log    No Data Found    
    END

Fetch Customer From Excel
    ${customer}    Getrandomvalue    precal     Customer    ${SchemeNumber}
    ${customer}    Evaluate    int(${customer})
    Set Global Variable    ${customer}

#scheme11
Validate AbsoluteValue As Per BilledQuantity
    [Arguments]    ${AbsoluteValue}
    @{params}    Create List
    ${input_param_Value}    Evaluate    int(${AbsoluteValue})
    @{Params}    getRateAndSumOfBilledQty    ${input_param_Value}    precal    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${rate_value}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate_value}
            ${sum_of_billed_qty}=    Set Variable    ${params}[2]
            Set Global Variable    ${sum_of_billed_qty}
            Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer: ${customer_value}, Rate: ${rate_value}, BilledQtyFromPrecal: ${sum_of_billed_qty},
            IF    ${sum_of_billed_qty} >= 5 and ${sum_of_billed_qty} < 10
                Log    Absolute value given is 200
            ELSE IF    ${sum_of_billed_qty} >= 10 and ${sum_of_billed_qty} < 15
                Log    Absolute value given is 500
            ELSE IF    ${sum_of_billed_qty} >= 15 and ${sum_of_billed_qty} < 20
                Log    Absolute value given is 700
            ELSE IF    ${sum_of_billed_qty} >= 20 and ${sum_of_billed_qty} < 25
                Log    Absolute value given is 1000
            ELSE IF    ${sum_of_billed_qty} >= 25 and ${sum_of_billed_qty} < 30
                Log    Absolute value given is 1200
            ELSE IF    ${sum_of_billed_qty} >= 30 and ${sum_of_billed_qty} < 35
                Log    Absolute value given is 1500
            ELSE IF    ${sum_of_billed_qty} >= 35 and ${sum_of_billed_qty} < 40
                Log    Absolute value given is 1700
            ELSE IF    ${sum_of_billed_qty} >= 40 and ${sum_of_billed_qty} < 45
                Log    Absolute value given is 2000
            ELSE IF    ${sum_of_billed_qty} >= 45 and ${sum_of_billed_qty} < 50
                Log    Absolute value given is 2200
            ELSE IF    ${sum_of_billed_qty} >= 50 and ${sum_of_billed_qty} < 55
                Log    Absolute value given is 2500
            ELSE IF    ${sum_of_billed_qty} >= 55 and ${sum_of_billed_qty} < 60
                Log    Absolute value given is 2700
            ELSE IF    ${sum_of_billed_qty} >= 60 and ${sum_of_billed_qty} < 65
                Log    Absolute value given is 3000
            ELSE IF    ${sum_of_billed_qty} >= 65 and ${sum_of_billed_qty} < 70
                Log    Absolute value given is 3200
            ELSE IF    ${sum_of_billed_qty} >= 70 and ${sum_of_billed_qty} < 75
                Log    Absolute value given is 3500
            ELSE IF    ${sum_of_billed_qty} >= 75 and ${sum_of_billed_qty} < 80
                Log    Absolute value given is 3700
            ELSE IF    ${sum_of_billed_qty} >= 80 and ${sum_of_billed_qty} < 85
                Log    Absolute value given is 4000
            ELSE IF    ${sum_of_billed_qty} >= 85 and ${sum_of_billed_qty} < 90
                Log    Absolute value given is 4200
            ELSE IF    ${sum_of_billed_qty} >= 90 and ${sum_of_billed_qty} < 95
                Log    Absolute value given is 4500
            ELSE IF    ${sum_of_billed_qty} >= 95 and ${sum_of_billed_qty} < 100
                Log    Absolute value given is 4700
            ELSE IF    ${sum_of_billed_qty} >= 100 and ${sum_of_billed_qty} < 105
                Log    Absolute value given is 5000
            ELSE IF    ${sum_of_billed_qty} >= 105 and ${sum_of_billed_qty} < 110
                Log    Absolute value given is 5200
            ELSE IF    ${sum_of_billed_qty} >= 110 and ${sum_of_billed_qty} < 115
                Log    Absolute value given is 5500
            ELSE IF    ${sum_of_billed_qty} >= 115 and ${sum_of_billed_qty} < 120
                Log    Absolute value given is 5700
            ELSE IF    ${sum_of_billed_qty} >= 120 and ${sum_of_billed_qty} < 125
                Log    Absolute value given is 6000
            ELSE IF    ${sum_of_billed_qty} >= 125 and ${sum_of_billed_qty} < 130
                Log    Absolute value given is 6200
            ELSE IF    ${sum_of_billed_qty} >= 130 and ${sum_of_billed_qty} < 135
                Log    Absolute value given is 6500
            ELSE IF    ${sum_of_billed_qty} >= 135 and ${sum_of_billed_qty} < 140
                Log    Absolute value given is 6700
            ELSE IF    ${sum_of_billed_qty} >= 140 and ${sum_of_billed_qty} < 145
                Log    Absolute value given is 7000
            ELSE IF    ${sum_of_billed_qty} >= 145 and ${sum_of_billed_qty} < 150
                Log    Absolute value given is 7200
            ELSE IF    ${sum_of_billed_qty} >= 150 and ${sum_of_billed_qty} < 155
                Log    Absolute value given is 7500
            ELSE IF    ${sum_of_billed_qty} >= 155 and ${sum_of_billed_qty} < 160
                Log    Absolute value given is 7700
            ELSE IF    ${sum_of_billed_qty} >= 160 and ${sum_of_billed_qty} < 165
                Log    Absolute value given is 8000
            ELSE IF    ${sum_of_billed_qty} >= 165 and ${sum_of_billed_qty} < 170
                Log    Absolute value given is 8200
            ELSE IF    ${sum_of_billed_qty} >= 170 and ${sum_of_billed_qty} < 175
                Log    Absolute value given is 8500
            ELSE IF    ${sum_of_billed_qty} >= 175 and ${sum_of_billed_qty} < 180
                Log    Absolute value given is 8700
            ELSE IF    ${sum_of_billed_qty} >= 180 and ${sum_of_billed_qty} < 185
                Log    Absolute value given is 9000
            ELSE IF    ${sum_of_billed_qty} >= 185 and ${sum_of_billed_qty} < 190
                Log    Absolute value given is 9200
            ELSE IF    ${sum_of_billed_qty} >= 190 and ${sum_of_billed_qty} < 195
                Log    Absolute value given is 9500
            ELSE IF    ${sum_of_billed_qty} >= 195 and ${sum_of_billed_qty} < 200
                Log    Absolute value given is 9700
            ELSE IF    ${sum_of_billed_qty} >= 200 and ${sum_of_billed_qty} <205
                Log    Absolute value given is 10000
            ELSE IF    ${sum_of_billed_qty} >= 205 and ${sum_of_billed_qty} < 210
                Log    Absolute value given is 10200
            ELSE IF    ${sum_of_billed_qty} >= 210 and ${sum_of_billed_qty} < 215
                Log    Absolute value given is 10500
            ELSE IF    ${sum_of_billed_qty} >= 215 and ${sum_of_billed_qty} < 220
                Log    Absolute value given is 10700
            ELSE IF    ${sum_of_billed_qty} >= 220 and ${sum_of_billed_qty} < 225
                Log    Absolute value given is 11000
            ELSE IF    ${sum_of_billed_qty} >= 225 and ${sum_of_billed_qty} < 230
                Log    Absolute value given is 11200
            ELSE IF    ${sum_of_billed_qty} >= 230 and ${sum_of_billed_qty} < 235
                Log    Absolute value given is 11500
            ELSE
                Log    No Data Found        
            END
    ELSE
        Log    No Data Found
    END
    
#Scheme10
Validate Rate Given To Customer
    [Arguments]    ${rate}
    @{params}    Create List
    ${input_param_Value}    Evaluate    int(${rate})
    @{Params}    getRateAndSumOfBilledQty    ${input_param_Value}    precal    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${rate_value}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate_value}
            ${sum_of_billed_qty}=    Set Variable    ${params}[2]
            Set Global Variable    ${sum_of_billed_qty}
            Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer: ${customer_value}, Rate: ${rate_value}, BilledQtyFromPrecal: ${sum_of_billed_qty},
    END
    IF    ${sum_of_billed_qty} >= 0 and ${sum_of_billed_qty} < 10000
        Log    ${rate}
    ELSE
        Log    No Discount Provided
    END

#Scheme12
Retrieve BilledQuantity And Material From Excel
    [Arguments]    ${rate}
    @{params}    Create List
    ${input_param_Value}    Evaluate    int(${rate})
    @{Params}    getBilledQuantityandMaterial    ${input_param_Value}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
        ${customer_value}=    Set Variable    ${params}[0]
        ${Material_value}=    Set Variable    ${params}[1]
        ${rate_value}=    Set Variable    ${params}[2]
        Set Global Variable    ${rate_value}
        ${sum_of_billed_qty}=    Set Variable    ${params}[3]
        ${customer_value}    Convert To String    ${customer_value}
        Set Global Variable    ${customer_value}
        Set Global Variable    ${sum_of_billed_qty}
        # ${Material_value}    Convert To String    ${Material_value}
        Set Global Variable    ${Material_value}
        Log    message: ${customer_value}, ${sum_of_billed_qty}, ${rate_value}, ${Material_value}
        Log To File    Customer: ${customer_value}, BilledQty: ${sum_of_billed_qty}, Rate: ${rate_value}, Material: ${Material_value}
        IF    ${sum_of_billed_qty} >= 0
            Log    ${rate}
        ELSE
            Log    No Discount Provided
        END
    ELSE
        Log    No Data Found
    END
    # IF    ${sum_of_billed_qty} >= 0
    #     Log    ${rate}
    # ELSE
    #     Log    No Discount Provided
    # END

#Schemme14
Retrieve Customer And TargetQuantity From Excel
    [Arguments]    ${target}
    @{params}    Create List
    ${input_taget_Value}    Evaluate    int(${target})
    @{Params}    getTragetQuantity    ${input_taget_Value}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
        ${customer_value}=    Set Variable    ${params}[0]
        ${TargetQuantity_value}=    Set Variable    ${params}[1]
        ${rate_value}=    Set Variable    ${params}[2]
        ${Achievement}    Set Variable    ${params}[3]
        Set Global Variable    ${rate_value}
        ${customer_value}    Convert To String    ${customer_value}
        Set Global Variable    ${customer_value}
        # ${Material_value}    Convert To String    ${Material_value}
        Set Global Variable    ${TargetQuantity_value}
        Log    message: ${customer_value}, ${rate_value}, ${TargetQuantity_value}, ${Achievement}
        Log To File    Customer: ${customer_value}, TargetQuantity: ${TargetQuantity_value}, Rate: ${rate_value}, Achievement: ${Achievement}
    END

Retrieve Rate Given To Customer From Precalculation
    @{params}    Create List
    @{Params}    getRateGivenToCustomer    ${customer_value}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${customer_value}    Get From List    ${Params}    0
        # ${customer_value}=    Set Variable    ${params}[0]
        ${ratefromprecal}    Get From List    ${params}    1
        Set Global Variable    ${ratefromprecal}          
        Log    message: ${customer_value}, ${ratefromprecal}
        Log To File    Customer: ${customer_value}, Rate: ${ratefromprecal}
    END
    IF    ${rate_value} == ${ratefromprecal}
        Log    Rates are matching
    ELSE
        Log    Rates are not matching
    END

#Scheme13
Get BilledQuantity From Precalculation and Validate Rate
    [Arguments]    ${rate}
    @{params}    Create List
    ${input_param_Value}    Evaluate    int(${rate})
    @{Params}    getRateAndSumOfBilledQty    ${input_param_Value}    precal    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${rate_value}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate_value}
            ${sum_of_billed_qty}=    Set Variable    ${params}[2]
            Set Global Variable    ${sum_of_billed_qty}
            Set Global Variable    ${customer_value}
            Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer: ${customer_value}, Rate: ${rate_value}, BilledQtyFromPrecal: ${sum_of_billed_qty},
    END

#Scheme15
Get ReferenceNumber to Check Truck Details
    [Arguments]    ${rate}
    @{params}    Create List
    @{refnumber}    Create List    0
    ${input_param_Value}    Evaluate    int(${rate})
    @{Params}    getRerefenceNumber    ${input_param_Value}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${referencenumber}=    Set Variable    ${params}[1]
            ${rate_value}=    Set Variable    ${params}[2]
            Set Global Variable    ${rate_value}
            ${sum_of_billed_qty}=    Set Variable    ${params}[3]
            ${referencenumber}    Convert To String    ${referencenumber}
            Set Global Variable    ${referencenumber}
            Set Global Variable    ${sum_of_billed_qty}
            Set Global Variable    ${customer_value}
            Append To List    ${refnumber}    ${referencenumber}
            Set Global Variable    ${refnumber}
            Log    message: ${customer_value}, ${refnumber}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer: ${customer_value}, ReferenceNumber: ${refnumber}, Rate: ${rate_value}, BilledQtyFromPrecal: ${sum_of_billed_qty},
    END

#Scheme16Blended
Retrieve Vendor Associated with Customer
    @{params}    Create List
    @{params}    getCustomerAndVendor    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer}=    Set Variable    ${params}[0]
            ${vendor}=    Set Variable    ${params}[1]
            ${material}=    Set Variable    ${params}[2]
            ${reference}=    Set Variable    ${params}[3]
            ${rate}=    Set Variable    ${params}[4]
            ${BilledQty}=    Set Variable    ${params}[5]            
            ${vendorstring}    Convert To String    ${vendor}
            ${reference}    Convert To String    ${reference}
            Set Global Variable    ${vendor}
            Set Global Variable    ${customer}
            Set Global Variable    ${reference}
            Set Global Variable    ${rate}
            Set Global Variable    ${BilledQty}
            Set Global Variable    ${material}
            Set Global Variable    ${vendorstring}
            Log    message: ${customer}, ${vendor}, ${reference}, ${rate}, ${BilledQty}, ${material}
            Log To File    Customer: ${customer}, Vendor: ${vendor}, Reference: ${reference}, Rate: ${rate}, BilledQty: ${BilledQty}, Material: ${material}
    END
Retrieve Billed Quantity Of Vendor Blended and Validate Discount with Slab
    @{params}    Create List
    @{params}    getBilledQuantityOfVendor    ${vendor}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${rate}=    Set Variable    ${params}[0]
            ${BilledQtyOfVendor}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate}
            Set Global Variable    ${BilledQtyOfVendor}
            Log    message: ${rate}, ${BilledQtyOfVendor}
            Log To File    Rate: ${rate}, BilledQtyOfVendor: ${BilledQtyOfVendor}
    END
    Run Keyword If    ${BilledQtyOfVendor} >=500.001 and ${BilledQtyOfVendor} < 1000.001
    ...    Should Be Equal As Numbers    ${rate}    50
    Run Keyword If    ${BilledQtyOfVendor} >=1000.001 and ${BilledQtyOfVendor} < 2000.001
    ...    Should Be Equal As Numbers    ${rate}    55
    Run Keyword If    ${BilledQtyOfVendor} >=2000.001 and ${BilledQtyOfVendor} < 5000.001
    ...    Should Be Equal As Numbers    ${rate}    60
    Run Keyword If    ${BilledQtyOfVendor} >=5000.001
    ...    Should Be Equal As Numbers    ${rate}    65
    ...   ELSE   Log    No Discount Provided      

#Scheme16OPC
Retrieve OPC Material and Reference Number of Customer
    @{params}    Create List
    @{params}    getOPCMaterialAndReferenceNumberOfCustomer    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer}=    Set Variable    ${params}[0]
            ${vendor}=    Set Variable    ${params}[1]
            ${material}=    Set Variable    ${params}[2]
            ${reference}=    Set Variable    ${params}[3]
            ${rate}=    Set Variable    ${params}[4]
            ${BilledQty}=    Set Variable    ${params}[5]
            ${reference}    Convert To String    ${reference}
            ${vendorstring}    Convert To String    ${vendor}
            set Global Variable    ${material}
            Set Global Variable    ${BilledQty}
            Set Global Variable    ${rate}
            Set Global Variable    ${customer}
            Set Global Variable    ${reference}
            Set Global Variable    ${vendor}
            Set Global Variable    ${vendorstring}
            Log    message: ${customer}, ${material}, ${reference}, ${rate}, ${BilledQty}, ${vendor}
            Log To File    Customer: ${customer}, Material: ${material}, Reference: ${reference}, Rate: ${rate}, BilledQty: ${BilledQty}, Vendor: ${vendor}
    END

Retrieve Billed Quantity Of Vendor OPC and Validate Discount with Slab
    @{params}    Create List
    @{params}    getBilledQuantityOfVendorOPC    ${vendor}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${rate}=    Set Variable    ${params}[0]
            ${BilledQtyOfVendor}=    Set Variable    ${params}[1]
            Set Global Variable    ${rate}
            Set Global Variable    ${BilledQtyOfVendor}
            Log    message: ${rate}, ${BilledQtyOfVendor}
            Log To File    Rate: ${rate}, BilledQtyOfVendor: ${BilledQtyOfVendor}
    END
    Run Keyword If    ${BilledQtyOfVendor} >=500.001 and ${BilledQtyOfVendor} < 1000.001
    # ...    Should Be Equal As Numbers    ${rate}    70
        IF    70 == ${rate}
            Log    Rate is 70
        ELSE
            Return From Keyword
        END
    Run Keyword If    ${BilledQtyOfVendor} >=1000.001 and ${BilledQtyOfVendor} < 2000.001
    # ...    Should Be Equal As Numbers    ${rate}    75
        IF    75 == ${rate}
            Log    Rate is 75
        ELSE
            Return From Keyword
        END
    Run Keyword If    ${BilledQtyOfVendor} >=2000.001 and ${BilledQtyOfVendor} < 5000.001
    # ...    Should Be Equal As Numbers    ${rate}    80
        IF    80 == ${rate}
            Log    Rate is 80
        ELSE
            Return From Keyword
        END
    Run Keyword If    ${BilledQtyOfVendor} >=5000.001
    # ...    Should Be Equal As Numbers    ${rate}    85
        Run Keyword If    60 == ${rate}
        ...    Log    Rate is 60
        ...    ELSE
        ...         Return From Keyword        
    ...   ELSE   Log    No Discount Provided      

#Scheme17
Retrieve Customer And Rate Provided
    [Arguments]    ${rate}
    ${rate}    Evaluate    int(${rate})
    @{params}    Create List
    @{params}    getRateAndCustomer    ${rate}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer}=    Set Variable    ${params}[0]
            ${rate}=    Set Variable    ${params}[1]
            ${BilledQtyFromPreCal}=    Set Variable    ${params}[2]
            ${customer}    Convert To String    ${customer}
            Set Global Variable    ${rate}
            Set Global Variable    ${customer}
            Set Global Variable    ${BilledQtyFromPreCal}
            Log    message: ${customer}, ${rate}, ${BilledQtyFromPreCal}
            Log To File    Customer: ${customer}, Rate: ${rate}, BilledQtyFromPrecal: ${BilledQtyFromPreCal}
    END

#Scheme18
Retrieve Rate Given To A Customer
    [Arguments]    ${rate}
    ${rate}    Evaluate    int(${rate})
    @{params}    Create List
    @{params}    getCustomerWithRate    ${rate}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer}=    Set Variable    ${params}[0]
            ${rate}=    Set Variable    ${params}[1]
            ${BilledQtyFromPreCal}=    Set Variable    ${params}[2]
            ${customer}    Convert To String    ${customer}
            Set Global Variable    ${rate}
            Set Global Variable    ${customer}
            Set Global Variable    ${BilledQtyFromPreCal}
            Log    message: ${customer}, ${rate}, ${BilledQtyFromPreCal}
            Log To File    Customer: ${customer}, Rate: ${rate}, BilledQtyFromPrecal: ${BilledQtyFromPreCal}
    END

#Scheme19
Retrieve Target Quantiy And Rate given To Customer
    [Arguments]    ${targetQty}
    ${targetQty}    Evaluate    int(${targetQty})
    @{params}    Create List
    @{Params2}    Create List
    @{params}    getTragetQuantityFromUploadedFile    ${targetQty}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer}=    Set Variable    ${params}[0]
            ${TargetQty}=    Set Variable    ${params}[1]
            # ${customer}    Convert To String    ${customer}
            Set Global Variable    ${customer}
            Set Global Variable    ${TargetQty}
            Log    message: ${customer}, ${TargetQty}
            Log To File    Customer: ${customer}, TargetQty: ${TargetQty}
    END
    @{Params2}    getRateGivenToCustomer2    ${customer}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${customer_value}    Get From List    ${Params2}    0
        # ${customer_value}=    Set Variable    ${params}[0]
        ${ratefromprecal}    Get From List    ${Params2}    1
        Set Global Variable    ${ratefromprecal}          
        Log    message: ${customer_value}, ${ratefromprecal}
        Log To File    Customer: ${customer_value}, Rate: ${ratefromprecal}
    END

#Scheme20
Retrive Target And Rate Given To A Customer
    [Arguments]    ${rate}
    ${rate}    Evaluate    int(${rate})
    @{params}    Create List
    @{params}    getTargetAndRate    ${rate}    ${SchemeNumber}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer}=    Set Variable    ${params}[0]
            ${rate}=    Set Variable    ${params}[1]
            ${target}=    Set Variable    ${params}[2]
            ${customer}    Convert To String    ${customer}
            Set Global Variable    ${rate}
            Set Global Variable    ${customer}
            Set Global Variable    ${target}
            Log    message: ${customer}, ${rate}, ${target}
            Log To File    Customer: ${customer}, Rate: ${rate}, Target: ${target}
    ELSE
        Log    No Data Found
        Pass Execution    No Data Found
    END
    ${NumberOfDaysInAMonth}    days_in_two_months_ago
    Set Global Variable    ${NumberOfDaysInAMonth}

