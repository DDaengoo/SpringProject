<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<!--
<head>
  <meta http-equiv="Content-Type" con
  tent="text/html; charset=ISO-8859-1">
  <title>free board</title>

  <style>
    #list {
      font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }
    #list td, #list th {
      border: 1px solid #ddd;
      padding: 8px;
      text-align:center;
    }
    #list tr:nth-child(even){background-color: #f2f2f2;}
    #list tr:hover {background-color: #ddd;}
    #list th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: center;
      background-color: #006bb3;
      color: white;
    }
  </style>
  <script>
    function delete_ok(id){
      var a = confirm("정말로 삭제하겠습니까?");
      if(a) location.href='deletepost.jsp?id=' + id;
    }
  </script>
</head>
-->
<body>
<h1>일정관리프로그램</h1>
<table id="list" width="90%">
  <tr>
    <th>Seq</th>
    <th>Category</th>
    <th>Workname</th>
    <th>Workplace</th>
    <th>deadline</th>
    <th>note</th>
    <th>Regdate</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <c:forEach items="${list}" var="u">
    <tr>
      <td>${u.seq}</td>
      <td>${u.category}</td>
      <td>${u.workname}</td>
      <td>${u.workplace}</td>
      <td>${u.deadline}</td>
      <td>${u.note}</td>
      <td>${u.regdate}</td>
      <td><a href="editform/${u.seq}">Edit</a></td>
      <td><a href="javascript:delete_ok('${u.seq}')">Delete</a></td>
    </tr>
  </c:forEach>
</table>
<br/><button type="button" onclick="location.href='add'"> Add New Post</button>
</body>
</html>