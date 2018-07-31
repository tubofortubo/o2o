package com.tubo.o2o.web.frontend;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tubo.o2o.entity.Product;
import com.tubo.o2o.service.ProductService;
import com.tubo.o2o.util.HttpServletRequestUtil;

@Controller
@RequestMapping("/frontend")
public class ProductDetailController {
	@Autowired
	private ProductService productService;
	@RequestMapping(value="listproductdetailpageinfo",method=RequestMethod.GET)
	@ResponseBody
	private Map<String, Object> listProductDetailPageInfo(HttpServletRequest request){
		
		Map<String, Object> modelMap=new HashMap<>();
		//获取从前台传递过来的productId
		Long productId = HttpServletRequestUtil.getLong(request, "productId");
		Product product=null;
		//空值判断
		if (productId!=-1) {
			//根据productId获取商品信息,包含商品详情列表
			product=productService.getProductById(productId);
			modelMap.put("product", product);
			modelMap.put("success", true);
		}else {
			modelMap.put("success", false);
			modelMap.put("errMsg", "empty productId");
		}
		return modelMap;
	}

}