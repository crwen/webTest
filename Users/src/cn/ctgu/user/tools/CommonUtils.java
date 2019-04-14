package cn.ctgu.user.tools;

import java.util.Map;
import java.util.UUID;

import org.apache.commons.beanutils.BeanUtils;

public class CommonUtils {
	/**
	 * 生成不重复的32为长的大写字符串
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	/**
	 * 把map转换成制定类型的JavaBean对象
	 */
	public static <T>T toBean(Map map, Class<T> clazz) {
		try {
			/*
			 * 1.创建制定类型的JavaBean对象
			 */
			T bean = clazz.newInstance();
			/*
			 * 2.把数据封装到JavaBean中
			 */
			BeanUtils.populate(bean, map);
			/*
			 * 3.返回JavaBean对象
			 */
			return bean;
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
		
	}
}
