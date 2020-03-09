package com.service;

import com.dao.UserDao;
import com.pojo.User;

public class UserService {
	private UserDao userDao  = new UserDao();
	public User findUserById(String userId) {
		return userDao.findUserById(userId);
	}
	
	/**
	 * 把人员信息添加到数据库
	 * @param cake--需要添加的蛋糕信息
	 * @return 1-成功 0-失败
	 */
	
public  int addUser(User users) {
	return userDao.addUser(users);
	}
}


