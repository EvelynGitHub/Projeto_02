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

        <h1>Amortização Constante</h1>

        <div class="container">
            <div class="esquerda">
                <form>
                    Valor da divida: <br> <input type="text" name="vl_divida"/> <br>
                    Qauntidade de prestações: <br> <input type="text" name="qt_prestacao"/> <br>
                    Valor dos Juros: <br> <input type="text" name="pc_juros" placeholder="Taxa de juros ao mês"/> <br>
                    <input type="submit" name="amortizacao_constante" value="Calcular"/>               
                </form>
            </div>
            <div class="direita">
                <%if (request.getParameter("amortizacao_constante") == null) {%>
                <h1>Por favor, preencha o formulario!</h1>
                <%} else {
                    Double divida = Double.parseDouble(request.getParameter("vl_divida"));
                    Double prestacao = Double.parseDouble(request.getParameter("qt_prestacao"));
                    Double juros = Double.parseDouble(request.getParameter("pc_juros"));

                    Double amortizacao = divida / prestacao;
                    
                %>
                <table border="1">
                    <tr>
                        <th>#</th>
                        <th>Parcelas</th>
                        <th>Amortização</th>
                        <th>Juros</th>
                        <th>Saldo Devedor</th>
                    </tr>
                    
                <%
                    Double saldo = divida;
                    for(int x = 0;x < prestacao; x++){
                        //amotizacao +(juros * (divida - x * amortizacao))
                        Double juro = divida * juros /100;   
                        Double parc = amortizacao + juro;//amortizacao +(juros * (divida - x * amortizacao));
                        saldo -= amortizacao;
                %>          
                    <tr>
                        <td><%=x+1%></td>
                        <td><%=parc%></td>
                        <td><%=amortizacao%></td>
                        <td><%=juro%></td>
                        <td><%=saldo%></td>
                    </tr>
                           
                

                <%
                divida -= amortizacao;
                    }
                }%>
                </table>   
            </div>
        </div>
            
            
            
                <%@include file="WEB-INF/jspf/footer.jspf" %>

    </body>
</html>
