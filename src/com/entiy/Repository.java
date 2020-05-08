package com.entiy;

import java.util.HashMap;
import java.util.Map;

import com.entiy.Product;

public class Repository {
	private static Map<Integer, Product> products;

	static {
		products = new HashMap<>();
		products.put(1, new Product(1, "IPhone7", 5500,4));
		products.put(2, new Product(2, "魅族Pro6", 2500,5));
		products.put(3, new Product(3, "联想笔记本电脑", 7900,6));
		products.put(4, new Product(4, "KFC汉堡", 16,7));
		products.put(5, new Product(5, "矿泉水", 2,7));
	}

	public static Map<Integer, Product> getProducts() {
		return products;
	}
}
