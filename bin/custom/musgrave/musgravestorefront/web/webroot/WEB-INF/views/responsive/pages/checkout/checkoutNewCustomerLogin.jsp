<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/responsive/user" %>
<div class="col-ms-4">
<c:url value="/login/checkout/register" var="registerAndCheckoutActionUrl" />
<user:register actionNameKey="checkout.login.registerAndCheckout" action="${registerAndCheckoutActionUrl}"/>
</div>




 
