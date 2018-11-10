<%@page import="br.com.caelum.produtos.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>

	<h1>Produtos</h1>
	<div id="mensagem"></div>
	<table width="100%">
		<tr>
		    <td>Id</td>
			<td width="20%">Nome</td>
			<td>Preco</td>
			<td>Descricao</td>
			<td>Data de Inicio da Venda</td>
			<td>Usado?</td>
			<td width="20%">Remover?</td>
		</tr>
		
		<c:forEach var="produto" items="${produtoList}" varStatus="st">
			<tr id="produto${produto.id}">
			    <td>${st.count}</td>
				<td>${produto.nome.toUpperCase()}</td>
				<td><fmt:formatNumber value="${produto.preco}" type="currency"/></td>
				<td>${produto.descricao}</td>
				<td><fmt:formatDate pattern="EEEE,dd 'de' MMMM 'de' yyyy" value="${produto.dataInicioVenda.time}" /></td>
				<td>
					<c:if test="${produto.usado}">
					    Sim
					</c:if>
				<c:choose>
					<c:when test="${not produto.usado}">
					   Não
					</c:when>
				</c:choose>
				</td>
				<td><a href="#" onclick="return removeProduto(${produto.id})">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
	<c:set var="nomeLink" value="Adicionar um novo produto"/>
	<c:url value="/produto/formulario" var="urlAdicionar"/>
	<a href="${urlAdicionar}">${nomeLink}</a>
	<!--  <c:out value="${nomeLink}"/> -->
	
</body>
</html>