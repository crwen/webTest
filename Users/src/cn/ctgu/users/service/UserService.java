package cn.ctgu.users.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.ctgu.user.tools.JDBCUtils;
import cn.ctgu.users.dao.UserDao;
import cn.ctgu.users.domain.User;

public class UserService {
	private UserDao userDao = new UserDao();

	public void regist(User user) throws UserException {
		try {
			JDBCUtils.beginTransaction();
			User _user = findByUsername(user.getUsername());
			if(_user != null) throw new UserException("用户名" + user.getUsername() + "已经被注册！");
			
			userDao.add(user);
			JDBCUtils.commitTransaction();
		} catch (SQLException e) {
			try {
				JDBCUtils.rollbackTransaction();
			} catch (SQLException e1) {
				throw new RuntimeException(e);
			}
		}

	}

	public User login(User form) throws UserException {	
		User user = userDao.findByUsername(form.getUsername());
		if(user == null) throw new UserException("用户名不存在！");
		else if(!user.getPassword().equals(form.getPassword())) throw new UserException("密码错误！");
		

		
		return user;
	}


	public User edit(User form) {
		
		try {
			JDBCUtils.beginTransaction();
			
			User user = userDao.edit(form);
			JDBCUtils.commitTransaction();
			return user;
		} catch (SQLException e) {
			try {
				JDBCUtils.rollbackTransaction();
			} catch (SQLException e1) {
				throw new RuntimeException(e);
			}
		}
		return form;
		
	}
	
	public User findByUsername(String username){
		return userDao.findByUsername(username);
	}
}
