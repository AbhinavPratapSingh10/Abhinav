/**
 *
 */
package com.musgrave.facades.populators;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import de.hybris.platform.variants.model.VariantProductModel;

import com.musgrave.core.model.SuperValuWineProductModel;


/**
 * @author abhinav.pratap.singh
 *
 */
public class MusgraveProductPopulator implements Populator<ProductModel, ProductData>
{

	/*
	 * (non-Javadoc)
	 *
	 * @see de.hybris.platform.converters.Populator#populate(java.lang.Object, java.lang.Object)
	 */
	@Override
	public void populate(final ProductModel source, final ProductData target) throws ConversionException
	{
		final ProductModel baseProduct = getBaseProduct(source);

		if (baseProduct instanceof SuperValuWineProductModel)
		{
			final SuperValuWineProductModel supervaluProduct = (SuperValuWineProductModel) baseProduct;
			target.setRegion(supervaluProduct.getRegion());
			target.setBrand(supervaluProduct.getBrand());
			target.setGrape(supervaluProduct.getGrape());
			target.setYear(supervaluProduct.getYear());
			target.setGoeswellwith(supervaluProduct.getGoeswellwith());
			target.setTastingnotes(supervaluProduct.getGoeswellwith());
			target.setStyle(supervaluProduct.getStyle());
		}

	}

	protected ProductModel getBaseProduct(final ProductModel productModel)
	{
		ProductModel currentProduct = productModel;
		while (currentProduct instanceof VariantProductModel)
		{
			final VariantProductModel variant = (VariantProductModel) currentProduct;
			currentProduct = variant.getBaseProduct();
		}
		return currentProduct;
	}

}
