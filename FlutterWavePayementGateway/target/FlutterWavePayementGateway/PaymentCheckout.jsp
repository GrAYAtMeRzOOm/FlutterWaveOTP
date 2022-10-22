<%@ page import="org.json.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Pasindu Raveen
  Date: 11/17/2021
  Time: 3:47 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String data = request.getAttribute("data").toString();
    System.out.println(data);
    JSONObject obj = new JSONObject(data);
    JSONObject jsonObjectData = new JSONObject(obj.get("data").toString());

    System.out.println("values in view : " + jsonObjectData);
%>
<html>
<head>
    <title>Payment checkout</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet'
          type='text/css'>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.3.2/css/simple-line-icons.css">
</head>
<body>
<style>
    body {
        background-color: #f6f9f8;
        font-family: 'Roboto', sans-serif;
    }

    a {
        color: #0e7aea;
        text-decoration: none;
    }

    h6 {
        color: #9aa3ab;
        font-weight: 300;
        line-height: 15px;
    }

    h5 {
        color: #99a1aa;
        font-weight: 300;
    }

    h4 {
        font-weight: 300;
        font-size: 13px;
        color: #97a2ad
    }

    h3 {
        color: #58636a;
        font-weight: 500;
    }

    .container {
        width: 50%;
        height: 40%;
        min-width: 636px;
        min-height: 500px;
        margin: auto;
        margin-top: 10%;
        overflow: hidden;
        border-radius: 5px 5px 5px 5px;
        -webkit-box-shadow: 0px 5px 21px 0px rgba(128,128,128,0.2);
        -moz-box-shadow: 0px 5px 21px 0px rgba(128,128,128,0.2);
        box-shadow: 0px 5px 21px 0px rgba(128,128,128,0.2);
    }

    .left {
        background-color: #1882ef;
        width: 39%;
        height: 500px;
        border-radius: 5px 0 0 5px;
        float: left;
        color: #ffffff;
    }

    .info-box {
        margin-top: 35px;
        margin-left: 35px;
        margin-right: 35px;
    }

    .receipt {
        font-weight: 300;
        font-size: 15px;
        line-height: 26px;
        padding-top: 10px;
        padding-bottom: 15px;
        border-bottom: 1px solid #3895f4;
        height: 15%;
    }

    .receipt > span {
        font-weight: 500;
        font-size: 21px;
    }

    .entry {
        border-bottom: 1px solid #3895f4;
        height: 15%;
        overflow: hidden;
        padding-top: 15px;
    }

    .entry > p {
        font-weight: 300;
        font-size: 13px;
        line-height: 26px;
        margin-top: 0px !important;
        float: left;
    }

    .entry > i {
        margin-top: 4px;
        margin-right: 13px;
        float: left;
        color: #b4d8fc;
    }

    span {
        font-weight: 500;
        font-size: 16px;
    }

    .entry:last-child {
        border-bottom: none;
    }

    .right {
        background-color: #fefefe;
        width: 61%;
        height: 100%;
        float: left;
        border-radius: 0 5px 5px 0;
    }

    .content {
        margin-top: 50px;
        margin-left: 40px;
        margin-right: 40px;
    }

    .header {
        overflow: hidden;
        border-bottom: 1px solid #d7e2e7;
        height: 50px;
    }

    .header > img {
        width: 100px;
        float: left;
    }

    .header > h4 {
        text-align: right;
        margin-top: 10px;
    }

    .main {
        margin-top: 35px;
    }

    .message {
        margin-top: 40px;
    }

    .message > p {
        font-weight: 300;
        font-size: 15px;
        color: #7a838d;
        line-height: 30px;
    }

    .message > h6 {
        margin-top: 10px;
    }

    .footer {
        overflow: hidden;
        border-top: 1px solid #d7e2e7;
        margin-top: 40px;
        padding-top: 30px;
    }

    .footer > a {
        font-size: 13px;
        font-weight: 500;
        float: left;
    }

    .footer > h6 {
        color: #7a838d;
        text-align: right;
        margin-top: 0px !important;
    }
</style>
<div class="container">
    <div class="left">
        <div class="info-box">
            <div class="receipt">
                Receipt for </br><span><%= jsonObjectData.get("full_name")%></span>
            </div>
            <div class="entry">
                <i class="icon-wallet" aria-hidden="true"></i>
                <p>Amount:</br><span><%= jsonObjectData.get("amount")%></span></p>
            </div>
            <div class="entry">
                <i class="icon-wallet" aria-hidden="true"></i>
                <p>Fee :</br><span><%= jsonObjectData.get("fee")%></span></p>
            </div>
            <div class="entry">
                <i class="icon-calendar" aria-hidden="true"></i>
                <p>Date:</br><span><%= new SimpleDateFormat("EEE, MMM d, ''yy").format(new Date())%></span></p>
            </div>
            <div class="entry">
                <i class="icon-star" aria-hidden="true"></i>
                <p>Issuer:</br><span><%= jsonObjectData.get("account_number")%> - <%= jsonObjectData.get("bank_name")%></span></p>
            </div>
            <div class="entry">
                <i class="icon-notebook" aria-hidden="true"></i>
                <p>Confirmation No:</br><span><%= jsonObjectData.get("reference")%></span></p>
            </div>
        </div>
    </div>
    <div class="right">
        <div class="content">
            <div class="header">

                <h4><%= jsonObjectData.get("created_at")%>
                </h4>
            </div>
            <div class="main">
                <h3><%= jsonObjectData.get("narration")%>
                </h3>
                <h5>Amount: <%= jsonObjectData.get("amount")%>
                </h5>
            </div>
            <div class="message">
                <p>Hello <%= jsonObjectData.get("full_name")%>,</br>You sent a payment of <%= jsonObjectData.get("amount")%> to <%= jsonObjectData.get("bank_name")%>
                </p>
                <h6>It may take a few moments for this</br>transaction to appear in your account.</h6>
            </div>
            <div class="footer">
                <h6>Invoice ID: <%= jsonObjectData.get("reference")%></h6>
            </div>
        </div>
    </div>
</div>
</body>
</html>
