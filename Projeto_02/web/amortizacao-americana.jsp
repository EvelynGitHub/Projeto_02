<%-- 
    Document   : amortizacao-americana
    Created on : 27/08/2019, 21:53:31
    Author     : evelyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto_02</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Amortização Americana</h1>
        
        <div class="container">
            <div class="esquerda">
                <form>
                    Valor da divida: <br> <input type="text" name="vl_divida"/> <br>
                    Qauntidade de prestações: <br> <input type="text" name="qt_prestacao"/> <br>
                    Valor dos Juros: <br> <input type="text" name="pc_juros" placeholder="Taxa de juros ao mês"/> <br>
                    <input type="submit" name="amortizacao_americana" value="Calcular"/>               
                </form>
            </div>
            <div class="direita">
                <%if (request.getParameter("amortizacao_americana") == null) {%>
                <h1>Por favor, preencha o formulario!</h1>
                <%} else {
                    Double divida = Double.parseDouble(request.getParameter("vl_divida"));
                    Double prestacao = Double.parseDouble(request.getParameter("qt_prestacao"));
                    Double juros = Double.parseDouble(request.getParameter("pc_juros"));

                    Double amortizacao = divida ;// prestacao;
                    Double juro = divida * juros /100;
                %>
                <h2>Valor da amortização:</h2> 
                <h4>R$ <%=amortizacao%></h4>
                <h2>Valor dos juros:</h2> 
                <h4>R$ <%=juro%></h4>

                <%}%>
            </div>
        </div>
        
        
        
    </body>
</html>
