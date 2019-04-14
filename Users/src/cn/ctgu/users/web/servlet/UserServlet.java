package cn.ctgu.users.web.servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ctgu.user.tools.CommonUtils;
import cn.ctgu.user.tools.VerifyCode;
import cn.ctgu.users.domain.User;
import cn.ctgu.users.service.UserException;
import cn.ctgu.users.service.UserService;

public class UserServlet extends HttpServlet {
	private UserService userService = new UserService();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取用户名
		String username = request.getParameter("username");
		//校验用户名   如果是，响应1， 否则响应0
		if(request.getParameter("username") == "") {
			response.getWriter().print("0");
		} else if(userService.findByUsername(username) == null) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("-1");
		}

	}
	
	public void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String s = req.getHeader("via");
		System.out.println(s + "kgd");
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String methodName = req.getParameter("method");//获取方法参数
		
		Class c = this.getClass();//得到当前class对象
		Method method = null;
		try {
			method = c.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
		} catch (Exception e) {
			throw new RuntimeException("调用的方法不存在");
		}
		
		//调用method表示的方法
		try {
			method.invoke(this, req, resp);
		} catch (Exception e) {
			System.out.println("您调用的方法内部出现了异常");
			throw new RuntimeException(e);
		}
	}
	
	public void verifyCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 创建验证码类
		 */
		VerifyCode vc = new VerifyCode();
		/*
		 * 2. 得到验证码图片
		 */
		BufferedImage image = vc.getImage();
		/*
		 * 3. 把图片上的文本保存到session中
		 */
		request.getSession().setAttribute("session_vcode", vc.getText());
		/*
		 * 4. 把图片响应给客户端
		 */
		VerifyCode.output(image, response.getOutputStream());
	}
	
	
	/*
	 * 退出工能
	 */
	public void quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
	}
	
	/*
	 * 注册
	 */
	public void regist(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/*
		 * 封装表单数据到user form对象中
		 */
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);

		//创建map集合来装载所有错误信息
		Map<String, String> errors = new HashMap<String, String>();
		
		//校验用户名
		String username = form.getUsername();
		if(username == null || username.trim().isEmpty()) {
			errors.put("username", "用户名不能为空!");
		} else if(username.contains(" ")) {
			errors.put("username", "用户名中不能包含空格!");
		} else if(username.length() < 3 || username.length() > 15) {
			errors.put("username", "用户名必须在3~15位之间");
		}
		
		String password = form.getPassword();
		if(password.contains(" ")) {
			errors.put("password", "密码中不能包含空格!!");
		} else if(password == null || password.trim().isEmpty()) {
			errors.put("password", "密码不能为空!");
		} else if(password.length() < 6 || password.length() > 20) {
			errors.put("password", "密码必须为6~20位!");
		}
		
		//校验验证码
		String sessionVerifyCode = (String) request.getSession().getAttribute("session_vcode");
		String verify = form.getVerify();
		if(verify == null || verify.trim().isEmpty()) {
			errors.put("verify", "验证码不能为空!");
		} else if(!verify.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verify", "验证码错误！");
		}
		
		//判断map是否为空，不为空就说明存在错位u
		if(errors != null && errors.size() > 0) {
			request.setAttribute("errors", errors);//把errors保存到request域
			request.setAttribute("user", form);//把form保存到request域，用于回显
			request.getRequestDispatcher("/jsp/regist.jsp").forward(request, response);//转发到注册页面
			return ;
		}
		
		try {
			userService.regist(form);
			response.getWriter().print("<h1>注册成功！</h1><a href='" + 
					request.getContextPath() + 
					"/jsp/login.jsp" + "'>点击此处去登录</a>");
		} catch (UserException e) {
			//获取异常信息，保存到request域
			request.setAttribute("msg", e.getMessage());
			//保存表单数据到request域
			request.setAttribute("user", form);//用来在表单中回显
			//转发到regist.jsp
			request.getRequestDispatcher("/jsp/regist.jsp").forward(request, response);
		}
		

	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//封装表单数据
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		
		//创建map集合来装载所有错误信息
		Map<String, String> errors = new HashMap<String, String>();
		//校验用户名
		String username = form.getUsername();
		if(username == null || username.trim().isEmpty()) {
			errors.put("username", "用户名不能为空!");
		} else if(username.contains(" ")) {
			errors.put("username", "用户名中不能包含空格!");
		} else if(username.length() < 3 || username.length() > 15) {
			errors.put("username", "用户名必须在3~15位之间");
		}
		
		String password = form.getPassword();
		if(password.contains(" ")) {
			errors.put("password", "密码中不能包含空格!!");
		} else if(password == null || password.trim().isEmpty()) {
			errors.put("password", "密码不能为空!");
		} else if(password.length() < 6 || password.length() > 20) {
			errors.put("password", "密码必须为6~20位!");
		}
		//校验验证码
		String sessionVerifyCode = (String) request.getSession().getAttribute("session_vcode");
		String verify = form.getVerify();
		if(verify == null || verify.trim().isEmpty()) {
			errors.put("verify", "验证码不能为空!");
		} else if(!verify.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verify", "验证码错误！");
		}
		
		//判断map是否为空，不为空就说明存在错误
		if(errors != null && errors.size() > 0) {
			request.setAttribute("errors", errors);//把errors保存到request域
			request.setAttribute("user", form);//把form保存到request域，用于回显
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);//转发到注册页面
			return ;
		}
		
		try {
			User user = userService.login(form);
			request.getSession().setAttribute("sessionUser", user);
			response.sendRedirect(request.getContextPath() + "/jsp/welcome.jsp");
		} catch (UserException e) {
			//获取异常信息，保存到request域
			request.setAttribute("msg", e.getMessage());
			//保存表单数据到request域
			request.setAttribute("user", form);//用来在表单中回显
			//转发到regist.jsp
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
		}
		
	}
	
	public void edit(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//封装表单数据
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		System.out.println(request.getSession().getAttribute("user"));
		User user = userService.edit(form);
		System.out.println(user);
		request.getSession().setAttribute("sessionUser", user);
		response.sendRedirect(request.getContextPath() + "/jsp/information.jsp");

		
	}


	
}
