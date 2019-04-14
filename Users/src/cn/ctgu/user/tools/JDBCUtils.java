package cn.ctgu.user.tools;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtils {
	//配制文件的默认配制。要求必须给出c3p0-config.xml
	private static ComboPooledDataSource dataSource = new ComboPooledDataSource();
	
	//它是事务专用连接
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	
	/*
	 * 使用连接池返回一个连接对象
	 */
	public static Connection getConnection() throws SQLException {
		Connection con = tl.get();
		//如果con != null ,说明已经调用过beginTransaction(),表示开启了事务
		if(con != null) return con;
		return dataSource.getConnection();
	}
	
	/*
	 * 返回连接池
	 */
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	/*
	 * 开启事务
	 * 获取一个Connection，设置它的setAutoCommit(false)
	 * 还要保证dao中使用的连接是我们刚刚创建的
	 * -----------------------------------
	 * 创建一个Connection,设置为手动提交
	 * 把这个Connection给dao用
	 * 还要让commitTransaction或rollbackTransaction可以获取到
	 */
	public static  void beginTransaction() throws SQLException {
		Connection con = tl.get();
		if(con != null) throw new SQLException("您已经开启了事务，请不要重复开启");
		
		//给con赋值，给con设置手动提交
		con = getConnection();
		con.setAutoCommit(false);
		
		tl.set(con);//把当前线程的连接保存起来
	}
	
	/*
	 * 提交事务
	 * 获取beginTransaction提供的Connection，然后调用commit方法
	 */
	public static void commitTransaction() throws SQLException {
		Connection con = tl.get();//获取当前线程的专用连接
		if(con == null) throw new SQLException("还没有开启事务，不能提交");
		//直接使用con.commit()
		con.commit();
		con.close();
		//把con设置为null，表示事务已经结束。下次调用getConnection()返回的就不是con了
//		con = null;
		tl.remove();//从tl中移除连接
	}
	
	/*
	 * 提交事务
	 * 获取beginTransaction提供的Connection，然后调用rollback方法
	 */
	public static void rollbackTransaction() throws SQLException {
		Connection con = tl.get();
		if(con == null) throw new SQLException("还没有开启事务，不能回滚");
		
		con.rollback();
//		con = null;
		tl.remove();//从tl中移除连接
	}
	
	/*
	 * 释放连接
	 */
	public static void releaseConnection(Connection connection) throws SQLException {
		Connection con = tl.get();
		/*
		 * 判断它是不是事务专用连接，如果是，就不关闭
		 * 如果不是事务专用，那么就要关闭
		 */
		//如果con == null, 说明现在没有事务，那么connection一定不是事务专用
		if(con == null) connection.close();
		//如果con != null, 说明有事务，那么需要判断参数连接是否与con相等，若不等，说明参数连接不是事务专用
		if(con != connection) connection.close();
	}
}
