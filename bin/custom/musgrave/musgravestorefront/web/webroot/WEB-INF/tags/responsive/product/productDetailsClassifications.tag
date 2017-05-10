<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="product-classifications">
	<c:if test="${not empty product.classifications}">
		<c:forEach items="${product.classifications}" var="classification">
			<div class="headline">${classification.name}</div>
				<table class="table">
					<tbody>
						<c:forEach items="${classification.features}" var="feature">
							<tr>
								<td class="attrib">${feature.name}</td>
								<td>
									<c:forEach items="${feature.featureValues}" var="value" varStatus="status">
										${fn:escapeXml(value.value)}
										<c:choose>
											<c:when test="${feature.range}">
												${not status.last ? '-' : feature.featureUnit.symbol}
											</c:when>
											<c:otherwise>
												${feature.featureUnit.symbol}
												${not status.last ? '<br/>' : ''}
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</c:forEach>
		
	</c:if>
	<table class="table">
			<tbody>
				<tr>
					<td class="attrib">Grape</td>
					<td>${product.grape}</td>
					
				</tr>
				<tr>
					<td class="attrib">Brand</td>
					<td>${product.brand}</td>
					
				</tr>
				<tr>
					<td class="attrib">Year</td>
					<td>${product.year}</td>
					
				</tr>
				<tr>
					<td class="attrib">Region</td>
					<td>${product.region}</td>
					
				</tr>
				<tr>
					<td class="attrib">Style</td>
					<td>${product.style}</td>
					
				</tr>
				<tr>
					<td class="attrib">Goes Well With</td>
					<td>${product.goeswellwith}</td>
					
				</tr>
				<tr>
					<td class="attrib">Tasting Notes</td>
					<td>${product.tastingnotes}</td>
				</tr>
			</tbody>
		</table>
</div>