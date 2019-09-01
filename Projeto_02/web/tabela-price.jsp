<%-- 
    Document   : tabela-price
    Created on : Aug 30, 2019, 12:21:29 AM
    Author     : Pedro
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Tabela Price</title>
        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%DecimalFormat df = new DecimalFormat("#.00");%>
        <h1 style="text-align: center">Cálculo - Tabela Price</h1
        
        <div style="text-align: center">
            <form style="text-align: center">
            Valor financiado<br><input type="number" name="v"/></br>
            
            <label unit="%">
            Taxa de juros<br><input type="number" step="0.01" min="0.01" max="70.00" name="t"/></br>
            </label>
            
            Número de parcelas<br><input type="number" name="n"/></br>
            
            <br><input type="submit" name="bt" value="Calcular"/></br>
        </form>
    <br><center>
        </div>

        
        <% if(request.getParameter("bt") != null) {%>
        
        <%try{%>
        <%double valor = Double.parseDouble(request.getParameter("v")); %>
        <%double taxa = Double.parseDouble(request.getParameter("t")); %>
        <%double tempo = Double.parseDouble(request.getParameter("n")); %>
           
            
            <%double aux = Math.pow(1 + taxa / 100, tempo);%>
            <%double prestacao = valor * (aux * taxa / 100) / (aux - 1);%>
            
            <table border="1"; style="text-align: center">
                
                <tr>
                    <th>PARCELA</th>
                    <th>VALOR</th>
                    <th>JUROS</th>
                    <th>AMORTIZAÇÃO</th>
                    <th>SALDO DEVEDOR</th>
                </tr>
                <tr>
                    <%double saldodevedor = valor;%>
                    <td><%= 0%></td>
                    <td><%= 0%></td>
                    <td><%= 0%></td>
                    <td><%= 0%></td>
                    <td><%= (saldodevedor)%></td>
      
                </tr>
                            
            <%double juros = valor * (taxa / 100);%>
            <%double amortizacao = prestacao - juros;%>
            <%double devedor = valor;%>
            
                <%for ( int i = 1; i <= tempo; i++ ) { %>
                
                <%amortizacao = prestacao - juros;%>
                <%devedor = devedor - amortizacao;%>
                    
                <tr>
                    <td><%= i%></td>
                    <td><%= df.format(prestacao)%></td>
                    <td><%= df.format(juros)%></td>
                    <td><%= df.format(amortizacao)%></td>
                    <td><%= df.format(devedor)%></td>                   
                                    
                                      
                </tr>
                <%juros = devedor * ( taxa / 100);%>
                <%}%>
                
  
        <%}catch(Exception ex){%>
        <h3 style="color: red">Erro: <%=ex.getMessage()%></h3>
        <%}%>
        <%}else{%>
        <h3>Preencha o formulário</h3>
        <%}%>
        
        </table>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </center></br>
    </body>
</html>
