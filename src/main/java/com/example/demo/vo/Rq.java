package com.example.demo.vo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.demo.util.Util;

import lombok.Getter;

public class Rq {
	
	@Getter
	private int loginedMemberId;
	
	@Getter
	private int authLevel;
	
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private HttpSession session;
	
	public Rq(HttpServletRequest req, HttpServletResponse resp) {
		
		this.req = req;
		this.resp = resp;
		this.session = req.getSession();
		
		int loginedMemberId = 0;
		int authLevel = 0;
		
		if(session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		if(session.getAttribute("authLevel") != null) {
			authLevel = (int) session.getAttribute("authLevel");
			
		}
		
		this.loginedMemberId = loginedMemberId;
		this.authLevel = authLevel;
		
	}

	public void jsPrintHistoryBack(String msg) {
		this.resp.setContentType("text/html; charset=UTF-8;");
		
		print(Util.jsHistoryBack(msg));
		
	}
	
	private void print(String str) {
		
		try {
			this.resp.getWriter().append(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void login(Member member) {
		this.session.setAttribute("loginedMemberId", member.getId());
		this.session.setAttribute("authLevel", member.getAuthLevel());
	}

	public void logout() {
		this.session.removeAttribute("loginedMemberId");
		this.session.removeAttribute("authLevel");
	}

	public String jsReturnOnView(String msg) {
		this.req.setAttribute("msg", msg);
		
		return "usr/common/js";
	}
}