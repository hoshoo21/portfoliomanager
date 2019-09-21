<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UserManage.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap/js/jquery-2.2.4.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {



            var utility = new Object();
            utility.bulkData = JSON.stringify(
                { "SNO": 33, "COMPANY_SYMBOL": "ABT", "COMPANY_NAME": null, "COMPANY_CIK": "0000001800", "REGISTRATION_NUMBER": null, "NTN": " ", "INDUSTRY_DESC": "Pharmaceutical Preparations", "SECTOR_DESC": "Healthcare", "FINANCIAL_YEAR": null, "MARKET_PRICE_PER_SHARE": 0, "PE": 0, "MC": 0, "LFLAG": "LOCK", "ACTION_TYPE": null, "APPROVAL": null, "OCLAUSE": null, "STRUCTURE_DESCRIPTION": "Surgical and Medical Instrument Manufacturing", "PERFWEEK": 0, "PERFMONTH": 0, "PERFQTR": 0, "PERFHALF": 0, "PERFYEAR": 0, "VOLWEEK": 0, "VOLMON": 0, "VOLUME2": 0, "AVGVOLUME": 0, "RELVOLUME": 0, "PRICE": 0, "CHANGEVAL": 0, "TRUERANGE": 0, "ATR": 0, "TYPICALPRICE": 0, "SMA20": 0, "SMA201": 0, "SMA50": 0, "SMA200": 0, "WHIGH52": 0, "WLOW52": 0, "VOLUME": 0, "PRICE1": 0, "CHANGEVAL1": 0, "BETA": 0, "RSI": 0, "UPPERBAND": 0, "LOWERBAND": 0, "MAV": 0, "KFAST": 0, "DFAST": 0, "KSLOW": 0, "DSLOW": 0, "CS1": "ABT", "CN": null, "CIK": "0000001800", "RN": null, "RETURN_ON_ASSETS": 0, "RETURN_ON_EQUITY": 0, "RETURN_ON_INCOME": 0, "GROSSM": 0, "OPENM": 0, "CURRENT_RATIO": 0, "QUICK_RATIO": 0, "DEBT_TO_TOTAL_ASSETS": 1, "DEBT_TO_EQUITY": 1, "MKT_CAP": 0, "PE1": 0, "PS": 0, "PBV": 0, "FCF": 0, "PFCF": 0, "LTDEQ": 0, "STDEQ": 0, "DIVIDEND": 0, "SALES_GROWTH": 0, "NET_INCOME_GROWTH": 0, "ASSET_GROWTH": 0, "RECEIVABLE_TURNOVER": 0, "INVENTORY_TURNOVER": 0, "FIXED_ASSET_TURNOVER": 0, "GROSS_PROFIT_SALES": 0, "PROFIT_MARGIN": 0, "DAYS_PAYABLE_OUTSTANDING": 0, "TIMES_INTEREST_EARNED_ACCRUAL": 0, "TIMES_INTEREST_EARNED_CASH": 0, "BAD_DEBT_EXPENSE_PERCENTAGE": 0, "ALLOWANCE_PERCENTAGE": 0, "AR_TOTAL_ASSETS": 0, "DAYS_OF_RECEIVABLE": 0, "DIV_PAY_RATIO": 100, "TOT_STK_RTN": 100, "PRI_ERN_RATIO": 1, "FWDPE": 0, "PEG": 0, "EPSP5Y": 0, "EPSN5Y": 0, "SALEP5Y": 0, "EPSY": 0, "REVENUE": 0 });


            $.ajax({
                url: '/api/XBRL/SaveDuplicateClient',
                type: 'POST',
                dataType: 'json',
                data: utility,
                success: function (data, textStatus, xhr) {

                },
                error: function (xhr, textStatus, errorThrown) {

                }
            });

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
