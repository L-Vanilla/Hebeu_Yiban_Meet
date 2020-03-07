package com.yiban.meet.dao.provider;

import com.yiban.meet.util.common.BaseDaoSwap;
import com.yiban.meet.dao.IntegralDao;

public class IntegralDaoDynaSqlProvider extends BaseDaoSwap implements IntegralDao {

	public int addIntegralByYbid(String ybid, int integral) {
		// TODO Auto-generated method stub
		String sql = "UPDATE integral SET integral = integral + ? WHERE ybid = ?";
		return super.executeUpdate(sql, new Object[]{integral,ybid});
	}

}
