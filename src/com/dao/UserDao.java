package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pojo.User;
import com.tools.BaseDao;

public class UserDao {
	/**
	 * 根据userId查找对应一般账户
	 * @param userId
	 * @param roleId 账户角色 1-一般账户 2-管理员
	 * @return 成功返回账户信息，失败返回null
	 */
	public User findUserById(String userId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User result = null;
		try {
			conn = BaseDao.getConnection();//获取连接
			String sql = "select * from bbs_user "
					+ "where userId=?";
			ps = conn.prepareStatement(sql);//创建执行块
			rs = BaseDao.query(ps, new Object[] {userId});// 调用BaseDao的查询方法
			if(rs.next()) {
				// 从结果集获取创建对象
				result = new User();
			}
		} catch (Exception e) {e.printStackTrace();
		} finally {
			try {
				BaseDao.close(conn, ps, rs);
			} catch (Exception e2) {e2.printStackTrace();}
		}
		return result;
	}
	
	/**
	 * 把人员信息添加到数据库
	 */
	
	public  int addUser(User users) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = BaseDao.getConnection();
			String sql="insert into bbs_user(userId,userPsw,userAlice,userEmail,userSex) values(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			return BaseDao.alter(ps, new Object[] {
					users.getUserId(),
					users.getUserAlice(),
					users.getUserEmail(),
					users.getUserPsw(),
					users.getUserSex()
			});
		} catch (Exception e) {e.printStackTrace();}
		finally {
			try {
				BaseDao.close(conn, ps, null);
			} catch (Exception e2) {e2.printStackTrace();
				// TODO: handle exception
			}
		}
		return 0;
	}
}
