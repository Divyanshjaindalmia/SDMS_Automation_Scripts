import mysql.connector
import calendar
import Utility
import numpy as np
from mysql.connector import Error
from datetime import datetime,timedelta
from dateutil.relativedelta import relativedelta

def connectandfetch(customerId, fromDate, toDate):
        # customerId='000'+customerId
        connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
        if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerId,fromDate,toDate)
            cursor = connection.cursor()
            cursor.execute("SELECT kunag,sum(FKIMG_I) FROM sdms.wb2_v_vbrk_vbrp2 where kunag=%s and FKDAT between %s and %s and fkart not in ('ZCFR','ZCMR','ZDMR','ZDFR','S2','ZLIT');",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                sumOfBilledQuantity=row[1]
                print(row[1])
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
        return  sumOfBilledQuantity

def fetchCHARG_IfromDB(customerId, fromDate, toDate):
        connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
        if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerId,fromDate,toDate)
            cursor = connection.cursor()
            cursor.execute("SELECT CHARG_I FROM sdms.wb2_v_vbrk_vbrp2 where kunag=%s and FKDAT between %s and %s and CHARG_I like '%-R-%' and fkart not in ('ZCFR','ZCMR','ZDMR','ZDFR','S2','ZLIT') and rfbsk='C';",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            if rows:
                charg_I = rows[0][0]
                print(charg_I)
            else:
                print("No rows found")
                return None
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
        return  charg_I

def fetchReferenceDateandChargFromDB(charg,plant,material):
    connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
            print('Connected to MySQL database')
            params=(charg,plant,material)
            cursor = connection.cursor()
            cursor.execute("SELECT CHARG,BUDAT_MKPF,MATNR,WERKS FROM sdms.MSEG where CHARG=%s and WERKS=%s and MATNR=%s;",params)
            rows = cursor.fetchall()
            print(rows)
            print('Total Row(s):', cursor.rowcount)
            if rows:
                sorted_rows = sorted(rows, key=lambda x: x[1], reverse=True)
                BUDAT_MKPF = sorted_rows[0][1]
                print(BUDAT_MKPF)
            else:
                print("No rows found")
                return None
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
    return  BUDAT_MKPF

#Scheme8
def fetchtargetquantityfromDB(customerId, fiscalmonth, fiscalyear, material):
    connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerId,fiscalmonth, fiscalyear, material)
            cursor = connection.cursor()
            cursor.execute("select sum(TARGET_QTY) from sdms.zsd_target where KUNNR = %s and FISCAL_MONTH = %s and FISCAL_YEAR = %s and MATNR = %s;",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                targetQuantity=row[0]
                print(targetQuantity)
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
    return  targetQuantity

#Scheme9
def fetchVBELNfromDB(customerId, fromDate, toDate):
    connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerId, fromDate, toDate)
            cursor = connection.cursor()
            cursor.execute("select VBELN from sdms.wb2_v_vbrk_vbrp2 where 1=1 and kunag = %s and fkart not IN ('ZLIT') and fkdat Between %s and %s and fkart not in ('ZCFR','ZCMR','ZDMR','ZDFR','S2') and rfbsk = 'C';",params)
            rows = cursor.fetchall()
            # print('Total Row(s):', cursor.rowcount)
            # print(rows)
            for row in rows:
                VBELN=row[0]
                print(VBELN)
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
    return  VBELN
     
def fetchsubdealerfromDB(VBELN,PARVW):
    subdealer=None
    connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
            print('Connected to MySQL database')
            params=(VBELN, PARVW)
            cursor = connection.cursor()
            cursor.execute("SELECT KUNNR FROM sdms.vbpa where VBELN = %s and PARVW = %s;",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                subdealer=row[0]
                print(subdealer)
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
    return  subdealer

def fetchbilledqtyofsubdealer(customerid, fromdate, todate):
    result_list=[]
    connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerid, fromdate, todate)
            cursor = connection.cursor()
            cursor.execute("SELECT vp.kunnr, SUM(v.fkimg_i) as total_fkimg_i FROM sdms.wb2_v_vbrk_vbrp2 v JOIN sdms.vbpa vp ON v.VBELN = vp.VBELN WHERE 1=1 AND v.kunag = %s AND v.fkart NOT IN ('ZLIT', 'ZCFR', 'ZCMR', 'ZDMR', 'ZDFR', 'S2') AND v.fkdat BETWEEN %s AND %s AND v.rfbsk = 'C' AND vp.PARVW = 'WE' GROUP BY vp.kunnr HAVING count(Distinct v.VBELN)>1;",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                result_list.append(row)
                # Qty=row[1]
                # print(Qty)
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
    return  result_list

#Scheme12
def fetchBilledQuantity(customerId, material, fromDate, toDate):
        customerId='000'+customerId
        connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
        if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerId,material,fromDate,toDate)
            cursor = connection.cursor()
            # material=np.int64(material)
            # material = int(material)
            cursor.execute("SELECT kunag,sum(FKIMG_I) FROM sdms.wb2_v_vbrk_vbrp2 where kunag=%s and MATNR_I=%s and FKDAT between %s and %s and fkart not in ('ZCFR','ZCMR','ZDMR','ZDFR','S2','ZLIT');",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                sumOfBilledQuantity=row[1]
                print(row[1])
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
        return  sumOfBilledQuantity

def fetchbilledqtyforprevdate(customerId, fromDate, toDate):
        customerId = str(customerId)
        customerId='000'+customerId
        connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
        if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerId,fromDate,toDate)
            cursor = connection.cursor()
            cursor.execute("SELECT kunag,sum(FKIMG_I) FROM sdms.wb2_v_vbrk_vbrp2 where kunag=%s and FKDAT between %s and %s and fkart not in ('ZCFR','ZCMR','ZDMR','ZDFR','S2','ZLIT');",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                sumOfBilledQuantity=row[1]
                print(row[1])
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
        return  sumOfBilledQuantity

def getTruckDetailsFromDB(referencenumber):
    connection = mysql.connector.connect(
        host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
        database='sdms',  # MySQL database name
        user='V-Arjaguttu.Kalyani',  # MySQL username
        password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
        print('Connected to MySQL database')
        params=(referencenumber,)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM sdms.vttk vk where tknum in (SELECT TKNUM FROM vttp WHERE VBELN IN (SELECT VGBEL_I FROM wb2_v_vbrk_vbrp2 WHERE VBELN =%s));",params)
        rows = cursor.fetchall()
        count=cursor.rowcount
        print('Total Row(s):', cursor.rowcount)
        print(rows)
        if count>0:
            return count
        else:
            return 0
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")

#Scheme16
def getVendorDetailsFromDB(customer,vendor):
    customer = str(customer)
    customer='00'+customer
    connection = mysql.connector.connect(
        host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
        database='sdms',  # MySQL database name
        user='V-Arjaguttu.Kalyani',  # MySQL username
        password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
        print('Connected to MySQL database')
        params=(customer,vendor)
        cursor = connection.cursor()
        cursor.execute("SELECT KUNNR,PARVW,LIFNR FROM sdms.knvp where KUNNR=%s and LIFNR=%s;",params)
        rows = cursor.fetchall()
        count=cursor.rowcount
        print('Total Row(s):', cursor.rowcount)
        print(rows)
        if count>0:
            return rows
        else:
            return 0             
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")

def getMediumOfMaterial(material):
    connection = mysql.connector.connect(
        host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
        database='sdms',  # MySQL database name
        user='V-Arjaguttu.Kalyani',  # MySQL username
        password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
        print('Connected to MySQL database')
        params=(material,)
        cursor = connection.cursor()
        cursor.execute("select MEDIUM from sdms.mara where MATNR = %s;",params)
        rows = cursor.fetchall()
        print('Total Row(s):', cursor.rowcount)
        print(rows)
        for row in rows:
            medium=row[0]   
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
    return  medium

def getBilledQtyUsingVBELN(vbeln,customer):
    result_list=[]
    customer = str(customer)
    customer='00'+customer
    connection = mysql.connector.connect(
        host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
        database='sdms',  # MySQL database name
        user='V-Arjaguttu.Kalyani',  # MySQL username
        password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
        print('Connected to MySQL database')
        params=(vbeln,customer)
        cursor = connection.cursor()
        cursor.execute("select KUNAG,FKIMG_I from sdms.wb2_v_vbrk_vbrp2 where VBELN=%s and KUNAG=%s;",params)
        rows = cursor.fetchall()
        print('Total Row(s):', cursor.rowcount)
        print(rows)
        for row in rows:
            result_list.append(row)  
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
    return  result_list
     
#Scheme17
def getTargetQuantityFromDBForScheme17(customer, fiscalmonth,fiscalyear):
    customer = str(customer)
    customer='000'+customer
    connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
    if connection.is_connected():
            print('Connected to MySQL database')
            params=(customer,fiscalmonth, fiscalyear)
            cursor = connection.cursor()
            cursor.execute("select sum(TARGET_QTY) from sdms.zsd_target where KUNNR2 = %s and FISCAL_MONTH = %s and FISCAL_YEAR = %s;",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                targetQuantity=row[0]
                print(targetQuantity)
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
    return  targetQuantity

def getBilledQtyToCalculateAchievementPer(customerId, fromDate, toDate):
        customerId = str(customerId)
        customerId='000'+customerId
        connection = mysql.connector.connect(
            host='maz1-sdms-qa.csu5fsifbtqb.ap-south-1.rds.amazonaws.com',  # MySQL server address
            database='sdms',  # MySQL database name
            user='V-Arjaguttu.Kalyani',  # MySQL username
            password='8rLxFJ3e@$@DsC(MmtQf')  # MySQL password
        if connection.is_connected():
            print('Connected to MySQL database')
            params=(customerId,fromDate,toDate)
            cursor = connection.cursor()
            cursor.execute("SELECT kunag,sum(FKIMG_I) FROM sdms.wb2_v_vbrk_vbrp2 where kunag=%s and FKDAT between %s and %s and fkart not in ('ZCFR','ZCMR','ZDMR','ZDFR','S2','ZLIT') and rfbsk in ('C');",params)
            rows = cursor.fetchall()
            print('Total Row(s):', cursor.rowcount)
            print(rows)
            for row in rows:
                sumOfBilledQuantity=row[1]
                print(row[1])
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
        return  sumOfBilledQuantity

#used in scheme1 db validation
# def getreferencefromdate():
#     current_date = datetime.now()
#     formatted_date = current_date.strftime("%Y-%m-01")
#     return formatted_date

# def getreferencetodate():
#     current_date = datetime.now()
#     first_of_next_month = current_date.replace(day=28) + timedelta(days=4)  # Go to the 28th to ensure month change
#     last_of_current_month = first_of_next_month - timedelta(days=1)
#     formatted_date = last_of_current_month.strftime("%Y-%m-%d")
#     return formatted_date

def getreferencefromdate():
    today = datetime.now()
    first_day_of_current_month = today.replace(day=1)
    first_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    first_day_of_previous_month = first_day_of_previous_month.replace(day=1)
    formatted_date = first_day_of_previous_month.strftime("%Y-%m-%d")
    return formatted_date

def getreferencetodate():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    # last_day_of_previous_month = datetime(last_day_of_current_month.year, last_day_of_current_month.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%Y-%m-%d")
    return formatted_date

def preperiodfromdateIntoDB():
    today = datetime.today()
    two_months_ago = today - timedelta(days=60)
    first_day_of_two_months_ago = datetime(two_months_ago.year, two_months_ago.month, 1)
    formatted_date = first_day_of_two_months_ago.strftime("%Y-%m-%d")
    return formatted_date

def preperiodtodateIntoDB():
    today = datetime.today()
    two_months_ago = today - timedelta(days=30)
    first_day_of_two_months_ago = datetime(two_months_ago.year, two_months_ago.month, 1)
    last_day_of_two_months_ago = first_day_of_two_months_ago.replace(day=1) - timedelta(days=1)
    formatted_date = last_day_of_two_months_ago.strftime("%Y-%m-%d")
    return formatted_date

def getfromdatetocalculateIncrement():
    today = datetime.now()
    first_day_of_current_month = today.replace(day=1)
    first_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    first_day_of_previous_month = first_day_of_previous_month.replace(day=1)
    formatted_date = first_day_of_previous_month.strftime("%Y-%m-%d")
    return formatted_date

def gettodatetocalculateIncrement():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    # last_day_of_previous_month = datetime(last_day_of_current_month.year, last_day_of_current_month.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%Y-%m-%d")
    return formatted_date

def getprevfromdatetocalculateIncrement():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    # last_day_of_previous_month = datetime(last_day_of_current_month.year, last_day_of_current_month.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("2023-%m-%d")
    return formatted_date

def getprevtodatetocalculateIncrement():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    # last_day_of_previous_month = datetime(last_day_of_current_month.year, last_day_of_current_month.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("2023-%m-%d")
    return formatted_date

def getfromdateforscheme5forDB():
    current_date = datetime.now()
    formatted_date = current_date.strftime("%Y-%m-10")
    return formatted_date

def gettodateforscheme5forDB():
    currentdate=datetime.now()
    futuredate = currentdate.strftime("%Y-%m-12")
    return futuredate

def getfromdateforscheme5aForDB():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=10)
    formatted_date = target_date.strftime("%Y-%m-%d")
    return formatted_date

def gettodateforscheme5aForDB():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=12)
    formatted_date = target_date.strftime("%Y-%m-%d")
    return formatted_date

def getfromdateforscheme7forDB():
    current_date = datetime.now()
    last_year = current_date.year - 1
    april_1_last_year = datetime(last_year, 4, 1)
    formatted_date = april_1_last_year.strftime("%Y-%m-%d")
    return formatted_date

def gettodateforscheme7ForDB():
    current_date = datetime.now()
    last_year = current_date.year - 1
    april_1_last_year = datetime(last_year, 4, 1)
    one_year = timedelta(days=365)  # Assuming a non-leap year
    date_after_one_year = april_1_last_year + one_year
    formatted_date = date_after_one_year.strftime("%Y-%m-%d")
    return formatted_date

#scheme8
def getfiscalmonth():
    today = datetime.today()
    first_day_of_this_month = today.replace(day=1)
    last_day_of_previous_month = first_day_of_this_month - timedelta(days=1)
    first_day_of_previous_month = last_day_of_previous_month.replace(day=1)
    return first_day_of_previous_month.strftime("%m")

def getfiscalyear():
    today = datetime.today()
    first_day_of_this_month = today.replace(day=1)
    last_day_of_previous_month = first_day_of_this_month - timedelta(days=1)
    first_day_of_previous_month = last_day_of_previous_month.replace(day=1)
    return first_day_of_previous_month.strftime("%Y")

def getfromdateforscheme8ForDB():
    today = datetime.now()
    first_day_of_current_month = today.replace(day=1)
    first_day_of_previous_month = first_day_of_current_month - timedelta(days=1)
    first_day_of_previous_month = first_day_of_previous_month.replace(day=1)
    formatted_date = first_day_of_previous_month.strftime("%Y-%m-%d")
    return formatted_date

def gettodateforscheme8ForDB():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    # last_day_of_previous_month = datetime(last_day_of_current_month.year, last_day_of_current_month.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%Y-%m-%d")
    return formatted_date

def getfromreferencedateforscheme10():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=21)
    formatted_date = target_date.strftime("%Y-%m-%d")
    return formatted_date

def gettoreferencedateforscheme10():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 1)
    target_date = previous_month.replace(day=30)
    formatted_date = target_date.strftime("%Y-%m-%d")
    return formatted_date

def getpreperiodfromdateforscheme13():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month-1, 1)
    formatted_date = last_day_of_current_month.strftime("%Y-%m-%d")
    return formatted_date

def getpreperiodtodateforscheme13():
    current_date = datetime.now()
    last_day_of_current_month = datetime(current_date.year, current_date.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%Y-%m-%d")
    return formatted_date

def getprevfromdateforscheme13forDB():
    current_date = datetime.now()
    next_year = current_date - timedelta(days=365)
    first_day_next_year = datetime(next_year.year, current_date.month-1, 1)
    formatted_date = first_day_next_year.strftime("%Y-%m-%d")    
    return formatted_date

def getprevtodateforscheme13forDB():
    current_date = datetime.now()
    next_year = current_date - timedelta(days=365)
    last_day_of_current_month = datetime(next_year.year, current_date.month, 1) - timedelta(days=1)
    formatted_date = last_day_of_current_month.strftime("%Y-%m-%d")
    return formatted_date

def getfromdateforscheme20forDB():
    current_date = datetime.now()    
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 2)
    target_date = previous_month.replace(day=10)
    formatted_date = target_date.strftime("%Y-%m-%d")
    return formatted_date

def gettodateforscheme20forDB():
    current_date = datetime.now() 
    # Calculate previous month
    if current_date.month == 1:
        previous_month = current_date.replace(year=current_date.year - 1, month=12)
    else:
        previous_month = current_date.replace(month=current_date.month - 2)
    target_date = previous_month.replace(day=19)
    formatted_date = target_date.strftime("%Y-%m-%d")
    return formatted_date

def getpreperiodfromdateforscheme20forDB():
    today = datetime.today()
    first_day_of_current_year = datetime(today.year, 1, 1)
    formatted_date = first_day_of_current_year.strftime("%Y-%m-%d")
    return formatted_date

def getpreperiodtodateforscheme20forDB():
    today = datetime.today()
    first_day_of_current_year = datetime(today.year, 1, 1)
    target_date = first_day_of_current_year + relativedelta(months=7)
    # Get the last day of the month of the target date
    last_day_of_month = target_date.replace(day=1) + relativedelta(months=1) - relativedelta(days=1)
    formatted_date = last_day_of_month.strftime("%Y-%m-%d")
    return formatted_date