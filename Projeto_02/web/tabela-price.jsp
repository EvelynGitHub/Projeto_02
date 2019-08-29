<%-- 
    Document   : tabela-price
    Created on : 27/08/2019, 21:55:43
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
        <h1>Tabela Price</h1>
        
        
        <div class="container">
            <div class="esquerda">
                <form>
                    Valor do emprestimo: <br> <input type="text" name="vl_divida"/> <br>
                    Qauntidade de prestações: <br> <input type="text" name="qt_prestacao"/> <br>
                    Valor dos Juros: <br> <input type="text" name="pc_juros" placeholder="Taxa de juros ao mês"/> <br>
                    <input type="submit" name="tabela" value="Calcular"/>               
                </form>
            </div>
            <div class="direita">
                <%if (request.getParameter("tabela") == null) {%>
                <h1>Por favor, preencha o formulario!</h1>
                <%} else {
                    Double emprestimo = Double.parseDouble(request.getParameter("vl_divida"));
                    Double prestacao = Double.parseDouble(request.getParameter("qt_prestacao"));
                    Double juros = Double.parseDouble(request.getParameter("pc_juros"));
                    Double j = juros/100;
                   /* Double amortizacao = divida ;// prestacao;
                    Double juro = divida * juros /100;*/
                    
                    Double pmt = emprestimo * ((Math.pow((1+j), prestacao)*j)/(Math.pow((1+j), prestacao)-1));
                %>
                <h2>Valor da amortização:</h2> 
                <h4>R$ <%=pmt%></h4>
                <h2>Valor dos juros:</h2> 
                <h4>R$ </h4>

                <%}%>
            </div>
        </div>
        
        
        
        
        
    </body>
</html>
