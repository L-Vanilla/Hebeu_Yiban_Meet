package com.yiban.meet.util.common;

import java.util.UUID;

/**
 * @author Vanilla
 * 获取UUID
 */
public class UUIDUtils {
	/**
     * 通过UUID类得到UUID号并去掉其中的 "-"
     * @return 返回UUID号
     */
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
