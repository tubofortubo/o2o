package com.tubo.o2o.service;

import java.io.File;
import java.io.InputStream;

import com.tubo.o2o.dto.ImageHolder;
import com.tubo.o2o.dto.ShopExecution;
import com.tubo.o2o.entity.Shop;
import com.tubo.o2o.exceptions.ShopOperationException;

public interface ShopService {
	 
	/**
	 * 根据shopCondition返回相应店铺数据
	 * @param shopCondition
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	ShopExecution getShopList(Shop shopCondition,int pageIndex,int pageSize);
	
	
	/**
	 * 根据id查询商铺	
	 * @param shopId
	 * @return
	 */
	Shop getByShopId(long shopId);
	/**
	 * 店铺信息编辑
	 * @param shop
	 * @param shopImgStream
	 * @param fileName
	 * @return
	 * @throws ShopOperationException
	 */
	ShopExecution modifyShop(Shop shop, ImageHolder thumbnail) throws ShopOperationException ;

    /**
     * 增加商铺
     * @param shop
     * @param shopImgStream
     * @param fileName
     * @return
     * @throws ShopOperationException
     */
	ShopExecution addShop(Shop shop, ImageHolder thumbnail) throws ShopOperationException ;

}
