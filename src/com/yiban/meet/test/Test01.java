package com.yiban.meet.test;

import com.yiban.meet.dao.IntegralDao;
import com.yiban.meet.dao.provider.IntegralDaoDynaSqlProvider;

public class Test01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		IntegralDao integralDao=new IntegralDaoDynaSqlProvider();
		int i=integralDao.addIntegralByYbid("25694040", 500);
		System.out.println("ffffffff"+i);
	}

}
