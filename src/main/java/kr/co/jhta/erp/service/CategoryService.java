package kr.co.jhta.erp.service;

import java.util.List;

import kr.co.jhta.erp.vo.Category;

public interface CategoryService {

	List<Category> getAllUpperCategories();
	List<Category> getSubCategoriesByUpperCateNo(int upperCateNo);
	Category getUpperCategoryBySubcategoryNo(int categoryNo);
	List<Category> getCategoiesByProductsNo(int productNo);
}
