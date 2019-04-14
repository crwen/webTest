package cn.ctgu.user.tools;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

/*
 * 这个类中的方法，自己来处理连接的问题
 * 无需外界传递
 * 
 * 通过JDBCUtils.getConnection()得到连接。有可能是事务连接，也有可能是普通连接
 * JDBCUtils.releaseConnection()完成对连接的释放。如果是普通连接，关闭之
 */
public class TxQueryRunner extends QueryRunner {

	@Override
	public int[] batch(String sql, Object[][] params) throws SQLException {
		/*
		 * 得到连接
		 * 执行父类方法，传递连接对象
		 * 释放连接
		 * 返回值
		 */
		Connection con = JDBCUtils.getConnection();
		int[] result = super.batch(con, sql, params);
		JDBCUtils.releaseConnection(con);
		return result;
	}

	@Override
	public <T> T query(String sql, Object param, ResultSetHandler<T> rsh) throws SQLException {
		Connection con = JDBCUtils.getConnection();
		T result = super.query(con, sql, param, rsh);
		JDBCUtils.releaseConnection(con);
		return result;
	}

	@Override
	public <T> T query(String sql, Object[] params, ResultSetHandler<T> rsh) throws SQLException {
		Connection con = JDBCUtils.getConnection();
		T result = super.query(con, sql, params, rsh);
		JDBCUtils.releaseConnection(con);
		return result;
	}

	@Override
	public <T> T query(String sql, ResultSetHandler<T> rsh, Object... params) throws SQLException {
		Connection con = JDBCUtils.getConnection();
		T result = super.query(con, sql, rsh, params);
		JDBCUtils.releaseConnection(con);
		return result;
	}

	@Override
	public <T> T query(String sql, ResultSetHandler<T> rsh) throws SQLException {
		Connection con = JDBCUtils.getConnection();
		T result = super.query(con, sql,rsh);
		JDBCUtils.releaseConnection(con);
		return result;
	}

	@Override
	public int update(String sql) throws SQLException {
		Connection con = JDBCUtils.getConnection();
		int result = super.update(con, sql);
		JDBCUtils.releaseConnection(con);
		return result;
	}

	@Override
	public int update(String sql, Object param) throws SQLException {
		Connection con = JDBCUtils.getConnection();
		int result = super.update(con, sql, param);
		JDBCUtils.releaseConnection(con);
		return result;
	}

	@Override
	public int update(String sql, Object... params) throws SQLException {
		Connection con = JDBCUtils.getConnection();
		int result = super.update(con, sql, params);
		JDBCUtils.releaseConnection(con);
		return result;
	}

}
