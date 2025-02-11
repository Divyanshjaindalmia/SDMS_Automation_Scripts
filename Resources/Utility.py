import json
import pandas as pd
import openpyxl
import os
import glob
import random
import calendar
import subprocess
import warnings
from openpyxl import load_workbook
from datetime import datetime,timedelta
from dateutil.relativedelta import relativedelta
from bs4 import BeautifulSoup

#Get current wokrking directory
def getCurrentDirectory():
    current_path = os.getcwd()
    return current_path

# Retrieves environment details from json
def getENVDetails():
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData")
    x=os.getcwd()+"\\Env.json"
    with open(x) as f:
        envdata = json.load(f)
        return envdata

# Fetches data from excel
def readdata(columnname, rownum):
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData")
    a=os.getcwd()+"\\SDMSTestData.xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath,engine='openpyxl')
    value=df[columnname].iloc[rownum]
    return value

def getfiletoupload():
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData")
    a=os.getcwd()+"\\*.pdf"
    fx=glob.glob(a)
    pdf_filepath=fx[0]
    return pdf_filepath

def getrebatefiletoupload():
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\RebateDocument")
    a=os.getcwd()+"\\7bbb9199-ca12-462b-9678-7bb0b917de7a.xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    return excel_filepath

def getrebateslabentryandfileupload():
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData")
    a=os.getcwd()+"\\1a1cbf18-a6f6-4b5b-be7b-e27b0105ebfc.xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    return excel_filepath

#Used to fill from date during Scheme creation
def getcurrentdate():
    current_date = datetime.date.today()
    formatted_date = current_date.strftime("%d-%m-%Y")
    return formatted_date

#Get the first date of the current month to fill from date during scheme creation
def getfirstofcurrentmonth():
    current_date = datetime.now()
    formatted_date = current_date.strftime("01-%m-%Y")
    return formatted_date

#Get the last date of the current month to fill to date during scheme creation
def getlastofcurrentmonth():
    current_year = datetime.today().year
    current_month = datetime.today().month
    num_days = calendar.monthrange(current_year, current_month)[1]
    return f"{num_days}-{current_month}-{current_year}"
    # current_date = datetime.now()
    # first_of_next_month = current_date.replace(day=28) + timedelta(days=4)  # Go to the 28th to ensure month change
    # last_of_current_month = first_of_next_month - timedelta(days=1)
    # formatted_date = last_of_current_month.strftime("%d-%m-%Y")
    # return formatted_date


#Get the previous day of the first day of the current month to fill announcement date
def getpreviousdayoffirstofcurrentmonth():
    current_date = datetime.now()
    first_of_current_month = current_date.replace(day=1)
    previous_day = first_of_current_month - timedelta(days=1)
    return previous_day.strftime("%d-%m-%Y")

def getpreviousday():
    current_date = datetime.now()
    previous_day = current_date - timedelta(days=1)
    return previous_day.strftime("%d-%m-%Y")

#get scheme from date for scheme3
def getfromdateforscheme3():
    today = datetime.now()
    first_day_of_current_month = today.replace(day=1)
    first_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    first_day_of_previous_month = first_day_of_previous_month.replace(day=1)
    formatted_date = first_day_of_previous_month.strftime("%d-%m-%Y")
    return formatted_date

#get scheme To Date for scheme3
def gettodateforscheme3():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    # last_day_of_previous_month = datetime(last_day_of_current_month.year, last_day_of_current_month.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%d-%m-%Y")
    return formatted_date

#get Prev From Date Qualifier for scheme3
def getprevfromdatequalifier():
    today = datetime.now()
    first_day_of_current_month = today.replace(day=1)
    first_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    first_day_of_previous_month = first_day_of_previous_month.replace(day=1)
    formatted_date = first_day_of_previous_month.strftime("%d-%m-2023")
    return formatted_date

#get Prev To Date Qualifier for scheme3
def getprevtodatequalifier():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    # last_day_of_previous_month = datetime(last_day_of_current_month.year, last_day_of_current_month.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%d-%m-2023")
    return formatted_date
#Scheme13
def getfromdateforscheme13():
    current_date = datetime.now()
    first_day_current_month = current_date.replace(day=1)
    formatted_date = first_day_current_month.strftime("%d-%m-%Y")
    return formatted_date

def gettodateforscheme13():
    current_date = datetime.today()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1)+timedelta(days=30)
    formatted_date = last_day_of_current_month.strftime("%d-%m-%Y")
    return formatted_date

def getprevfromdateforscheme13():
    current_date = datetime.now()
    next_year = current_date - timedelta(days=365)
    first_day_next_year = datetime(next_year.year, current_date.month-1, 1)
    formatted_date = first_day_next_year.strftime("%d-%m-%Y")    
    return formatted_date

def getprevtodateforscheme13():
    current_date = datetime.now()
    next_year = current_date - timedelta(days=365)
    last_day_of_current_month = datetime(next_year.year, current_date.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%d-%m-%Y")
    return formatted_date

def getpayoutfromdateforscheme13():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month-1, 1)
    formatted_date = last_day_of_current_month.strftime("%d-%m-%Y")
    return formatted_date

def getpayouttodateforscheme13():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%d-%m-%Y")
    return formatted_date


#get Pre Period From Date for scheme3
def getpreperiodfromdate():
    today = datetime.today()
    two_months_ago = today - timedelta(days=60)
    first_day_of_two_months_ago = datetime(two_months_ago.year, two_months_ago.month, 1)
    formatted_date = first_day_of_two_months_ago.strftime("%d-%m-%Y")
    return formatted_date

#get pre Period To Date for scheme3
def getpreperiodtodate():
    today = datetime.today()
    two_months_ago = today - timedelta(days=30)
    first_day_of_two_months_ago = datetime(two_months_ago.year, two_months_ago.month, 1)
    last_day_of_two_months_ago = first_day_of_two_months_ago.replace(day=1) - timedelta(days=1)
    formatted_date = last_day_of_two_months_ago.strftime("%d-%m-%Y")
    return formatted_date

# get fromdate, preperiodfrom date for scheme5(Adhoc)
def getfromdateforscheme5():
    current_date = datetime.now()
    formatted_date = current_date.strftime("10-%m-%Y")
    return formatted_date

#Used to fill to date, preperiodto date Scheme5(Adhoc)
def gettodateforscheme5(numberofdays):
    currentdate=datetime.now()
    futuredate= currentdate + timedelta(days=int(numberofdays))
    futuredate = futuredate.strftime("12-%m-%Y")
    return futuredate

# get announcement date for scheme5(Adhoc)
def getannouncementdateforscheme5():
    current_date = datetime.now()
    formatted_date = current_date.strftime("09-%m-%Y")
    return formatted_date

def getfromdateforscheme5a():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=10)
    formatted_date = target_date.strftime("%d-%m-%Y")
    return formatted_date

def gettodateforscheme5a():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=12)
    formatted_date = target_date.strftime("%d-%m-%Y")
    return formatted_date

def getannouncementdateforscheme5a():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=9)
    formatted_date = target_date.strftime("%d-%m-%Y")
    return formatted_date

#get from date for scheme6
def getfromdateforscheme6():
    current_date = datetime.now()
    first_day_current_month = current_date.replace(day=1)
    if first_day_current_month.month == 1:
        first_day_previous_month = first_day_current_month.replace(year=first_day_current_month.year - 1, month=12)
    else:
        previous_month = first_day_current_month.month - 1
        year = first_day_current_month.year
        first_day_previous_month = first_day_current_month.replace(month=previous_month)    
    formatted_date = first_day_previous_month.strftime("%d-%m-%Y")
    return formatted_date

#get to date for scheme6
def gettodateforscheme6():
    current_date = datetime.now()
    first_day_of_current_month = current_date.replace(day=1)
    last_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    formatted_date = last_day_of_previous_month.strftime("%d-%m-%Y")
    return formatted_date

# get announcement date for scheme6
def getannouncementdateforscheme6():
    current_date = datetime.now()
    first_day_of_current_month = current_date.replace(day=1)
    two_months_ago = first_day_of_current_month - timedelta(days=first_day_of_current_month.day + 1)
    last_day_of_two_previous_months = two_months_ago.replace(day=1) - timedelta(days=1)
    formatted_date = last_day_of_two_previous_months.strftime("%d-%m-%Y")
    return formatted_date

def getfromdateforscheme7():
    current_date = datetime.now()
    last_year = current_date.year - 1
    april_1_last_year = datetime(last_year, 4, 1)
    formatted_date = april_1_last_year.strftime("%d-%m-%Y")
    return formatted_date

def gettodateforscheme7():
    current_date = datetime.now()
    last_year = current_date.year - 1
    april_1_last_year = datetime(last_year, 4, 1)
    one_year = timedelta(days=365)  # Assuming a non-leap year
    date_after_one_year = april_1_last_year + one_year
    formatted_date = date_after_one_year.strftime("%d-%m-%Y")
    return formatted_date

def getannouncementdateforscheme7():
    current_year = datetime.now().year
    feb_21_current_year = datetime(current_year, 2, 21)
    formatted_date = feb_21_current_year.strftime("%d-%m-%Y")
    return formatted_date

def getannouncementdateforscheme8():
    today = datetime.today()
    first_day_of_previous_month = today.replace(day=1, month=today.month-1)    
    # first_day_of_previous_month = first_day_of_previous_month.replace(year=today.year-1, month=12)
    previous_day = first_day_of_previous_month - timedelta(days=1)
    formatted_date = previous_day.strftime("%d-%m-%Y")
    return formatted_date

def getannouncementdateforscheme9():
    current_date = datetime.now()
    first_day_of_current_month = current_date.replace(day=1)
    last_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    first_day_of_previous_month = last_day_of_previous_month.replace(day=1)
    last_day_of_month_before_previous = first_day_of_previous_month - timedelta(days=1)
    first_day_of_month_before_previous = last_day_of_month_before_previous.replace(day=1)
    return first_day_of_month_before_previous.strftime("%d-%m-%Y")

def getfromdateforscheme10():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=21)
    formatted_date = target_date.strftime("%d-%m-%Y")
    return formatted_date

def gettodateforscheme10():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=30)
    formatted_date = target_date.strftime("%d-%m-%Y")
    return formatted_date

def getfromdateforscheme15():
    current_year = datetime.now().year
    first_day_of_april = datetime(current_year, 4, 1).date()
    formatted_date = first_day_of_april.strftime("%d-%m-%Y")
    return formatted_date

def gettodateforscheme15():
    current_year = datetime.now().year
    last_day = calendar.monthrange(current_year, 4)[1]
    last_day_of_april = datetime(current_year, 4, last_day).date()
    formatted_date = last_day_of_april.strftime("%d-%m-%Y")  
    return formatted_date
def getannouncementdateforscheme15():
    current_year = datetime.now().year
    thirty_first_of_march = datetime(current_year, 3, 31).date()
    formatted_date = thirty_first_of_march.strftime("%d-%m-%Y")    
    return formatted_date

def getpayouttodateforscheme17():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=2)
    formatted_date = last_day_of_current_month.strftime("%d-%m-%Y")
    return formatted_date

def getAnnouncementDateForScheme18():
    current_date = datetime.now()    
    if current_date.month <= 2:
        month = current_date.month + 10  # Adjust month to get a valid previous month
        year = current_date.year - 1
    else:
        month = current_date.month - 2
        year = current_date.year
    _, last_day = calendar.monthrange(year, month)
    return datetime(year, month, last_day).strftime("%d-%m-%Y")

def getfromdateforscheme20():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 2)
    target_date = previous_month.replace(day=10)
    formatted_date = target_date.strftime("%d-%m-%Y")
    return formatted_date

def gettodateforscheme20():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 2)
    target_date = previous_month.replace(day=19)
    formatted_date = target_date.strftime("%d-%m-%Y")
    return formatted_date

def getpreperiodfromdateforscheme20():
    today = datetime.today()
    first_day_of_current_year = datetime(today.year, 1, 1)
    formatted_date = first_day_of_current_year.strftime("%d-%m-%Y")
    return formatted_date

def getpreperiodtodateforscheme20():
    today = datetime.today()
    first_day_of_current_year = datetime(today.year, 1, 1)
    target_date = first_day_of_current_year + relativedelta(months=7)
    # Get the last day of the month of the target date
    last_day_of_month = target_date.replace(day=1) + relativedelta(months=1) - relativedelta(days=1)
    formatted_date = last_day_of_month.strftime("%d-%m-%Y")
    return formatted_date

def days_in_two_months_ago():
    today = datetime.now()
    first_day_of_current_month = today.replace(day=1)
    first_day_of_two_months_ago = (first_day_of_current_month - timedelta(days=1)).replace(day=1)
    last_day_of_two_months_ago = (first_day_of_two_months_ago + timedelta(days=32)).replace(day=1) - timedelta(days=1)
    days_in_month = last_day_of_two_months_ago.day    
    return days_in_month

def getsubdealer(subdealer):
    substring = subdealer[subdealer.index("77"):]
    return substring

#used to split alert
def splitalert(alerttext):
    schememessage = alerttext[-1]
    return schememessage

def filter_excel_column(column_name, filter_value, type, scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        if column_name not in df.columns:
            raise ValueError("Column not found.")
        # df[column_name] = df[column_name].astype(str)
        print(df.head())
        filtered_df = df[df[column_name] == filter_value]
        billed_Quantity = filtered_df['Billed Quantity'].dropna().tolist()
        billed_quantity_sum = sum(billed_Quantity)
        # os.remove(filename)
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        if column_name not in df.columns:
            raise ValueError("Column not found.")
        # df[column_name] = df[column_name].astype(str)
        filtered_df = df[df[column_name] == filter_value]
        billed_Quantity = filtered_df['Billed Quantity'].dropna().tolist()
        billed_quantity_sum = sum(billed_Quantity)
        # os.remove(a)
    return billed_quantity_sum

# def getrandomvalue(type,ColumnName):
#     cur_path = os.path.dirname(__file__)
#     os.chdir(cur_path+"\\..\\TestData")
#     x=os.getcwd()+"\\Env.json"
#     with open(x, 'r') as config_file:
#         config = json.load(config_file)
#     if  type=="precal":
#         excel_filepath = config['PreCalDownload']
#     else:
#         excel_filepath = config['ProvisionCalculation']
#     file=glob.glob(excel_filepath)
#     df = pd.read_excel(file[0], sheet_name=f'sheet 1')
#     speciesdata = df[ColumnName].unique()
#     random_num = random.choice(speciesdata)
#     return random_num

def getrandomvalue(type,ColumnName,scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        speciesdata = df[ColumnName].unique()
        random_num = random.choice(speciesdata)    
        # os.remove(filename)
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        speciesdata = df[ColumnName].unique()
        random_num = random.choice(speciesdata)
        # os.remove(filename)
    return random_num

#didn't use this function
def getplantvalue(type, column_name):
    cur_path = os.path.dirname(__file__)
    os.chdir(os.path.join(cur_path, "..", "TestData"))
    with open('Env.json', 'r') as config_file:
        config = json.load(config_file)
    if type == "precal":
        excel_filepath = config['PreCalDownload']
    else:
        excel_filepath = config['ProvisionCalculation']
    file = glob.glob(excel_filepath)
    df = pd.read_excel(file[0], sheet_name='sheet 1')
    speciesdata = df[column_name].unique()
    random_value = random.choice(speciesdata)
    filtered_df = df[df[column_name] == random_value]
    if not filtered_df.empty:
        customer=filtered_df['Customer'].iloc[0]
        other_column_value = filtered_df['Plant'].iloc[0]
        material_value = filtered_df['Material'].iloc[0]
    else:
        customer=None
        other_column_value = None
        material_value=None
    return customer, other_column_value, material_value

def getrateperbag1(current_value):
    return current_value + 1

def getrateperbag(key):
    # Read data from JSON file
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData")
    x=os.getcwd()+"\\Env.json"
    with open(x, 'r') as file:
        data = json.load(file)
    # Increment the value
    if key in data:
        data[key] += 1
    else:
        print(f"Key '{key}' not found in JSON data.")
        return
    # Write the updated data back to the JSON file
    with open(x, 'w') as file:
        json.dump(data, file, indent=4)
    return data[key]

def getcurrentmonth():
    current_date = datetime.now()
    # current_month = current_date.month
    current_month = current_date.strftime("%B")
    return current_month

def getcurrentyear():
    current_year = datetime.now().year
    return current_year

def getpreviousmonth():
    current_date = datetime.now()
    first_day_of_current_month = current_date.replace(day=1)
    last_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    # previous_month_year = last_day_of_previous_month.year
    previous_month = last_day_of_previous_month.strftime("%B")
    return previous_month

#didn't use this function
def filter_excel_column_togetrate(column_name, filter_value, type):
    global filename
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData")
    x=os.getcwd()+"\\Env.json"
    with open(x, 'r') as config_file:
        config = json.load(config_file)
    if  type=="precal":
        excel_file_pattern = config['PreCalDownload']
    else:
        excel_file_pattern = config['ProvisionCalculation']
    matching_files = glob.glob(excel_file_pattern)
    for filename in matching_files:
        print(filename)
    # Read the Excel file into a DataFrame
    df = pd.read_excel(filename)
    # Filter the DataFrame based on the specified column and values
    filtered_df = df[df[column_name] == filter_value]
    Rate = filtered_df['Rate'].tolist()
    Rate = Rate[0]
    # os.remove(filename)
    return Rate

def Getplantandmaterialwithrateeighty(type,scheme_number):
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None  
        if not df.empty:
            filtered_df = df[df['Rate'] == 80]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath, sheet_name=f'sheet 1')
        print(df.head())
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None  
        if not df.empty:
            filtered_df = df[df['Rate'] == 80]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    return result_list

def Getplantandmaterialwithratesixty(type,scheme_number):
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None  
        if not df.empty:
            filtered_df = df[df['Rate'] == 60]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath, sheet_name=f'sheet 1')
        print(df.head())
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None  
        if not df.empty:
            filtered_df = df[df['Rate'] == 60]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    return result_list


def Getplantandmaterialwithratezero(type,scheme_number):
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None  
        if not df.empty:
            filtered_df = df[df['Rate'] == 0]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath, sheet_name=f'sheet 1')
        print(df.head())
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None  
        if not df.empty:
            filtered_df = df[df['Rate'] == 0]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    return result_list


def get_plant_and_material_with_rate(rate,type,scheme_number):
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None  
        if not df.empty:
            filtered_df = df[df['Rate'] == rate]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath, sheet_name=f'sheet 1')
        print(df.head())
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None
        if not df.empty:
            filtered_df = df[df['Rate'] == rate]
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                plant_value = row['Plant']
                material_value = row['Material']
                rate_value = row['Rate']
                result_list.append((customer_value, plant_value, material_value, rate_value))
        else:
            print("Empty DataFrame")
    return result_list


def mergehtmlfiles(output_file, *input_files):
    try:
        with open(output_file, 'w', encoding='utf-8') as output:
            for i, file in enumerate(input_files):
                with open(file, 'r', encoding='utf-8') as f:
                    file_contents = f.read()
                    output.write(file_contents)
                    # Add separator only if it's not the last file
                    if i < len(input_files) - 1:
                        output.write('\n<!-- File separator -->\n')
        print("HTML files merged successfully!")
        
    except IOError as e:
        print(f"Error merging HTML files: {e}")
        
    return output_file

#Used in Scheme 5
def getRateAndSumOfBilledQty(rate, type, scheme_number):
    print("executing generalized function")
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        if not df.empty:
            filtered_df = df[df['Rate'] == rate]
            if not filtered_df.empty:
                random_customer = random.choice(filtered_df['Customer'].unique())                
                # Filter again by the randomly selected customer
                customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
                rate_value = rate               
                # Calculate sum of billed quantity for the selected customer
                sum_billed_qty = customer_filtered_df['Billed Quantity'].sum()                
                result_list.append((random_customer, rate_value, sum_billed_qty))
            else:
                print("No Data with the specified rate found in the DataFrame")
        else:
            print("Empty DataFrame")
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath, sheet_name=f'sheet 1')
        print(df.head())
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        cutomerdetails = None
        if not df.empty:
            filtered_df = df[df['Rate'] == rate]
            if not filtered_df.empty:
                random_customer = random.choice(filtered_df['Customer'].unique())                
                # Filter again by the randomly selected customer
                customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
                rate_value = rate
                # Calculate sum of billed quantity for the selected customer
                sum_billed_qty = customer_filtered_df['Billed Quantity'].sum()                
                result_list.append((random_customer, rate_value, sum_billed_qty))
            else:
                print("Empty DataFrame")
        else:
            print("Empty DataFrame")
    return result_list

def islistempty(list):
    if not list:
        return False
    else:
        return True

def get_payment_info_from_excel(rate,scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    try:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df_payments = df[df['Payment Date'].notnull()]
        if not df_payments.empty:
            df_payments=df_payments[df['Rate'] == rate]
            # print(df_payments.head())
            payment_dates = df_payments['Payment Date'].tolist()
            reference_dates = df_payments['Reference Date'].tolist()
            customers = df_payments['Customer'].tolist()
            rate = df_payments['Rate'].tolist()
            payment_info = list(zip(payment_dates, reference_dates, customers, rate))        
        return payment_info   
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def getdifferenceindays(date1,date2):
    datetime1 = datetime.strptime(date1, '%Y-%m-%d')
    datetime2 = datetime.strptime(date2, '%Y-%m-%d')
    difference = datetime1 - datetime2
    return difference.days

#Scheme9
def getsubdealerscustomer(column_name, filter_value, type, scheme_number):
    if  type == 'precal':
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        if column_name not in df.columns:
            raise ValueError("Column not found.")
        # df[column_name] = df[column_name].astype(str)
        print(df.head())
        filtered_df = df[df[column_name] == filter_value]
        customer_list = filtered_df['Customer'].tolist()
        customer=customer_list[0]
        # billed_quantity_sum = sum(billed_Quantity)
        # os.remove(filename)
    else:
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\provision*.xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        if column_name not in df.columns:
            raise ValueError("Column not found.")
        # df[column_name] = df[column_name].astype(str)
        filtered_df = df[df[column_name] == filter_value]
        customer_list = filtered_df['Customer'].tolist()
        customer=customer_list[0]
        # os.remove(a)
    return customer

#Scheme12
def getBilledQuantityandMaterial(rate, scheme_number):
        warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
        cur_path = os.path.dirname(__file__)
        os.chdir(cur_path+"\\..\\TestData\\Downloads")
        a=os.getcwd()+"\\"+scheme_number+".xlsx"
        fx=glob.glob(a)
        excel_filepath=fx[0]
        df = pd.read_excel(excel_filepath)
        df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
        result_list = []
        if not df.empty:
            filtered_df = df[df['Rate'] == rate]
            if not filtered_df.empty:
                random_customer = random.choice(filtered_df['Customer'].unique())                
                # Filter again by the randomly selected customer
                customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
                material=random.choice(customer_filtered_df['Material'].unique())
                customer_filtered_df2=customer_filtered_df[customer_filtered_df['Material']==material]
                rate_value = rate
                # Calculate sum of billed quantity for the selected customer
                sum_billed_qty = customer_filtered_df2['Billed Quantity'].sum()                
                result_list.append((random_customer, material, rate_value, sum_billed_qty))
            else:
                print("No Data with the specified rate found in the DataFrame")
            return result_list
        else:
            print("Empty DataFrame")

#Scheme14
def getTragetQuantity(targetqty):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\RebateDocument")
    a=os.getcwd()+"\\7bbb9199-ca12-462b-9678-7bb0b917de7a.xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'Sheet1')
    result_list = []
    if not df.empty:
        filtered_df = df[df['target'] == targetqty]
        if not filtered_df.empty:
            random_cutomer=random.choice(filtered_df['customer'].unique())
            customer_filtered_df = filtered_df[filtered_df['customer'] == random_cutomer]
            achievment=random.choice(customer_filtered_df['Achev%'].unique())
            customer_filtered_df2=customer_filtered_df[customer_filtered_df['Achev%']==achievment]
            for index, row in customer_filtered_df2.iterrows():
                targetqty = targetqty
                rate = row['Rate per ton']
                result_list.append((random_cutomer,targetqty, rate, achievment))
        else:
            print("No Data with the specified rate found in the DataFrame")
    else:
            print("Empty DataFrame")
    return result_list

# def getTragetQuantity():
#     cur_path = os.path.dirname(__file__)
#     os.chdir(cur_path+"\\..\\TestData")
#     a=os.getcwd()+"\\RebateDocument.xlsx"
#     fx=glob.glob(a)
#     excel_filepath=fx[0]
#     df = pd.read_excel(excel_filepath)
#     df = pd.read_excel(fx[0], sheet_name=f'Sheet1')
#     result_list = []
#     if not df.empty:
#         random_cutomer=random.choice(df['customer'].unique())
#         customer_filtered_df = df[df['customer'] == random_cutomer]
#         achievment=random.choice(customer_filtered_df['Achev%'].unique())
#         customer_filtered_df2=customer_filtered_df[customer_filtered_df['Achev%']==achievment]
#         for index, row in customer_filtered_df2.iterrows():
#             targetqty = row['target']
#             rate = row['Rate per ton']
#             result_list.append((random_cutomer,targetqty, rate, achievment))
#     else:
#             print("Empty DataFrame")
#     return result_list

def getRateGivenToCustomer(customer,scheme_number):
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')  
    result_list = []
    if not df.empty:
        filtered_df = df[df['Customer'] == int(customer)]
        if not filtered_df.empty:
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                rate_value = row['Rate']
                result_list.append((customer_value,rate_value))
        else:
            print("No Data with the specified rate found in the DataFrame")
    else:
            print("Empty DataFrame")
    return result_list[0]

#Scheme15
def getRerefenceNumber(rate, scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
    result_list = []
    if not df.empty:
        filtered_df = df[df['Rate'] == rate]
        if not filtered_df.empty:
            random_customer = random.choice(filtered_df['Customer'].unique())                
            customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
            referencenumber=random.choice(customer_filtered_df['Reference Number'].unique())
            customer_filtered_df2=customer_filtered_df[customer_filtered_df['Reference Number']==referencenumber]
            rate_value = rate               
            sum_billed_qty = customer_filtered_df2['Billed Quantity'].sum()                
            result_list.append((random_customer, referencenumber, rate_value, sum_billed_qty))
        else:
            print("No Data with the specified rate found in the DataFrame")
    else:
        print("Empty DataFrame")
    return result_list

#Scheme16
# def getCustomerAndVendor(scheme_number):
#     cur_path = os.path.dirname(__file__)
#     os.chdir(cur_path+"\\..\\TestData\\Downloads")
#     a=os.getcwd()+"\\"+scheme_number+".xlsx"
#     fx=glob.glob(a)
#     excel_filepath=fx[0]
#     df = pd.read_excel(excel_filepath)
#     df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
#     result_list = []
#     if not df.empty:
#         random_customer = random.choice(df['Customer'].unique())                
#         customer_filtered_df = df[df['Customer'] == random_customer]
#         vendor=random.choice(customer_filtered_df['Vendor'].unique())
#         customer_filtered_df2=customer_filtered_df[customer_filtered_df['Vendor']==vendor]
#         referencenumber=random.choice(customer_filtered_df2['Reference Number'].unique())
#         rate_value = customer_filtered_df2['Rate'].iloc[0]
#         sum_billed_qty = customer_filtered_df2['Billed Quantity'].sum()
#         material = customer_filtered_df2['Material'].iloc[0]
#         result_list.append((random_customer, vendor, referencenumber, rate_value, sum_billed_qty, material))
#     else:
#         print("No Data with the specified rate found in the DataFrame")
#     return result_list

def getCustomerAndVendor(scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
    result_list = []
    material = 'F01PP000DHDBLN4'
    if not df.empty:
        filtered_df = df[df['Material'] == material]
        if not filtered_df.empty:
            vendor=random.choice(filtered_df['Vendor'].unique())
            vendor_filtered_df = filtered_df[filtered_df['Vendor'] == vendor]
            random_customer = random.choice(vendor_filtered_df['Customer'].unique())             
            customer_filtered_df = vendor_filtered_df[vendor_filtered_df['Customer'] == random_customer]
            referencenumber=random.choice(customer_filtered_df['Reference Number'].unique())
            customer_filtered_df2=customer_filtered_df[customer_filtered_df['Reference Number']==referencenumber]
            rate_value = customer_filtered_df2['Rate'].iloc[0]
            sum_billed_qty = customer_filtered_df2['Billed Quantity'].sum()                
            result_list.append((random_customer,vendor, material, referencenumber, rate_value, sum_billed_qty))
        else:
            print("No Data with the specified rate found in the DataFrame")
        return result_list
    else:
        print("Empty DataFrame")

def getBilledQuantityOfVendor(vendor,scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    result_list = []
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
    if not df.empty:
        filtered_df = df[df['Vendor'] == vendor]
        if not filtered_df.empty:
            sum_billed_qty = filtered_df['Billed Quantity'].sum()
            material_df=filtered_df[filtered_df['Material'] == 'F01PP000DHDBLN4']
            rate=material_df['Rate'].iloc[0]
            result_list.append((rate, sum_billed_qty))
        else:
            print("No Data with the specified rate found in the DataFrame")
    else:
        print("Empty DataFrame")
    return result_list

def getBilledQuantityOfVendorOPC(vendor,scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    result_list = []
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
    if not df.empty:
        filtered_df = df[df['Vendor'] == vendor]
        if not filtered_df.empty:
            sum_billed_qty = filtered_df['Billed Quantity'].sum()
            material_df=filtered_df[filtered_df['Material'] == 'F01OP053DHDBLN3']
            rate=material_df['Rate'].iloc[0]
            result_list.append((rate, sum_billed_qty))
        else:
            print("No Data with the specified rate found in the DataFrame")
    else:
        print("Empty DataFrame")
    return result_list

# def getOPCMaterialAndReferenceNumberOfCustomer(scheme_number):
#     cur_path = os.path.dirname(__file__)
#     os.chdir(cur_path+"\\..\\TestData\\Downloads")
#     a=os.getcwd()+"\\"+scheme_number+".xlsx"
#     fx=glob.glob(a)
#     excel_filepath=fx[0]
#     df = pd.read_excel(excel_filepath)
#     df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
#     result_list = []
#     material = 'F01OP053DHDBLN3'
#     if not df.empty:
#         filtered_df = df[df['Material'] == material]
#         if not filtered_df.empty:
#             random_customer = random.choice(filtered_df['Customer'].unique())             
#             customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
#             referencenumber=random.choice(customer_filtered_df['Reference Number'].unique())
#             customer_filtered_df2=customer_filtered_df[customer_filtered_df['Reference Number']==referencenumber]
#             rate_value = customer_filtered_df2['Rate'].iloc[0]
#             sum_billed_qty = customer_filtered_df2['Billed Quantity'].sum()                
#             result_list.append((random_customer,material, referencenumber, rate_value, sum_billed_qty))
#         else:
#             print("No Data with the specified rate found in the DataFrame")
#         return result_list
#     else:
#         print("Empty DataFrame")

def getOPCMaterialAndReferenceNumberOfCustomer(scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
    result_list = []
    material = 'F01OP053DHDBLN3'
    if not df.empty:
        filtered_df = df[df['Material'] == material]
        if not filtered_df.empty:
            vendor=random.choice(filtered_df['Vendor'].unique())
            vendor_filtered_df = filtered_df[filtered_df['Vendor'] == vendor]
            random_customer = random.choice(vendor_filtered_df['Customer'].unique())             
            customer_filtered_df = vendor_filtered_df[vendor_filtered_df['Customer'] == random_customer]
            referencenumber=random.choice(customer_filtered_df['Reference Number'].unique())
            customer_filtered_df2=customer_filtered_df[customer_filtered_df['Reference Number']==referencenumber]
            rate_value = customer_filtered_df2['Rate'].iloc[0]
            sum_billed_qty = customer_filtered_df2['Billed Quantity'].sum()                
            result_list.append((random_customer,vendor,material, referencenumber, rate_value, sum_billed_qty))
        else:
            print("No Data with the specified rate found in the DataFrame")
        return result_list
    else:
        print("Empty DataFrame")

#Scheme17
def getRateAndCustomer(rate, scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
    result_list = []
    if not df.empty:
        filtered_df = df[df['Rate'] == rate]
        if not filtered_df.empty:
            random_customer = random.choice(filtered_df['Customer'].unique())                
            customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
            sum_billed_qty = customer_filtered_df['Billed Quantity'].sum()
            rate_value = rate                               
            result_list.append((random_customer, rate_value, sum_billed_qty))
        else:
            print("No Data with the specified rate found in the DataFrame")       
    else:
        print("Empty DataFrame")
    return result_list

def getCustomerWithRate(rate, scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    cur_path = os.path.dirname(__file__)
    os.chdir(os.path.join(cur_path, "..", "TestData", "Downloads"))    
    excel_filepath = glob.glob(os.path.join(os.getcwd(), f"{scheme_number}.xlsx"))[0]    
    # Read all sheets into a dictionary of DataFrames
    dfs = pd.read_excel(excel_filepath, sheet_name=None)    
    # Combine DataFrames from all sheets
    df = pd.concat(dfs.values(), ignore_index=True)    
    result_list = []
    if not df.empty:
        filtered_df = df[df['Rate'] == rate]
        if not filtered_df.empty:
            random_customer = random.choice(filtered_df['Customer'].unique())                
            customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
            sum_billed_qty = customer_filtered_df['Billed Quantity'].sum()
            rate_value = rate                               
            result_list.append((random_customer, rate_value, sum_billed_qty))
        else:
            print("No Data with the specified rate found in the DataFrame")       
    else:
        print("Empty DataFrame")    
    return result_list

def remove_lines():
    # Hardcoded line numbers to remove (0-based index)
    lines_to_remove = [125, 129]  # 125 and 126 are 124 and 125 in 0-based indexing    
    # Define the directory and file path
    cur_path = os.path.dirname(__file__)
    target_directory = os.path.join(cur_path, "..", "CustomReport")
    file_path = os.path.join(target_directory, "SDMS Automation Report.html")    
    # Change to the target directory
    os.chdir(target_directory)    
    # Read the file
    with open(file_path, 'r') as file:
        lines = file.readlines()    
    # Sort and reverse the lines_to_remove to avoid index shifting issues
    lines_to_remove = sorted(lines_to_remove, reverse=True)
    for line_index in lines_to_remove:
        if 0 <= line_index < len(lines):
            lines.pop(line_index)    
    # Write the updated content back to the file
    with open(file_path, 'w') as file:
        file.writelines(lines)

def replace_line_in_file(line_number, new_content):
    line_number = int(line_number)
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\CustomReport")
    a=os.getcwd()+"\\SDMS Automation Report.html" 
    with open(a, 'r') as file:
        lines = file.readlines()
    # Ensure the line number is within the valid range
    if line_number < 0 or line_number >= len(lines):
        raise IndexError("Line number out of range.")
    # Replace the line
    lines[line_number] = new_content + '\n'
    with open(a, 'w') as file:
        file.writelines(lines)

def execute_robotmetrics(output_file, report_file):
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\CustomReport")
    a=os.getcwd()+"\\SDMS Automation Report.html"
    b=os.getcwd()+"\\output.xml"
    # Construct the command
    command = [
        'robotmetrics',
        '-O', b,
        '-M', a
    ]
    
    try:
        # Run the command
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        
        # Print standard output
        print("Standard Output:")
        print(result.stdout)
        
        # Print standard error if any
        if result.stderr:
            print("Standard Error:")
            print(result.stderr)
        
        print(f"Command executed successfully. Exit code: {result.returncode}")
    
    except subprocess.CalledProcessError as e:
        # Handle errors in command execution
        print(f"Command failed with exit code {e.returncode}")
        print("Error Output:")
        print(e.stderr)
        print("Command Output:")
        print(e.stdout)

#Scheme19
def getTragetQuantityFromUploadedFile(targetqty):
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData")
    a=os.getcwd()+"\\1a1cbf18-a6f6-4b5b-be7b-e27b0105ebfc.xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'Target')
    result_list = []
    if not df.empty:
        filtered_df = df[df['target'] == targetqty]
        if not filtered_df.empty:
            random_cutomer=random.choice(filtered_df['customer'].unique())
            # customer_filtered_df = filtered_df[filtered_df['customer'] == random_cutomer]
            # achievment=random.choice(customer_filtered_df['Achev%'].unique())
            # customer_filtered_df2=customer_filtered_df[customer_filtered_df['Achev%']==achievment]
            # for index, row in customer_filtered_df2.iterrows():
            targetqty = targetqty
            # rate = row['Rate per ton']
            result_list.append((random_cutomer,targetqty))
        else:
            print("No Data with the specified rate found in the DataFrame")
    else:
            print("Empty DataFrame")
    return result_list

def getRateGivenToCustomer2(customer,scheme_number):
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')  
    result_list = []
    if not df.empty:
        filtered_df = df[df['Customer'] == int(customer)]
        if not filtered_df.empty:
            for index, row in filtered_df.iterrows():
                customer_value = row['Customer']
                rate_value = row['Rate']
                result_list.append((customer_value,rate_value))
        else:
            print("No Data with the specified rate found in the DataFrame")
    else:
            print("Empty DataFrame")
    return result_list[0]

#Scheme20
def getTargetAndRate(rate, scheme_number):
    warnings.filterwarnings("ignore", category=UserWarning, module="openpyxl")
    cur_path = os.path.dirname(__file__)
    os.chdir(cur_path+"\\..\\TestData\\Downloads")
    a=os.getcwd()+"\\"+scheme_number+".xlsx"
    fx=glob.glob(a)
    excel_filepath=fx[0]
    df = pd.read_excel(excel_filepath)
    df = pd.read_excel(fx[0], sheet_name=f'sheet 1')
    result_list = []
    if not df.empty:
        filtered_df = df[df['Rate'] == rate]
        if not filtered_df.empty:
            random_customer = random.choice(filtered_df['Customer'].unique())                
            customer_filtered_df = filtered_df[filtered_df['Customer'] == random_customer]
            # sum_billed_qty = customer_filtered_df['Billed Quantity'].sum()
            Target=customer_filtered_df['Target'].iloc[0]
            rate_value = rate                               
            result_list.append((random_customer, rate_value, Target))
        else:
            print("No Data with the specified rate found in the DataFrame")       
    else:
        print("Empty DataFrame")
    return result_list