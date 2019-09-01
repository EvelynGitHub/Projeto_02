<%-- 
    Document   : amortizacao-constante
    Created on : 28/08/2019, 19:16:51
    Author     : natal
--%>

<%@page import="java.util.InputMismatchException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>

    <body>

        <div style='border: black 1px; background-color: #C0C0C0'>
             <%@include file='WEB-INF/jspf/header.jspf' %>
        </div>
            <h1 align='center'>Amortização Constante</h1>
            <hr style='width: 100%'>
        <br>

<%---- FORMULÁRIO ----%>
        
        <div style='width: 100%'>
            <form action='amortizacao-constante.jsp'>

                <label style='margin-left: 20px'>Valor: </label> <input name='v' type='text' style='margin-left: 20px; opacity: 0.8; border: solid 1px black' placeholder='Insira o valor monetário...'>
                <label style='margin-left: 20px'>Prestações: </label> <input name='m' type='text' style='margin-left: 20px; opacity: 0.8; border: solid 1px black' placeholder='Insira quantos meses...'>
                <label style='margin-left: 20px'>Taxa de Juros: </label> <input name='i' type='text' style='margin-left: 20px; opacity: 0.8; border: solid 1px black' placeholder='Insira a taxa mensal...'>
                <input type='submit' name='enviar' value='Calcular' style='margin-left: 40px'>

            </form>
        </div>    

<%---- PARÂMETROS ----%>

        <% if (request.getParameter("enviar") != null) { %>
        <% try { %>
        <% int v = Integer.parseInt(request.getParameter("v")); %>
        <% int m = Integer.parseInt(request.getParameter("m")); %>
        <% double i = Double.parseDouble(request.getParameter("i")); %>
        <% double j = 0; %>
        <% double s = 0; %>
        <% double p = 0; %>
        <% double ts = 0; %>
        <% double ta = 0; %>
        <% double tj = 0; %>
        <% double tp = 0; %>
        <% double a = (v / m); %>


        <br><br>

<%---- TABELA ----%>
<div> 
        <table border="3" style='width: 100%'>
            <tr>
                <th style='background-color:#C0C0C0'>Meses</th>
                <th style='background-color:#C0C0C0'>Saldo Devedor</th>
                <th style='background-color:#C0C0C0'>Amortização</th>
                <th style='background-color:#C0C0C0'>Juros</th>
                <th style='background-color:#C0C0C0'>Prestação</th>

                <% for (int c = 0; c <= m; c++) { %>

            <tr>

            <tr>
                <%if (c == 0) {%>
            <tr>
                <td style="text-align: center"><%= c%></td>
                <td style="text-align: center">R$ <%= v%></td>
                <td style="text-align: center">R$ <%= 0.0%></td>
                <td style="text-align: center">R$ <%= j%></td>
                <td style="text-align: center">R$ <%= p%></td>
            </tr>

            <% } else {%>

            <td style='margin-left: 5px; text-align: center'><%= c%></td>

            <%if (s == 0) {%>
            <td style="text-align: center">R$ <%= s = v - a%></td>
            <%Math.round(s);%> 
            <% } else {%>     
            <td style="text-align: center">R$ <%= s = s - a%></td>
            <% Math.round(s);%> 

            <% } %> 

            <% ta = ta;%>
            <% tj = (tj + j);%>
            <% tp = (tp + p);%>

            <td style="text-align: center">R$ <%= a%></td>

            <td style="text-align: center">R$ <%= j = ((s + a) * i / 100)%></td>
            <%Math.round(j);%>

            <td style="text-align: center">R$ <%= p = (a + j)%></td>
            <%Math.round(p);%>

        </tr>

        <% } %>
    <% }%>

        <tr>
            <th style="text-align: center">Total</th>
            <td style="text-align: center"><%= "-"%></td>
            <td style="text-align: center">R$ <%= a * m%></td>
            <td style="text-align: center">R$ <%= tj + j%></td>
            <td style="text-align: center">R$ <%= tp + p%></td>
        </tr>
    </table>
</div>
<%---- EXCEPTION ----%>        
        
    <% } catch (Exception ex) {%>
    <br><br><br>
    <h1 style="color: red; text-align: center"> Insira um parâmetro válido! <%=ex.getMessage()%></h1>
    <% } %>
    <% } else { %>
    <br>
    <h3 style='text-align: center'>Preencha o Formulário!</h3>
    <% }%> 

            <%@include file='WEB-INF/jspf/footer.jspf' %>
</body>

</html>

