package cn.ctgu.users.dao;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import cn.ctgu.user.tools.JDBCUtils;
import cn.ctgu.user.tools.TxQueryRunner;
import cn.ctgu.users.domain.User;


public class UserDao {
	private QueryRunner qr = new TxQueryRunner();
	
	public User findByUsername(String username) {
		try {
			String sql = "SELECT * FROM myuser WHERE username=?";
			return  qr.query(sql, new BeanHandler<User>(User.class), username);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		
	}

	public void add(User user) {
		String sql = "INSERT INTO myuser(username, password, gender, sign) values(?,?,?,?)";
		Object[] params = {user.getUsername(),
				user.getPassword(), user.getGender(), user.getSign()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}

	public User edit(User form) {
		String sql = "UPDATE myuser SET password=?, gender=?, sign=? WHERE username=?";
		Object[] params = {form.getPassword(), form.getGender(), form.getSign(), form.getUsername()};
		
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return findByUsername(form.getUsername());
	}

	
	
}
