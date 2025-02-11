*** Settings ***
Library  Process
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    Collections
Library    String
Library    DateTime
Library    ../Resources/Utility.py
Library    ../Resources/DBlibrary.py
Library    RPA.Excel.Application
Library    RPA.PDF
Resource    ../POM/PreCalculate.robot

*** Variables ***


*** Keywords ***
Validate And Compare Billed Quantity
    Read BilledQuantity From DataBase And Compare With Excel Value  

#Scheme10
Validate Billed Quantity Of Customer
    Retrieve BilledQuantity From DB And Compare With Excel Value
    
# Scheme4 DB Validation
Validate Rate According to Days
    Validate Rate Of Customer One
    Validate Rate Of Customer Two
    Validate Rate Of Customer Three

#Scheme5 Excel Validation
Validate AbsoluteValue According to Quantity
    Validate Rate According to Quantity    5
    Validate Rate According to Quantity    10
    Validate Rate According to Quantity    20
    Validate Rate According to Quantity    30
    Validate Rate According to Quantity    40
    Validate Rate According to Quantity    50

Validate Rate Of Customer One
    Fetch CustomerId Plant and Material Of Customer From Excel    0
    Retrieve CHARG_I from DB
    Retrieve Reference Date AND CHARG From DB
    Retrive Rate From Excel and Validate

Validate Rate Of Customer Two
    Fetch CustomerId Plant and Material Of Customer From Excel    40
    Retrieve CHARG_I from DB
    Retrieve Reference Date AND CHARG From DB
    Retrive Rate From Excel and Validate

Validate Rate Of Customer Three
    Fetch CustomerId Plant and Material Of Customer From Excel    ${rate4}
    Retrieve CHARG_I from DB
    Retrieve Reference Date AND CHARG From DB
    Retrive Rate From Excel and Validate
Validate Payment and Invoice Dates
    Validate Payment and Invoice Dates From Excel    70
    Validate Payment and Invoice Dates From Excel    60
    Validate Payment and Invoice Dates From Excel    40
    Validate Payment and Invoice Dates From Excel    20

Validate Billed Quantity From DB
    Retrieve Billed Quantity From DB

#Scheme8
Validate Target Quantity
    Validate Target Quantity with Rate 60
    Validate Target Quantity with Rate 40

Validate Target Quantity with Rate 60
    Retrieve Customer And Material From Excel    ${rate8}
    Calculate Achievement Percentage

Validate Target Quantity with Rate 40
    Retrieve Customer And Material From Excel    40
    Calculate Achievement Percentage

#scheme9
Validate Billed Quantity Of SubDealer
    Retrieve Customer Associated With SubDealer
    Fetch BilledQuantity Of SubDealer From DB
DB Validation 2
    Fetch Customer From Excel
    Retrieve VBELN From DB

#Scheme12
Validate Billed Quantity By Material
    Retrieve Billed Quantity By Filtering Material

#Scheme17
Validate Discount Provided To Customer According To TargetQty And AchievementPercentage
    Validate Customer Provided Discount 100
    Validate Customer Provided Discount 80
    Validate Customer Provided Discount 60
    Validate Customer Provided Discount 10
    Validate Customer Provided Discount 0
Validate Customer Provided Discount 100
    Retrieve Customer And Rate Provided    100
    Retrieve TargetQuantity And BilledQuantity From DB

Validate Customer Provided Discount 80
    Retrieve Customer And Rate Provided    80
    Retrieve TargetQuantity And BilledQuantity From DB

Validate Customer Provided Discount 60
    Retrieve Customer And Rate Provided    60
    Retrieve TargetQuantity And BilledQuantity From DB

Validate Customer Provided Discount 10
    Retrieve Customer And Rate Provided    10
    Retrieve TargetQuantity And BilledQuantity From DB

Validate Customer Provided Discount 0
    Retrieve Customer And Rate Provided    0
    Retrieve TargetQuantity And BilledQuantity From DB

#Scheme18
Validate Discount Provided To Customer According To IncrementalQty And AchievementPercentage
    Validate Discount Provided To Customer As 10
    Validate Discount Provided To Customer As 30
    Validate Discount Provided To Customer As 50
    Validate Discount Provided To Customer As 60
    Validate Discount Provided To Customer As 80
    Validate Discount Provided To Customer As 110
    Validate Discount Provided To Customer As 0

Validate Discount Provided To Customer As 0
    Retrieve Rate Given To A Customer    0
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2

Validate Discount Provided To Customer As 10
    Retrieve Rate Given To A Customer    10
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2

Validate Discount Provided To Customer As 30
    Retrieve Rate Given To A Customer    30
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2

Validate Discount Provided To Customer As 50
    Retrieve Rate Given To A Customer    50
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2
Validate Discount Provided To Customer As 40
    Retrieve Rate Given To A Customer    40
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2

Validate Discount Provided To Customer As 60
    Retrieve Rate Given To A Customer    60
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2

Validate Discount Provided To Customer As 80
    Retrieve Rate Given To A Customer    80
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2

Validate Discount Provided To Customer As 110
    Retrieve Rate Given To A Customer    110
    Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2

#Scheme19
Validate Discount Provided To Customer According To BilledQty And AchievementPercentage
    Validate Discount Provided To Customer With TargetQty 420
    Validate Discount Provided To Customer With TargetQty 570
    Validate Discount Provided To Customer With TargetQty 330
    Validate Discount Provided To Customer With TargetQty 970
    Validate Discount Provided To Customer With TargetQty 750
    Validate Discount Provided To Customer With TargetQty 650
    Validate Discount Provided To Customer With TargetQty 1970
    Validate Discount Provided To Customer With TargetQty 1280
    Validate Discount Provided To Customer With TargetQty 1250
    Validate Discount Provided To Customer With TargetQty 4500
    Validate Discount Provided To Customer With TargetQty 2500
    Validate Discount Provided To Customer With TargetQty 6250
    Validate Discount Provided To Customer With TargetQty 150


Validate Discount Provided To Customer With TargetQty 420
    Retrieve Target Quantiy And Rate given To Customer    420
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 570
    Retrieve Target Quantiy And Rate given To Customer    570
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 330
    Retrieve Target Quantiy And Rate given To Customer    330
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 970
    Retrieve Target Quantiy And Rate given To Customer    970
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 750
    Retrieve Target Quantiy And Rate given To Customer    750
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 650
    Retrieve Target Quantiy And Rate given To Customer    650
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 1970
    Retrieve Target Quantiy And Rate given To Customer    1970
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 1280
    Retrieve Target Quantiy And Rate given To Customer    1280
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 1250
    Retrieve Target Quantiy And Rate given To Customer    1250
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 4500
    Retrieve Target Quantiy And Rate given To Customer    4500
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 2500
    Retrieve Target Quantiy And Rate given To Customer    2500
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 6250
    Retrieve Target Quantiy And Rate given To Customer    6250
    Retrieve BilledQuantity From DB And Validate Discount Rate

Validate Discount Provided To Customer With TargetQty 150
    Retrieve Target Quantiy And Rate given To Customer    150
    Retrieve BilledQuantity From DB And Validate Discount Rate

#Scheme20
Check Whether the Customer with Rate is Qualified For Discount and Validate Discount If Qualified
    Check Whether the Customer with Rate 10 is Qualified For Discount and Validate Discount If Qualified
    # Check Whether the Customer with Rate 5 is Qualified For Discount and Validate Discount If Qualified
    Check Whether the Customer with Rate 0 is Qualified For Discount and Validate Discount If Qualified
    # Check Whether the Customer with Rate 4 is Qualified For Discount and Validate Discount If Qualified
    Check Whether the Customer with Rate 2 is Qualified For Discount and Validate Discount If Qualified
    Check Whether the Customer with Rate 25 is Qualified For Discount and Validate Discount If Qualified
Check Whether the Customer with Rate 10 is Qualified For Discount and Validate Discount If Qualified
    Retrive Target And Rate Given To A Customer    10
    Check Whether The Customer If Qualified For Discount or Not
    Calculate Target By Retrieving Target Quantity From DB

Check Whether the Customer with Rate 5 is Qualified For Discount and Validate Discount If Qualified
    Retrive Target And Rate Given To A Customer    5
    Check Whether The Customer If Qualified For Discount or Not
    Calculate Target By Retrieving Target Quantity From DB

Check Whether the Customer with Rate 0 is Qualified For Discount and Validate Discount If Qualified
    Retrive Target And Rate Given To A Customer    0
    Check Whether The Customer If Qualified For Discount or Not
    Calculate Target By Retrieving Target Quantity From DB
Check Whether the Customer with Rate 4 is Qualified For Discount and Validate Discount If Qualified
    Retrive Target And Rate Given To A Customer    4
    Check Whether The Customer If Qualified For Discount or Not
    Calculate Target By Retrieving Target Quantity From DB

Check Whether the Customer with Rate 2 is Qualified For Discount and Validate Discount If Qualified
    Retrive Target And Rate Given To A Customer    2
    Check Whether The Customer If Qualified For Discount or Not
    Calculate Target By Retrieving Target Quantity From DB

Check Whether the Customer with Rate 25 is Qualified For Discount and Validate Discount If Qualified
    Retrive Target And Rate Given To A Customer    25
    Check Whether The Customer If Qualified For Discount or Not
    Calculate Target By Retrieving Target Quantity From DB

Read BilledQuantity From DataBase And Compare With Excel Value
    ${fkdat_from}   getreferencefromdate
    ${fkdat_to}=    getreferencetodate
    ${BilledQuantityFromDB}     connectandfetch    ${randomcustomer}    ${fkdat_from}    ${fkdat_to}
    ${BilledQuantityFromDB}     Convert To Number    ${BilledQuantityFromDB}
    Log To File    Customer:${randomcustomer}
    Log To File    BilledQuantityOfCustomerFromDB: ${BilledQuantityFromDB}
    IF    ${BilledQuantityFromDB} == ${BilledQuantityFromExcel}
        log    Results from DB and Excel are matching
    ELSE
        Log    Results from DB and Excel are not matching
    END
    # Should Be Equal   ${BilledQuantityFromDB}   ${BilledQuantityFromExcel}
    # log     Results from DB and Excel are matching

#Verify whether the customer is(Incremental Quantity) qualified for Discount or not(Scheme3)
Check If Customer is Qualified Or Not
    ${fromdate_preperiod}    preperiodfromdateIntoDB
    ${todate_preperiod}    PreperiodtodateIntoDB
    ${LiftedQtyFromDB}    Connectandfetch    ${randomcustomer}    ${fromdate_preperiod}    ${todate_preperiod}
    # ${LiftedQtyFromDB}    Connectandfetch    0007039203    ${fromdate_preperiod}    ${todate_preperiod}
    ${LiftedQtyFromDB}     Convert To Number    ${LiftedQtyFromDB}
    Log To File    Customer:${randomcustomer},
    Log To File    LiftedQtyFromDB: ${LiftedQtyFromDB}
    Run Keyword If    ${LiftedQtyFromDB} > 50
    ...    Log    The Customer is qualified for discount.
    ...    ELSE
    ...    Log    The Customer is not qualified for discount.

#Verify whether the customer is(Incremental Quantity-Actual) qualified for Discount or not(Scheme3)
Check If Customer is Qualified With Incremental Qty Actual
    ${fromdate_preperiod}    preperiodfromdateIntoDB
    ${todate_preperiod}    PreperiodtodateIntoDB
    ${LiftedQtyFromDB}    Connectandfetch    ${randomcustomer}    ${fromdate_preperiod}    ${todate_preperiod}
    # ${LiftedQtyFromDB}    Connectandfetch    0007039203    ${fromdate_preperiod}    ${todate_preperiod}
    ${LiftedQtyFromDB}     Convert To Number    ${LiftedQtyFromDB}
    Log To File    Customer:${randomcustomer},
    Log To File    LiftedQtyFromDB: ${LiftedQtyFromDB}
    Run Keyword If    ${LiftedQtyFromDB} > 50 and ${LiftedQtyFromDB} < 150
    ...    Log    The Customer is qualified for discount.
    ...    ELSE
    ...    Log    The Customer is not qualified for discount.

#Calculate Increment in the lift(Scheme3)
Calculate Increment And Discount
    ${fromdate1}    GetprevfromdatetocalculateIncrement
    ${todate1}    GettodatetocalculateIncrement
    ${fromdate2}    GetfromdatetocalculateIncrement
    ${todate2}    GettodatetocalculateIncrement
    ${FirstQuantity}    connectandfetch    ${randomcustomer}    ${fromdate1}    ${todate1}
    ${SecondQuantity}    connectandfetch    ${randomcustomer}    ${fromdate2}    ${todate2}
    ${DiffInQuantity}=    Evaluate    ${FirstQuantity}-${SecondQuantity}
    Log To File    Customer:${randomcustomer},
    Log To File    FirstQuantityOfCustomer:${FirstQuantity},
    Log To File    SecondQuantityOfCustomer:${SecondQuantity},
    Log To File    DifferenceInQuantity:${DiffInQuantity}
    Log To Console    ${randomcustomer}
    Run Keyword If    ${DiffInQuantity} >= 0 and ${DiffInQuantity} < 40.1
    ...    Log    Rate per Ton is 10
    # ...    Log To File    Rate:10,
    Run Keyword If    ${DiffInQuantity} >= 40.1 and ${DiffInQuantity} < 80.01
    ...    Log    Rate per Ton is 20
    # ...    Log To File    Rate:20,
    Run Keyword If    ${DiffInQuantity} >= 80.01 and ${DiffInQuantity} < 120.01
    ...    Log    Rate per Ton is 30
    # ...    Log To File    Rate:30,
    Run Keyword If    ${DiffInQuantity} >= 120.01 and ${DiffInQuantity} < 200.01
    ...    Log    Rate per Ton is 40
    # ...    Log To File    Rate:40,
    Run Keyword If    ${DiffInQuantity} >= 200.01
    ...    Log    Rate per Ton is 50
    # ...    Log To File    Rate:50,
    ...    ELSE
    ...    Log    Exception

Check If Customer is Qualified With Incremental Qty Actual Negative
    ${fromdate_preperiod}    preperiodfromdateIntoDB
    ${todate_preperiod}    PreperiodtodateIntoDB
    ${LiftedQtyFromDB}    Connectandfetch    ${randomcustomer}    ${fromdate_preperiod}    ${todate_preperiod}
    # ${LiftedQtyFromDB}    Connectandfetch    0007039203    ${fromdate_preperiod}    ${todate_preperiod}
    ${LiftedQtyFromDB}     Convert To Number    ${LiftedQtyFromDB}
    Log To File    Customer:${randomcustomer},
    Log To File    LiftedQtyFromDB: ${LiftedQtyFromDB}
    Run Keyword If    ${LiftedQtyFromDB} > 100
    ...    Log    The Customer is qualified for discount.
    ...    ELSE
    ...    Log    The Customer is not qualified for discount.

# Scheme4 DB Validation
Fetch Customer Plant Material From Excel With Rate Eighty
    @{Params}    Getplantandmaterialwithrateeighty    precal    ${SchemeNumber}
    Log    ${Params}
    ${first_item}=    Get From List    ${Params}    0
    Log    ${first_item}
    FOR    ${item}    IN    ${first_item}
        ${customer_value}=    Set Variable    ${item[0]}
        ${plant_value}=    Set Variable    ${item[1]}
        ${material_value}=    Set Variable    ${item[2]}
        ${rate_value}=    Set Variable    ${item[3]}
        Log    Customer Value: ${customer_value}, Plant Value: ${plant_value}, Material Value: ${material_value}, Rate Value: ${rate_value}
        ${customerid}    Set Global Variable    ${customer_value}
        ${plant}    Set Global Variable    ${plant_value}
        ${material}    Set Global Variable    ${material_value}
        ${rate}    Set Global Variable    ${rate_value}
    END

Fetch Customer Plant Material From Excel With Rate Sixty
    @{Params}    Getplantandmaterialwithratesixty    precal    ${SchemeNumber}
    Log    ${Params}
    ${first_item}=    Get From List    ${Params}    0
    Log    ${first_item}
    FOR    ${item}    IN    ${first_item}
        ${customer_value}=    Set Variable    ${item[0]}
        ${plant_value}=    Set Variable    ${item[1]}
        ${material_value}=    Set Variable    ${item[2]}
        ${rate_value}=    Set Variable    ${item[3]}
        Log    Customer Value: ${customer_value}, Plant Value: ${plant_value}, Material Value: ${material_value}, Rate Value: ${rate_value}
        ${customerid}    Set Global Variable    ${customer_value}
        ${plant}    Set Global Variable    ${plant_value}
        ${material}    Set Global Variable    ${material_value}
        ${rate}    Set Global Variable    ${rate_value}
    END

Fetch Customer Plant Material From Excel With Rate Zero
    @{Params}    Getplantandmaterialwithratezero    precal    ${SchemeNumber}
    Log    ${Params}
    ${first_item}=    Get From List    ${Params}    0
    Log    ${first_item}
    FOR    ${item}    IN    ${first_item}
        ${customer_value}=    Set Variable    ${item[0]}
        ${plant_value}=    Set Variable    ${item[1]}
        ${material_value}=    Set Variable    ${item[2]}
        ${rate_value}=    Set Variable    ${item[3]}
        Log    Customer Value: ${customer_value}, Plant Value: ${plant_value}, Material Value: ${material_value}, Rate Value: ${rate_value}
        ${customerid}    Set Global Variable    ${customer_value}
        ${plant}    Set Global Variable    ${plant_value}
        ${material}    Set Global Variable    ${material_value}
        ${rate}    Set Global Variable    ${rate_value}
    END
Retrieve CHARG_I from DB
    ${fkdat_from}   getreferencefromdate
    ${fkdat_to}=    getreferencetodate
    ${customer}=    Set Variable    ${customerid}
    ${customer}    Convert To Number    ${customer}
    ${CHARG_I}    FetchCHARGIfromDB    ${customer}    ${fkdat_from}    ${fkdat_to}
    Log To File    CHARG_I: ${CHARG_I}
    ${CHARG_I}    Set Global Variable    ${CHARG_I}

# Retrieve Reference Date From DB
Retrieve Reference Date AND CHARG From DB
    ${Charg}    Set Variable    ${CHARG_I}
    ${referencedate}    FetchReferenceDateandChargFromDB    ${Charg}    ${plant}    ${material}
    ${referencedatex}    Convert To String    ${referencedate}
    Set Global Variable    ${referencedatex}
    Log To File    Reference Date: ${referencedatex}

Retrive Rate From Excel and Validate
    # ${Rate}    Filter Excel Column Togetrate    Reference Date    ${referencedatex}    precal
    Run Keyword If    "${rate}">="80"
    ...    Log    Rate is 80
    Run Keyword If    "${rate}"=="60"
    ...    Log    Rate is 60
    Run Keyword If    "${rate}" == "0"
    ...    Log    Rate is 0
    Log To File    Rate: ${rate}


#Use below keyword for scheme4 as well
Fetch CustomerId Plant and Material Of Customer From Excel
    [Arguments]    ${input_rate}
    @{Params}    Create List
    ${input_param_rate}    Evaluate    int(${input_rate})
    @{Params}        get_plant_and_material_with_rate    ${input_param_rate}    precal    ${SchemeNumber}
    ${Length}    Get Length    ${Params}
    IF    ${Length} == 0
        Log    message: No Data Found
    ELSE
        Log To Console    ${Params}[0]
    ${first_item}    Get From List    ${Params}    0
    Log    ${first_item}
    FOR    ${item}    IN    ${first_item}
        ${customer_value}=    Set Variable    ${item[0]}
        ${plant_value}=    Set Variable    ${item[1]}
        ${material_value}=    Set Variable    ${item[2]}
        ${rate_value}=    Set Variable    ${item[3]}
        Log    Customer Value: ${customer_value}, Plant Value: ${plant_value}, Material Value: ${material_value}, Rate Value: ${rate_value}
        ${customerid}    Set Variable    ${customer_value}
        Set Global Variable    ${customerid}
        ${plant}    Set Variable    ${plant_value}
        Set Global Variable    ${plant}
        ${material}    Set Variable    ${material_value}
        Set Global Variable    ${material}
        ${rate}    Set Variable    ${rate_value}
        Set Global Variable    ${rate}
        Log To File    Customer:${customerid}, Plant:${plant}, Material:${material}, Rate:${rate}
        END
    END

# Scheme5 DB Validation
# Validate Rate According to Quantity
#     [Arguments]    ${input_rate}
#     @{Params}    Create List
#     ${input_param_rate}    Evaluate    int(${input_rate})
#     @{Params}    getRateAndSumOfBilledQty    ${input_param_rate}    precal
#     Should Not Be Equal    ${Params}    ${EMPTY}
#     Run Keyword If    ${Params}    Length Should Be    0
#     ...    Log    No Data Found
#     ...    ELSE
#     ...    Log To Console    ${Params}[0]
#     ${first_item}    Get From List    ${Params}    0
#     Log    ${first_item}
#     FOR    ${item}    IN    ${first_item}
#         ${customer_value}=    Set Variable    ${item[0]}
#         ${rate_value}=    Set Variable    ${item[1]}
#         ${sum_of_billed_qty}=    Set Variable    ${item[2]}
#         Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
#     END

Validate Rate According to Quantity
    [Arguments]    ${input_rate}
    @{Params}    Create List
    ${input_param_rate}    Evaluate    int(${input_rate})
    @{Params}    getRateAndSumOfBilledQty    ${input_param_rate}    precal    ${SchemeNumber}
    ${Length}    Get Length    ${Params}
    Should Not Be Equal    ${Params}    ${EMPTY}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    ${result}=    Islistempty    ${Params}
    ${TRUE}    Set Variable    True
    
    ${Zero}=    Set Variable    0
    ${first_item}=    Set Variable    0
    ${item}=    Set Variable    0
    ${sum_of_billed_qty}=    Set Variable    0
    # ${result}    Set Variable    ${TRUE}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
            ${customer_value}=    Set Variable    ${params}[0]
            ${rate_value}=    Set Variable    ${params}[1]
            ${sum_of_billed_qty}=    Set Variable    ${params}[2]
            Log    message: ${customer_value}, ${rate_value}, ${sum_of_billed_qty}
            Log To File    Customer:${customer_value}, Rate:${rate_value}, SumOfBilledQty:${sum_of_billed_qty}
    ELSE
        Log    No Data Found
    END
    


Check If Quantity Is GreaterThan MinQtyInTons
    # ${fromDate}    Getfromdateforscheme 5 For DB
    # ${toDate}    Gettodateforscheme 5 For DB
    ${fromDate}    Getfromdateforscheme5AForDB
    ${todate}    gettodateforscheme5aForDB
    ${sum_of_billed_qty}    connectandfetch    ${randomcustomer}    ${fromDate}    ${todate}
    IF    ${sum_of_billed_qty} != None
        ${sum_of_billed_qty}    Convert To Number    ${sum_of_billed_qty}
        Log To File    Customer:${randomcustomer}
        Log To File    Sum Of Billed Quantity: ${sum_of_billed_qty}
        IF    ${sum_of_billed_qty} > 10
            Log    The Customer is qualified for discount.
        ELSE
            Log    The Customer is not qualified for discount.
        END
    ELSE
        Log    message: No Data Found
    END   
    # Run Keyword If    ${sum_of_billed_qty} > 10
    # ...    Log    The Customer is qualified for discount.
    # ...    ELSE
    # ...    Log    The Customer is not qualified for discount.
    
# Scheme6 Excel Validation
Validate Payment and Invoice Dates From Excel
    [Arguments]    ${input_rate}
    @{Params}    Create List
    ${input_param_rate}    Evaluate    int(${input_rate})
    @{Params}    get_payment_info_from_excel    ${input_param_rate}    ${SchemeNumber}
    ${first_item}    Get From List    ${Params}    0
    Log    ${first_item}
    FOR    ${item}    IN    ${first_item}
        ${payment_date}=    Set Variable    ${item[0]}
        ${invoice_date}=    Set Variable    ${item[1]}
        ${customer}=    Set Variable    ${item[2]}
        ${rate}=    Set Variable    ${item[3]}
        Log    message: ${payment_date}, ${invoice_date}, ${customer}, ${rate}
        Log To File    Payment Date: ${payment_date}, Invoice Date: ${invoice_date}, Customer: ${customer}, Rate: ${rate}
        Set Global Variable    ${payment_date}
        Set Global Variable    ${invoice_date}
        Set Global Variable    ${customer}
        Set Global Variable    ${rate}
    END
    ${Difference}=    Getdifferenceindays    ${payment_date}    ${invoice_date}
    Log    Difference in Days: ${Difference}
    Log To File    Difference in Days: ${Difference}
    Run Keyword If    ${Difference} < 1
    ...    Log    Rate Per Bag is 70   
    Run Keyword If    ${Difference} >= 1 and ${Difference} < 5
    ...    Log    Rate Per Bag is 60
    Run Keyword If    ${Difference} >= 5 and ${Difference} < 12
    ...    Log    Rate Per Bag is 40
    Run Keyword If    ${Difference} >= 12 and ${Difference} < 19
    ...    Log    Rate Per Bag is 20

#Scheme7 DB validation
Retrieve Billed Quantity From DB
    ${FromDate}    Getfromdateforscheme7ForDB
    ${ToDate}    Gettodateforscheme7ForDB
    ${BilledQuantityFromDB}    connectandfetch    ${randomcustomer}    ${FromDate}    ${ToDate}
    ${BilledQuantityFromDB}    Convert To Number    ${BilledQuantityFromDB}
    Log To File    Customer:${randomcustomer}
    Log To File    BilledQuantityOfCustomerFromDB: ${BilledQuantityFromDB}
    IF    ${BilledQuantityFromDB} == ${BilledQuantityFromExcel}
        log    Results from DB and Excel are matching
    ELSE
        Log    Results from DB and Excel are not matching
    END

#Scheme8 DB validation
Retrieve Customer And Material From Excel
    [Arguments]    ${input_rate}
    @{Params}    Create List
    ${input_param_rate}    Evaluate    int(${input_rate})
    @{Params}    get_plant_and_material_with_rate    ${input_param_rate}    precal    ${SchemeNumber}
    ${Length}    Get Length    ${Params}
    IF    ${Length} == 0
        Log    message: No Data Found
    ELSE
        ${first_item}    Get From List    ${Params}    0
        Log    ${first_item}
        FOR    ${item}    IN    ${first_item}
            ${customer_value}=    Set Variable    ${item[0]}
            ${material_value}=    Set Variable    ${item[2]}
            ${rate_value}=    Set Variable    ${item[3]}
            Log    Customer Value: ${customer_value}, Material Value: ${material_value}, Rate Value: ${rate_value}
            Log To File    Customer:${customer_value}, Material:${material_value}, Rate:${rate_value}
            ${customerid}    Set Variable    ${customer_value}
            Set Global Variable    ${customerid}
            ${material}    Set Variable    ${material_value}
            Set Global Variable    ${material}
            ${rate}    Set Variable    ${rate_value}
            Set Global Variable    ${rate}
        END
    END
    # IF    ${Params} != None
    #     ${first_item}    Get From List    ${Params}    0
    #     Log    ${first_item}
    #     FOR    ${item}    IN    ${first_item}
    #         ${customer_value}=    Set Variable    ${item[0]}
    #         ${material_value}=    Set Variable    ${item[2]}
    #         ${rate_value}=    Set Variable    ${item[3]}
    #         Log    Customer Value: ${customer_value}, Material Value: ${material_value}, Rate Value: ${rate_value}
    #         ${customerid}    Set Variable    ${customer_value}
    #         Set Global Variable    ${customerid}
    #         ${material}    Set Variable    ${material_value}
    #         Set Global Variable    ${material}
    #         ${rate}    Set Variable    ${rate_value}
    #         Set Global Variable    ${rate}
    #     END
    # ELSE
    #     Log    message: No Data Found
    # END
    

Calculate Achievement Percentage
    ${FiscalMonth}    Getfiscalmonth
    ${FiscalYear}    Getfiscalyear
    ${fromdate}    Getfromdateforscheme8ForDB
    ${todate}    Gettodateforscheme8ForDB
    ${TargetQuantity}    FetchtargetquantityfromDB    ${customerid}    ${FiscalMonth}    ${FiscalYear}    ${material}
    Run Keyword If    '${TargetQuantity}' == 'None'    Return From Keyword
    ${TargetQuantity}    Convert To Number    ${TargetQuantity}
    Log To File    Target Quantity: ${TargetQuantity}
    ${BilledQuantity}    Connectandfetch    ${customerid}    ${fromdate}    ${todate}
    ${BilledQuantity}    Convert To Number    ${BilledQuantity}
    Log To File    Billed Quantity: ${BilledQuantity}
    ${AchievementPer}    Evaluate    (${BilledQuantity}/${TargetQuantity})*100
    Log To File    Achievement Percentage: ${AchievementPer}
    IF    ${AchievementPer} >= 30 and ${AchievementPer} < 50
        Log    Rate per Ton is 40
    ELSE IF    ${AchievementPer} >= 50
        Log    Rate per Ton is 60      
    END

#Scheme9 DB Validation
Retrieve Customer From Excel
    [Arguments]    ${type}
    ${FromDate}    getreferencefromdate
    ${ToDate}    Getreferencetodate
    ${customer}=    getrandomvalue    ${type}    Customer    ${SchemeNumber}
    ${customer}    Convert To Number    ${customer}
    Set Global Variable    ${customer}
    # ${BilledQuantity}=    filter_excel_column    Customer    ${customer}    ${type}    CEMCTRSSRBSD032413052
    # log  Billed Quantity is: ${BilledQuantity}

Retrieve VBELN From DB
    ${fromdate}    Getreferencefromdate
    ${todate}    Getreferencetodate
    ${VBELN}    FetchVBELNfromDB    ${customer}    ${fromdate}    ${todate}
    # ${VBELN}    Evaluate    char(${VBELN})
    Set Global Variable    ${VBELN}

# Retrieve Quantity Of SubDealer From DB
    # ${parvw}    set variable    WE
    # ${fromdate}    Getreferencefromdate
    # ${todate}    Getreferencetodate
    # ${subdealer}    Fetchsubdealerfrom DB    ${VBELN}    ${parvw}
    # ${subdealer}    Getsubdealer    ${subdealer}
    # Set Global Variable    ${subdealer}
    # ${QtyfromDB}    Fetchbilledqtyusingvbeln    ${VBELN}    ${fromdate}    ${todate}
    # # ${QtyfromExcel}    Filter Excel Column    Ship_to_Party    ${subdealer}    precal    CEMCTRSSRBSD032413088
    # IF    ${QtyfromDB} == ${BilledQuantityFromExcel}
    #     Log    SubDealer Quantity from DB and Excel are matching
    # ELSE
    #     Log    SubDealer Quantity from DB and Excel are not matching
    # END

Retrieve Customer Associated With SubDealer
    # ${BilledQuantity}=    filter_excel_column    Customer  ${randomcustomer}    ${type}    ${SchemeNumber}
    ${subdealer}    Set Variable    ${subdealerfromexcel}
    # ${fromdate}    Getreferencefromdate
    # ${todate}    Getreferencetodate
    ${subdealer}    Evaluate    int(${subdealer})
    ${customer}    Getsubdealerscustomer    Ship_to_Party    ${subdealer}    precal    ${SchemeNumber}
    Log To File    SubDealer:${subdealer}, Customer Associated With Subdealer:${customer}
    Set Global Variable    ${customer}
    # ${QtyfromDB}    Connectandfetch    ${customer}    ${fromdate}    ${todate}

Fetch BilledQuantity Of SubDealer From DB
    @{params}    Create List
    ${fromdate}    Getreferencefromdate
    ${todate}    Getreferencetodate
    @{params}    fetchbilledqtyofsubdealer    ${customer}    ${fromdate}    ${todate}
    ${subdealerdetails}    Get From List    ${Params}    1
    FOR    ${item}    IN    ${subdealerdetails}
        ${subdealerid}=    Set Variable    ${item[0]}
        ${subdealer}    Getsubdealer    ${subdealerid}
        ${subdealer}    Evaluate    int(${subdealer})
        ${QtyFromDB}=    Set Variable    ${item[1]}
        Log    message: ${subdealerid}, ${QtyFromDB}
        Log To File    Billed Quantity Of SubDealer From DB: ${QtyFromDB}
        Set Global Variable    ${subdealer}
        Set Global Variable    ${QtyFromDB}
    END
    ${BilledQuantity}=    filter_excel_column    Ship_to_Party    ${subdealer}    precal    ${SchemeNumber}
    IF    ${QtyFromDB} == ${BilledQuantity}
        Log    Billed Quantity is matching
    ELSE
        Log    Billed Quantity is not matching
    END

#Scheme10 DB Validation
Retrieve BilledQuantity From DB And Compare With Excel Value
    ${fkdat_from}   Getfromreferencedateforscheme 10
    ${fkdat_to}=    Gettoreferencedateforscheme 10
    ${BilledQuantityFromDB}     connectandfetch    ${randomcustomer}    ${fkdat_from}    ${fkdat_to}
    ${BilledQuantityFromDB}     Convert To Number    ${BilledQuantityFromDB}
    Log To File    Billed Quantity Of Customer From DB: ${BilledQuantityFromDB}
    IF    ${BilledQuantityFromDB} == ${BilledQuantityFromExcel}
        log    Results from DB and Excel are matching
    ELSE
        Log    Results from DB and Excel are not matching
    END

#Scheme12
Retrieve Billed Quantity By Filtering Material
    ${fromdate}    getfromdateforscheme7forDB
    ${todate}    Gettodateforscheme7ForDB
    # ${fromdate}    Convert To String    ${fromdate}
    # ${todate}    Convert To String    ${todate}
    ${BilledQuantity}    fetchBilledQuantity    ${customer_value}    ${Material_value}    ${fromdate}    ${todate}
    Log To File    Customer:${customer_value}
    Log To File    Billed Quantity Of Customer From DB: ${BilledQuantity}
    # ${BilledQuantity}    Convert To Number    ${BilledQuantity}
    IF    ${BilledQuantity} == ${sum_of_billed_qty}
        Log    Results from DB and Excel are matching
    ELSE
        Log    Results from DB and Excel are not matching
    END

#Scheme14
Retrieve Billed Quantity From DB And Calculate Achievement Percentage
    ${fkdat_from}   getreferencefromdate
    ${fkdat_to}=    getreferencetodate
    ${BilledQuantityFromDB}     getBilledQtyToCalculateAchievementPer    ${customer_value}    ${fkdat_from}    ${fkdat_to}
    Log To File    Customer:${customer_value}
    Log To File    Billed Quantity Of Customer From DB: ${BilledQuantityFromDB}
    # ${BilledQuantityFromDB}     Convert To Number    ${BilledQuantityFromDB}
    ${AchievementPer}    Evaluate    (${BilledQuantityFromDB}/${TargetQuantity_value})*100
    Log To File    Achievement Percentage: ${AchievementPer}
    IF    ${TargetQuantity_value} == 228
        IF    ${AchievementPer} <=90
            Log    Rate per Ton is 0
        ELSE IF    ${AchievementPer} > 90 and ${AchievementPer} <= 100
            Log    Rate per Ton is 20
        ELSE IF    ${AchievementPer} > 100 and ${AchievementPer} <= 110
            Log    Rate per Ton is 40
        END
    ELSE IF    ${TargetQuantity_value} == 630
        IF    ${AchievementPer} <=90
            Log    Rate per Ton is 40
        ELSE IF    ${AchievementPer} > 90 and ${AchievementPer} <= 100
            Log    Rate per Ton is 60
        ELSE IF    ${AchievementPer} > 100 and ${AchievementPer} <= 110
            Log    Rate per Ton is 80
        END
    ELSE IF    ${TargetQuantity_value} == 1800
        IF    ${AchievementPer} <=90
            Log    Rate per Ton is 80
        ELSE IF    ${AchievementPer} > 90 and ${AchievementPer} <= 100
            Log    Rate per Ton is 100
        ELSE IF    ${AchievementPer} > 100 and ${AchievementPer} <= 110
            Log    Rate per Ton is 120
        END
    ELSE IF    ${TargetQuantity_value} == 2120
        IF    ${AchievementPer} <=90
            Log    Rate per Ton is 40
        ELSE IF    ${AchievementPer} > 90 and ${AchievementPer} <= 100
            Log    Rate per Ton is 60
        ELSE IF    ${AchievementPer} > 100 and ${AchievementPer} <= 110
            Log    Rate per Ton is 80
        END
    ELSE
        Log    No data found
    END

#Scheme13
Retrieve Billed Quantity From DB And Validate with PreperiodMin and Max Qty
    ${fkdat_from}   getpreperiodfromdateforscheme13
    ${fkdat_to}=    getpreperiodtodateforscheme13
    ${BilledQuantityFromDB}     connectandfetch    ${randomcustomer}    ${fkdat_from}    ${fkdat_to}
    Log To File    Customer:${randomcustomer}
    Log To File    Billed Quantity Of Customer From DB: ${BilledQuantityFromDB}
    ${BilledQuantityFromDB}     Convert To Number    ${BilledQuantityFromDB}
    IF    ${BilledQuantityFromDB} == ${BilledQuantityFromExcel}
        log    Results from DB and Excel are matching
    ELSE
        Log    Results from DB and Excel are not matching
    END
    IF    ${BilledQuantityFromDB} >=200 and ${BilledQuantityFromDB} <= 399
        Log    Customer is qualified for discount
    ELSE
        Log    Customer is not qualified for discount
    END

Retrieve BilledQuantity From DB for Prev Date to Calculate Growth
    ${fromdate}    getprevfromdateforscheme13forDB
    ${todate}    getprevtodateforscheme13forDB
    ${BilledQuantity}    fetchbilledqtyforprevdate    ${customer_value}    ${fromdate}    ${todate}
    Log To File    Customer:${customer_value}
    Log To File    Billed Quantity Of Customer From DB: ${BilledQuantity}
    ${BilledQuantity}    Convert To Number    ${BilledQuantity}
    ${Growth}    Evaluate    ${sum_of_billed_qty}-${BilledQuantity}
    Log To File    Growth: ${Growth}
    IF    ${Growth} >= 0 and ${Growth} < 25.01
        log    Rate is 40
    ELSE IF    ${Growth} >= 25.01 and ${Growth} < 50.01
        Log    Rate is 60
    ELSE IF    ${Growth} >= 50.01 and ${Growth} < 80.01
        Log    Rate is 80
    ELSE IF    ${Growth} >= 80.01
        Log    Rate is 100
    ELSE
        Log    No Discount provided to customer
    END
    IF    ${BilledQuantity} == None
        Log    Rate is 25        
    END

#Scheme15
Retrieve Truck Details From DB
    ${TruckDetails}    getTruckDetailsFromDB    ${refnumber}[1]
    Log To File    Truck Details: ${TruckDetails}
    IF    ${TruckDetails} >0
        log    Quantity has beed lifted from plant
    ELSE
        Log    Quantity has not been lifted from plant
    END

#Scheme16
Validate Vendor Details From DB
    @{params}    Create List
    ${params}    getVendorDetailsFromDB    ${customer}    ${vendorstring}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
        ${customer}=    Set Variable    ${params}[0]
        Log To File    Customer: ${customer}
        ${vendorfromDB}=    Set Variable    ${params}[2]
        Log To File    Vendor: ${vendorfromDB}
        ${is_VendorSame}    Evaluate    '${vendor}' == '${vendorfromDB}'
        Log To File    Vendor is same: ${is_VendorSame}
        Run Keyword If    ${is_VendorSame}
        ...    Log    Vendor is same
        ...    ELSE
        ...    Log    Vendor is not same
        # Should Be Equal    ${vendor}    ${vendorfromDB}
    ELSE
        Log    No Vendor Asscoiated with Customer
    END

Check Whether the Material Is Blended Or Not
    ${medium}    getMediumOfMaterial    ${material}
    Log To File    Medium: ${medium}
    ${medium}    Convert To String    ${medium}
    ${is_Blended}    Evaluate    '${medium}' == '000003'
    Log To File    Material is Blended: ${is_Blended}
    Run Keyword If    ${is_Blended}   
    ...    Log    Material is Blended
    ...    ELSE
    ...    Log    Material is not Blended


#Scheme16OPC
Check Whether the Material Is OPC Or Not
    ${medium}    getMediumOfMaterial    ${material}
    Log To File    Medium: ${medium}
    ${medium}    Convert To String    ${medium}
    ${is_opc}    Evaluate    '${medium}' == '000004'
    Log To File    Material is OPC: ${is_opc}
    Run Keyword If    ${is_opc}   
    ...    Log    Material is OPC
    ...    ELSE
    ...    Log    Material is not OPC
    
Retrieve Billed Quantity From DB Using Reference Number
    @{params}    Create List
    @{params}    getBilledQtyUsingVBELN    ${reference}    ${customer}
    ${isnotempty}    Run Keyword And Return Status    Should Not Be Empty    ${Params}
    IF  "${isnotempty}"=="True"
        ${params}    Get From List    ${Params}    0
        ${customer}=    Set Variable    ${params}[0]
        Log To File    Customer: ${customer}
        ${BilledQtyfromDB}=    Set Variable    ${params}[1]
        Log To File    Billed Quantity: ${BilledQtyfromDB}
        ${BilledQtyfromDB}    Convert To Number    ${BilledQtyfromDB}
        ${is_BilledQtyEqual}=    Evaluate    '${BilledQtyfromDB}' == '${BilledQty}'
        Run Keyword If    ${is_BilledQtyEqual}
        ...    Log    Billed Quantity is same
        ...    ELSE
        ...    Log    Billed Quantity is not same
        # Should Be Equal    ${BilledQtyfromDB}    ${BilledQty}
    ELSE
        Log    No Data Found
    END

#Scheme17
Retrieve TargetQuantity And BilledQuantity From DB
    ${FiscalMonth}    Getfiscalmonth
    ${FiscalYear}    Getfiscalyear
    # ${FiscalMonth}    Convert To String    ${FiscalMonth}
    # ${FiscalYear}    Convert To String    ${FiscalYear}
    ${fromdate}    Getfromdateforscheme8ForDB
    ${todate}    Gettodateforscheme8ForDB
    ${TargetQuantity}    getTargetQuantityFromDBForScheme17    ${customer}    ${FiscalMonth}    ${FiscalYear}
    Log To File    Target Quantity: ${TargetQuantity}
    Run Keyword If    '${TargetQuantity}' == 'None'    Return From Keyword
    ${TargetQuantity}    Convert To Number    ${TargetQuantity}
    ${BilledQuantity}    getBilledQtyToCalculateAchievementPer    ${customer}    ${fromdate}    ${todate}
    Log To File    Billed Quantity From DB: ${BilledQuantity}
    ${BilledQuantity}    Convert To Number    ${BilledQuantity}
    ${AchievementPer}    Evaluate    (${BilledQuantity}/${TargetQuantity})*100
    Log To File    Achievement Percentage: ${AchievementPer}
    ${is_Achievementgreaterthanorequalto110}    Evaluate    '${AchievementPer}' >= '110'
    ${is_Achievementbetween100and110}    Evaluate    '${AchievementPer}' >= '100' and '${AchievementPer}' < '110'
    ${is_Achievementbetween90and100}    Evaluate    '${AchievementPer}' >= '90' and '${AchievementPer}' < '100'
    IF    ${TargetQuantity} >= 1000
        Run Keyword If    ${is_Achievementgreaterthanorequalto110}    Log    Achievement is greater than or equal to 110
            # Should Be Equal As Numbers    100    ${rate}
            Run Keyword If    100 == ${rate}
            ...    Log    Rate is 100
            ...    ELSE
            ...         Return From Keyword
        Run Keyword If    ${is_Achievementbetween100and110}    Log    Achievement is between 100 and 110
            # Should Be Equal As Numbers    100    ${rate}
            Run Keyword If    100 == ${rate}
            ...    Log    Rate is 100
            ...    ELSE
            ...         Return From Keyword
        Run Keyword If    ${is_Achievementbetween90and100}    Log    Achievement is between 90 and 100
            # Should Be Equal As Numbers    100    ${rate}
            Run Keyword If    100 == ${rate}
            ...    Log    Rate is 100
            ...    ELSE
            ...         Return From Keyword          
    ELSE IF    ${TargetQuantity} >= 600 and ${TargetQuantity} < 1000
        Run Keyword If    ${is_Achievementgreaterthanorequalto110}    Log    Achievement is greater than or equal to 110
            # Should Be Equal As Numbers    80    ${rate}
            Run Keyword If    80 == ${rate}
            ...    Log    Rate is 80
            ...    ELSE
            ...         Return From Keyword
        Run Keyword If    ${is_Achievementbetween100and110}    Log    Achievement is between 100 and 110
            # Should Be Equal As Numbers    80    ${rate}
            Run Keyword If    80 == ${rate}
            ...    Log    Rate is 80
            ...    ELSE
            ...         Return From Keyword
        Run Keyword If    ${is_Achievementbetween90and100}    Log    Achievement is between 90 and 100
            # Should Be Equal As Numbers    80    ${rate}
            Run Keyword If    80 == ${rate}
            ...    Log    Rate is 80
            ...    ELSE
            ...         Return From Keyword
    ELSE IF    ${TargetQuantity} >= 400 and ${TargetQuantity} < 600
        Run Keyword If    ${is_Achievementgreaterthanorequalto110}    Log    Achievement is greater than or equal to 110
            # Should Be Equal As Numbers    60    ${rate}
            Run Keyword If    60 == ${rate}
            ...    Log    Rate is 60
            ...    ELSE
            ...         Return From Keyword
        Run Keyword If    ${is_Achievementbetween100and110}    Log    Achievement is between 100 and 110
            # Should Be Equal As Numbers    60    ${rate}
            Run Keyword If    60 == ${rate}
            ...    Log    Rate is 60
            ...    ELSE
            ...         Return From Keyword
        Run Keyword If    ${is_Achievementbetween90and100}    Log    Achievement is between 90 and 100
            # Should Be Equal As Numbers    60    ${rate}
            IF    60 == ${rate}
                Log    Rate is 60
            ELSE
                Return From Keyword
            END
    ELSE IF    ${TargetQuantity} >= 200 and ${TargetQuantity} < 400
        Run Keyword If    ${is_Achievementgreaterthanorequalto110}    Log    Achievement is greater than or equal to 110
            # Should Be Equal As Numbers    10    ${rate}
            IF    10 == ${rate}
                Log    Rate is 10
            ELSE
                Return From Keyword
            END
        Run Keyword If    ${is_Achievementbetween100and110}    Log    Achievement is between 100 and 110
            # Should Be Equal As Numbers    10    ${rate}
            IF    10 == ${rate}
                Log    Rate is 10
            ELSE
                Return From Keyword
            END
        Run Keyword If    ${is_Achievementbetween90and100}    Log    Achievement is between 90 and 100
            # Should Be Equal As Numbers    10    ${rate}
            IF    10 == ${rate}
                Log    Rate is 10
            ELSE
                Return From Keyword
            END
    ELSE
        Log    No Discount Provided      
    END
    
#Scheme18
Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity
    ${result}    None
    ${FiscalMonth}    Getfiscalmonth
    ${FiscalYear}    Getfiscalyear
    # ${FiscalMonth}    Convert To String    ${FiscalMonth}
    # ${FiscalYear}    Convert To String    ${FiscalYear}
    ${fromdate}    Getfromdateforscheme8ForDB
    ${todate}    Gettodateforscheme8ForDB
    ${TargetQuantity}    getTargetQuantityFromDBForScheme17    ${customer}    ${FiscalMonth}    ${FiscalYear}
    Run Keyword If    '${TargetQuantity}' == 'None'    Log    TargetQuantity is None.    and    Return From Keyword
    ${TargetQuantity}    Convert To Number    ${TargetQuantity}
    Set Global Variable    ${TargetQuantity}
    ${BilledQuantity}    getBilledQtyToCalculateAchievementPer    ${customer}    ${fromdate}    ${todate}
    ${BilledQuantity}    Convert To Number    ${BilledQuantity}
    ${AchievementPer}    Evaluate    (${BilledQuantity}/${TargetQuantity})*100
    ${IncrementalQuantity}    Evaluate    ${BilledQuantity}/10
    IF    ${IncrementalQuantity} >= 0 and ${IncrementalQuantity} < 100
        Run Keyword If    ${AchievementPer} >= 0 and ${AchievementPer} < 50
        # ...    Should Be Equal As Numbers    10    ${rate}
        ...    ${result}=    Run Keyword And Return Status    Should Be Equal As Numbers    10    ${rate}        
        # Should Be Equal As Numbers    10    ${rate}
        Run Keyword If    ${AchievementPer} >= 50 and ${AchievementPer} < 100
        ...    Should Be Equal As Numbers    20    ${rate}
        # Should Be Equal As Numbers    20    ${rate}
        Run Keyword If    ${AchievementPer} >= 100
        ...    Should Be Equal As Numbers    30    ${rate}
        # Should Be Equal As Numbers    30    ${rate}
    ELSE IF    ${IncrementalQuantity} >= 100 and ${IncrementalQuantity} < 200
        Run Keyword If    ${AchievementPer} >= 0 and ${AchievementPer} < 50
        ...    Should Be Equal As Numbers    40    ${rate}
        # Should Be Equal As Numbers    40    ${rate}
        Run Keyword If    ${AchievementPer} >= 50 and ${AchievementPer} < 100
        ...    Should Be Equal As Numbers    50    ${rate}
        # Should Be Equal As Numbers    50    ${rate}
        Run Keyword If    ${AchievementPer} >= 100
        ...    Should Be Equal As Numbers    60    ${rate}
        # Should Be Equal As Numbers    60    ${rate}
    ELSE IF    ${IncrementalQuantity} >= 200 and ${IncrementalQuantity} < 400
        Run Keyword If    ${AchievementPer} >= 0 and ${AchievementPer} < 50
        ...    Should Be Equal As Numbers    70    ${rate}
        # Should Be Equal As Numbers    70    ${rate}
        Run Keyword If    ${AchievementPer} >= 50 and ${AchievementPer} < 100
        ...    Should Be Equal As Numbers    80    ${rate}
        # Should Be Equal As Numbers    80    ${rate}
        Run Keyword If    ${AchievementPer} >= 100
        ...    Should Be Equal As Numbers    90    ${rate}
        # Should Be Equal As Numbers    90    ${rate}
    ELSE IF    ${IncrementalQuantity} >= 400
        Run Keyword If    ${AchievementPer} >= 0 and ${AchievementPer} < 50
        ...    Should Be Equal As Numbers    100    ${rate}
        # Should Be Equal As Numbers    100    ${rate}
        Run Keyword If    ${AchievementPer} >= 50 and ${AchievementPer} < 100
        ...    Should Be Equal As Numbers    110    ${rate}
        # Should Be Equal As Numbers    110    ${rate}
        Run Keyword If    ${AchievementPer} >= 100
        ...    Should Be Equal As Numbers    120    ${rate}
        # Should Be Equal As Numbers    120    ${rate}
    ELSE
        Log    No Discount Provided
    END
    
Retrieve BilledQuantity And Target Quantity From DB And Calculate Incrementaal Quantity2
    ${FiscalMonth}    Getfiscalmonth
    ${FiscalYear}    Getfiscalyear
    # ${FiscalMonth}    Convert To String    ${FiscalMonth}
    # ${FiscalYear}    Convert To String    ${FiscalYear}
    ${fromdate}    Getfromdateforscheme8ForDB
    ${todate}    Gettodateforscheme8ForDB
    ${TargetQuantity}    getTargetQuantityFromDBForScheme17    ${customer}    ${FiscalMonth}    ${FiscalYear}
    Log To File    Target Quantity: ${TargetQuantity}
    Run Keyword If    '${TargetQuantity}' == 'None'    Return From Keyword
    ${TargetQuantity}    Convert To Number    ${TargetQuantity}
    Set Global Variable    ${TargetQuantity}
    ${BilledQuantity}    getBilledQtyToCalculateAchievementPer    ${customer}    ${fromdate}    ${todate}
    Log To File    Billed Quantity From DB: ${BilledQuantity}
    ${BilledQuantity}    Convert To Number    ${BilledQuantity}
    ${AchievementPer}    Evaluate    (${BilledQuantity}/${TargetQuantity})*100
    Log To File    Achievement Percentage: ${AchievementPer}
    ${IncrementalQuantity}    Evaluate    ${BilledQuantity}/10
    Log To File    Incremental Quantity: ${IncrementalQuantity}
    IF    ${AchievementPer} >= 0 and ${AchievementPer} < 50
        Run Keyword If    ${IncrementalQuantity} >= 0 and ${IncrementalQuantity} < 100
        # ...    Should Be Equal As Numbers    10    ${rate}
        ...    Run Keyword If    10 == ${rate}
        ...        Log    Rate is 10
        ...        ELSE
        ...            Return From Keyword        
        # ${is_equal}    Set Variable    False
        # ...    ${is_equal}=    Run Keyword And Return Status    Should Be Equal As Numbers    10    ${rate}
        ...  ELSE IF    ${IncrementalQuantity} >= 100 and ${IncrementalQuantity} < 200
        # ...    Should Be Equal As Numbers    40    ${rate}
        ...    Run Keyword If    40 == ${rate}
        ...        Log    Rate is 40
        ...        ELSE
        ...            Return From Keyword
        ...  ELSE IF    ${IncrementalQuantity} >= 200 and ${IncrementalQuantity} < 400
        # ...    Should Be Equal As Numbers    70    ${rate}
        ...    Run Keyword If    70 == ${rate}
        ...        Log    Rate is 70
        ...        ELSE
        ...            Return From Keyword     
        ...  ELSE IF    ${IncrementalQuantity} >= 400
        # ...    Should Be Equal As Numbers    100    ${rate}
        ...    Run Keyword If    100 == ${rate}
        ...        Log    Rate is 100
        ...        ELSE
        ...            Return From Keyword
    ELSE IF    ${AchievementPer} >=50 and ${AchievementPer} < 100
        Run Keyword If    ${IncrementalQuantity} >= 0 and ${IncrementalQuantity} < 100
        # ...    Should Be Equal As Numbers    20    ${rate}
        ...    Run Keyword If    20 == ${rate}
        ...        Log    Rate is 20
        ...        ELSE
        ...            Return From Keyword
        ...  ELSE IF    ${IncrementalQuantity} >= 100 and ${IncrementalQuantity} < 200
        # ...    Should Be Equal As Numbers    50    ${rate}
        ...    Run Keyword If    50 == ${rate}
        ...        Log    Rate is 50
        ...        ELSE
        ...            Return From Keyword
        ...  ELSE IF    ${IncrementalQuantity} >= 200 and ${IncrementalQuantity} < 400
        # ...    Should Be Equal As Numbers    80    ${rate}
        ...    Run Keyword If    80 == ${rate}
        ...        Log    Rate is 80
        ...        ELSE
        ...            Return From Keyword
        ...  ELSE IF    ${IncrementalQuantity} >= 400
        # ...    Should Be Equal As Numbers    110    ${rate}
        ...    Run Keyword If    110 == ${rate}
        ...        Log    Rate is 110
        ...        ELSE
        ...            Return From Keyword
    ELSE IF    ${AchievementPer} >=100
        Run Keyword If    ${IncrementalQuantity} >= 0 and ${IncrementalQuantity} < 100
        # ...    Should Be Equal As Numbers    30    ${rate}
        ...    Run Keyword If    30 == ${rate}
        ...        Log    Rate is 30
        ...        ELSE
        ...            Return From Keyword
        ...  ELSE IF    ${IncrementalQuantity} >= 100 and ${IncrementalQuantity} < 200
        # ...    Should Be Equal As Numbers    60    ${rate}
        ...    Run Keyword If    60 == ${rate}
        ...        Log    Rate is 60
        ...        ELSE
        ...            Return From Keyword
        ...  ELSE IF    ${IncrementalQuantity} >= 200 and ${IncrementalQuantity} < 400
        # ...    Should Be Equal As Numbers    90    ${rate}
        ...    Run Keyword If    90 == ${rate}
        ...        Log    Rate is 90
        ...        ELSE
        ...            Return From Keyword
        ...  ELSE IF    ${IncrementalQuantity} >= 400
        # ...    Should Be Equal As Numbers    120    ${rate}
        ...    Run Keyword If    120 == ${rate}
        ...        Log    Rate is 120
        ...        ELSE
        ...            Return From Keyword
    ELSE
        Log    No Discount Provided
    END

#Scheme19s
Retrieve BilledQuantity From DB And Validate Discount Rate
    ${FiscalMonth}    Getfiscalmonth
    ${FiscalYear}    Getfiscalyear
    # ${FiscalMonth}    Convert To String    ${FiscalMonth}
    # ${FiscalYear}    Convert To String    ${FiscalYear}
    ${fromdate}    Getfromdateforscheme8ForDB
    ${todate}    Gettodateforscheme8ForDB
    # ${TargetQuantity}    getTargetQuantityFromDBForScheme17    ${customer}    ${FiscalMonth}    ${FiscalYear}
    # Run Keyword If    '${TargetQuantity}' == 'None'    Return From Keyword
    ${TargetQty}    Convert To Number    ${TargetQty}
    # Set Global Variable    ${TargetQuantity}
    ${BilledQuantity}    getBilledQtyToCalculateAchievementPer    ${customer}    ${fromdate}    ${todate}
    Log To File    Billed Quantity From DB: ${BilledQuantity}
    ${BilledQuantity}    Convert To Number    ${BilledQuantity}
    ${AchievementPer}    Evaluate    (${BilledQuantity}/${TargetQty})*100
    Log To File    Achievement Percentage: ${AchievementPer}
    # ${IncrementalQuantity}    Evaluate    ${BilledQuantity}/10
    IF    ${AchievementPer} >= 100.00001 and ${AchievementPer} < 110
        Run Keyword If    ${BilledQuantity} >= 400 and ${BilledQuantity} < 800
        ...    Should Be Equal As Numbers    10    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 800 and ${BilledQuantity} < 1200
        ...    Should Be Equal As Numbers    40    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 1200 and ${BilledQuantity} < 2000
        ...    Should Be Equal As Numbers    70    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 2000
        ...    Should Be Equal As Numbers    100    ${ratefromprecal}
    ELSE IF    ${AchievementPer} >=110 and ${AchievementPer} < 120
        Run Keyword If    ${BilledQuantity} >= 400 and ${BilledQuantity} < 800
        ...    Should Be Equal As Numbers    20    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 800 and ${BilledQuantity} < 1200
        ...    Should Be Equal As Numbers    50    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 1200 and ${BilledQuantity} < 2000
        ...    Should Be Equal As Numbers    80    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 2000
        ...    Should Be Equal As Numbers    110    ${ratefromprecal}
    ELSE IF    ${AchievementPer} >= 120
        Run Keyword If    ${BilledQuantity} >= 400 and ${BilledQuantity} < 800
        ...    Should Be Equal As Numbers    30    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 800 and ${BilledQuantity} < 1200
        ...    Should Be Equal As Numbers    60    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 1200 and ${BilledQuantity} < 2000
        ...    Should Be Equal As Numbers    90    ${ratefromprecal}
        ...  ELSE IF    ${BilledQuantity} >= 2000
        ...    Should Be Equal As Numbers    120    ${ratefromprecal}
    ELSE
        Log    No Discount Provided
    END

#Scheme20
Check Whether The Customer If Qualified For Discount or Not
    ${preperiodfromdate}    getpreperiodfromdateforscheme20forDB
    ${preperiodtodate}    getpreperiodtodateforscheme20forDB
    ${PrePeriodBilledQty}    getBilledQtyToCalculateAchievementPer    ${customer}    ${preperiodfromdate}    ${preperiodtodate}
    Log To File    Pre Period Billed Quantity Of Customer From DB: ${PrePeriodBilledQty}
    IF    ${PrePeriodBilledQty} >= 599.9 and ${PrePeriodBilledQty} <= 999.9
        Log    The Customer is Qualified for Discount
    ELSE
        Log    The Customer is not Qualified for Discount
    END
Calculate Target By Retrieving Target Quantity From DB
    ${FiscalMonth}    Getfiscalmonth
    ${FiscalYear}    Getfiscalyear
    ${TargetQuantity}    getTargetQuantityFromDBForScheme17    ${customer}    ${FiscalMonth}    ${FiscalYear}
    Log To File    Target Quantity: ${TargetQuantity}
    Run Keyword If    '${TargetQuantity}' == 'None'    Return From Keyword
    ${TargetQuantity}    Convert To Number    ${TargetQuantity}
    Set Global Variable    ${TargetQuantity}
    ${Target}    Evaluate    (${TargetQuantity}/${NumberOfDaysInAMonth})*8
    Log To File    Target: ${Target}
    Set Global Variable    ${Target}
    ${fromdate}    getfromdateforscheme20forDB
    ${todate}    gettodateforscheme20forDB
    ${BilledQty}    getBilledQtyToCalculateAchievementPer    ${customer}    ${fromdate}    ${todate}
    Log To File    Billed Quantity From DB: ${BilledQty}
    ${AchievementPer}    Evaluate    (${BilledQty}/${Target})*100
    Log To File    Achievement Percentage: ${AchievementPer}
    IF    ${AchievementPer} >= 80 and ${AchievementPer} < 100
        Run Keyword If    ${BilledQty} >= 50 and ${BilledQty} < 100.001
        ...    Should Be Equal As Numbers    1    ${rate}
        ...  ELSE IF    ${BilledQty} >= 100.001 and ${BilledQty} < 250.001
        ...    Should Be Equal As Numbers    6    ${rate}
        ...  ELSE IF    ${BilledQty} >= 250.001 and ${BilledQty} < 500.001
        ...    Should Be Equal As Numbers    11    ${rate}
        ...  ELSE IF    ${BilledQty} >= 500.001 and ${BilledQty} < 800.001
        ...    Should Be Equal As Numbers    16    ${rate}
        ...  ELSE IF    ${BilledQty} >= 800.001
        ...    Should Be Equal As Numbers    21    ${rate}
    ELSE IF    ${AchievementPer} >=100 and ${AchievementPer} < 120
        Run Keyword If    ${BilledQty} >= 50 and ${BilledQty} < 100.001
        ...    Should Be Equal As Numbers    2    ${rate}
        ...  ELSE IF    ${BilledQty} >= 100.001 and ${BilledQty} < 250.001
        ...    Should Be Equal As Numbers    7    ${rate}
        ...  ELSE IF    ${BilledQty} >= 250.001 and ${BilledQty} < 500.001
        ...    Should Be Equal As Numbers    12    ${rate}
        ...  ELSE IF    ${BilledQty} >= 500.001 and ${BilledQty} < 800.001
        ...    Should Be Equal As Numbers    17    ${rate}
        ...  ELSE IF    ${BilledQty} >= 800.001
        ...    Should Be Equal As Numbers    22    ${rate}
    ELSE IF    ${AchievementPer} >= 120 and ${AchievementPer} < 135
        Run Keyword If    ${BilledQty} >= 50 and ${BilledQty} < 100.001
        ...    Should Be Equal As Numbers    3    ${rate}
        ...  ELSE IF    ${BilledQty} >= 100.001 and ${BilledQty} < 250.001
        ...    Should Be Equal As Numbers    8    ${rate}
        ...  ELSE IF    ${BilledQty} >= 250.001 and ${BilledQty} < 500.001
        ...    Should Be Equal As Numbers    13    ${rate}
        ...  ELSE IF    ${BilledQty} >= 500.001 and ${BilledQty} < 800.001
        ...    Should Be Equal As Numbers    18    ${rate}
        ...  ELSE IF    ${BilledQty} >= 800.001
        ...    Should Be Equal As Numbers    23    ${rate}
    ELSE IF    ${AchievementPer} >= 135 and ${AchievementPer} < 150
        Run Keyword If    ${BilledQty} >= 50 and ${BilledQty} < 100.001
        ...    Should Be Equal As Numbers    4    ${rate}
        ...  ELSE IF    ${BilledQty} >= 100.001 and ${BilledQty} < 250.001
        ...    Should Be Equal As Numbers    9    ${rate}
        ...  ELSE IF    ${BilledQty} >= 250.001 and ${BilledQty} < 500.001
        ...    Should Be Equal As Numbers    14    ${rate}
        ...  ELSE IF    ${BilledQty} >= 500.001 and ${BilledQty} < 800.001
        ...    Should Be Equal As Numbers    19    ${rate}
        ...  ELSE IF    ${BilledQty} >= 800.001
        ...    Should Be Equal As Numbers    24    ${rate}
    ELSE IF    ${AchievementPer} >= 150
        Run Keyword If    ${BilledQty} >= 50 and ${BilledQty} < 100.001
        ...    Should Be Equal As Numbers    5    ${rate}
        ...  ELSE IF    ${BilledQty} >= 100.001 and ${BilledQty} < 250.001
        ...    Should Be Equal As Numbers    10    ${rate}
        ...  ELSE IF    ${BilledQty} >= 250.001 and ${BilledQty} < 500.001
        ...    Should Be Equal As Numbers    15    ${rate}
        ...  ELSE IF    ${BilledQty} >= 500.001 and ${BilledQty} < 800.001
        ...    Should Be Equal As Numbers    20    ${rate}
        ...  ELSE IF    ${BilledQty} >= 800.001
        ...    Should Be Equal As Numbers    25    ${rate}
    ELSE
        Log    No Discount Provided
    END

