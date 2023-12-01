<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add</title>
  <style>
    /* Add your CSS styles here */
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
    }

    form {
      width: 50%;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
    }

    table tr td {
      padding: 10px 0;
    }

    input[type="text"],
    textarea {
      width: calc(100% - 20px);
      padding: 8px;
      border-radius: 3px;
      border: 1px solid #ccc;
      margin-bottom: 10px;
    }

    input[type="submit"],
    input[type="button"] {
      padding: 8px 20px;
      border: none;
      border-radius: 3px;
      background-color: #007bff;
      color: #fff;
      cursor: pointer;
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<h1>Add New Post</h1>
<form action="addok" method="post">
  <table id = "edit">
    <tr><td>Category:</td><td><input type="text" name="category"/></td></tr>
    <tr><td>Workname:</td><td><input type="text" name="workname"/></td></tr>
    <tr><td>Workplace:</td><td><input type="text" name="workplace"/></td></tr>
    <tr><td>Deadline:</td><td><input type="text" name="deadline"/></td></tr>
    <tr><td>Note:</td><td><textarea cols="50" rows="5" name="note"></textarea></td></tr>

  </table>
  <button type="button" onclick="location.href='list'">list</button>
  <button type="submit">add</button>
</form>
</body>
</html>