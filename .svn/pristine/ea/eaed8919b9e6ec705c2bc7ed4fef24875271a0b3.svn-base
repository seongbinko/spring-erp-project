package kr.co.jhta.erp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.erp.dao.ProductDao;
import kr.co.jhta.erp.dto.ProductDto;
import kr.co.jhta.erp.vo.Product;
import kr.co.jhta.erp.vo.ProductPagination;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public boolean insertProduct(Product product) {
		
		Product prevProduct = productDao.getProductByName(product.getName());
		
		if(prevProduct != null) {
			return false;
		}
		
		productDao.insertNewProduct(product);
		
		return true;
	}

	@Override
	public List<Product> getProductsByCategoryNo(int categoryNo) {
		
		List<Product> products = productDao.getProductsByCategoryNo(categoryNo);		
		return products;
	}

	@Override
	public Product getProductByNo(int productNo) {
		Product product = productDao.getProductByNo(productNo);
		return product;
	}

	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}

	@Override
	public void deleteProduct(int productNo) {
		productDao.deleteProduct(productNo);	
	}

	@Override
	public Map<String, Object> searchProducts(Map<String, Object> criteria) {	
		if("시작일을 선택하세요".equals(criteria.get("opt1"))) {
			criteria.put("opt1", "");
		}
		if("종료일을 선택하세요".equals(criteria.get("opt2"))) {
			criteria.put("opt2", "");
		}
		
		int totalSize = productDao.getSearchedProductsCount(criteria);
		Map<String, Object> pagedProducts = new HashMap<String, Object>();
		if((Integer)criteria.get("pageNo") != null) {
			ProductPagination pagination = new ProductPagination((Integer) criteria.get("pageNo"), totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			pagedProducts.put("pagination", pagination);
		}
		if(criteria.get("pageNo") == null || criteria.get("pageNo").equals(1)) {
			ProductPagination pagination = new ProductPagination(1, totalSize);
			criteria.put("beginIndex", pagination.getBeginIndex());
			criteria.put("endIndex", pagination.getEndIndex());
			pagedProducts.put("pagination", pagination);
		}

		List<ProductDto> products = productDao.searchProducts(criteria);
		pagedProducts.put("products", products);
		return pagedProducts;
	}

	@Override
	public ProductDto getProductDetailByProductNo(int productNo) {
		return productDao.getProductDetailByProductNo(productNo);
	}
}
