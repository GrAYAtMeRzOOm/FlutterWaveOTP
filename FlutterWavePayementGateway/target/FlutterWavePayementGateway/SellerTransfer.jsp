<%@ page import="java.util.UUID" %><%--
  Created by IntelliJ IDEA.
  User: Pasindu Raveen
  Date: 11/17/2021
  Time: 2:16 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h1>Seller Bank Transfer</h1>
    <hr>
    <%--    <form onsubmit="return false" id="sellerTrasnfer" class="row g-3">--%>
    <form method="post" action="servlettransfer" class="row g-3">
        <input name="reference" type="hidden" value="<%= UUID.randomUUID()+"-ARC-EXON-SELLER" %>">
        <div class="col-md-6">
            <label for="bankNo" class="form-label">Bank No</label>
            <input type="hidden" name="account_bank" id="account_bank" value="044">
            <select onchange="setId()" id="bankNo" class="form-select">
                <option selected>Access Bank</option>
                <option>Ecobank</option>
                <option>Fidelity Bank</option>
                <option>First Bank of Nigeria</option>
                <option>First City Monument Bank (FCMB)</option>
                <option>GTBank</option>
                <option>Heritage Bank</option>
                <option>Keystone Bank</option>
                <option>Stanbic IBTC Bank</option>
                <option>Sterling Bank</option>
                <option>Union Bank</option>
                <option>United Bank for Africa</option>
                <option>Unity Bank</option>
                <option>VFD Microfinance Bank</option>
                <option>Wema Bank</option>
                <option>Zenith Bank</option>
            </select>
        </div>
        <div class="col-md-6">
            <label for="accountNo" class="form-label">Account No</label>
            <input name="account_number" type="number" class="form-control" id="accountNo">
        </div>
        <div class="col-12">
            <label for="amount" class="form-label">Amount</label>
            <input name="amount" type="number" class="form-control" id="amount" placeholder="">
        </div>
        <div class="col-12">
            <label for="narration" class="form-label">Narration</label>
            <input name="narration" type="text" class="form-control" id="narration" placeholder="">
        </div>
        <div class="col-md-6">
            <label for="currency" class="form-label">Currency</label>
            <select name="currency" id="currency" class="form-select">
                <option selected>NGN</option>
                <option>USD</option>
                <option>MAD</option>
                <option>MZN</option>
                <option>SOL</option>
                <option>RWF</option>
                <option>SLL</option>
                <option>XAF</option>
                <option>XOF</option>
            </select>
        </div>
        <div class="col-md-6">
            <label for="debit_currency" class="form-label">Debit Currency</label>
            <select name="debit_currency" id="debit_currency" class="form-select">
                <option selected>NGN</option>
                <option>USD</option>
                <option>MAD</option>
                <option>MZN</option>
                <option>SOL</option>
                <option>RWF</option>
                <option>SLL</option>
                <option>XAF</option>
                <option>XOF</option>
            </select>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Transfer</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.3.2/uuid.min.js"
        integrity="sha512-UNM1njAgOFUa74Z0bADwAq8gbTcqZC8Ej4xPSzpnh0l6KMevwvkBvbldF9uR++qKeJ+MOZHRjV1HZjoRvjDfNQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>
    function setId() {
        console.log("Value : " + $("#bankNo").prop('selectedIndex'));
        if ($("#bankNo").prop('selectedIndex') === 0) {
            $("#account_bank").val("044");
        }
        if ($("#bankNo").prop('selectedIndex') === 1) {
            $("#account_bank").val("050");
        }
        if ($("#bankNo").prop('selectedIndex') === 2) {
            $("#account_bank").val("070");
        }
        if ($("#bankNo").prop('selectedIndex') === 3) {
            $("#account_bank").val("011");
        }
        if ($("#bankNo").prop('selectedIndex') === 4) {
            $("#account_bank").val("214");
        }
        if ($("#bankNo").prop('selectedIndex') === 5) {
            $("#account_bank").val("058");
        }
        if ($("#bankNo").prop('selectedIndex') === 6) {
            $("#account_bank").val("030");
        }
        if ($("#bankNo").prop('selectedIndex') === 7) {
            $("#account_bank").val("082");
        }
        if ($("#bankNo").prop('selectedIndex') === 8) {
            $("#account_bank").val("221");
        }
        if ($("#bankNo").prop('selectedIndex') === 9) {
            $("#account_bank").val("232");
        }
        if ($("#bankNo").prop('selectedIndex') === 10) {
            $("#account_bank").val("032");
        }
        if ($("#bankNo").prop('selectedIndex') === 11) {
            $("#account_bank").val("033");
        }
        if ($("#bankNo").prop('selectedIndex') === 12) {
            $("#account_bank").val("215");
        }
        if ($("#bankNo").prop('selectedIndex') === 13) {
            $("#account_bank").val("090110");
        }
        if ($("#bankNo").prop('selectedIndex') === 14) {
            $("#account_bank").val("035");
        }
        if ($("#bankNo").prop('selectedIndex') === 15) {
            $("#account_bank").val("057");
        }
        console.log("Sending value : " + $("#account_bank").val());
    }


    $(document).ready(function () {

        $("#sellerTrasnfer").on("submit", function (event) {
            event.preventDefault();
            //let f = new FormData(this);
            const id = uuid.v4();
            let d = {};
            d["amount"] = $("#amount").val();
            d["reference"] = id + "-ARC-EXON-SELLER";
            d["account_bank"] = $("#bankNo").val();
            d["narration"] = $("#narration").val();
            d["account_number"] = $("#accountNo").val();
            d["currency"] = $("#currency").val();
            d["debit_currency"] = $("#debit_currency").val();
            console.log(d);
            $.ajax({
                type: "POST",
                url: "servlettransfer",
                data: d,
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                    $.alert({
                        title: "Sucessfully Transfered",
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $.alert({
                        title: "Error",
                        content: errorThrown,
                    });
                    console.log("Error :" + errorThrown);
                    console.log(textStatus);
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>
</body>
</html>
