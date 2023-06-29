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
	
//	private HttpServletRequest req;
	private HttpServletResponse resp;
	
	public Rq(HttpServletRequest req, HttpServletResponse resp) {
		
//		this.req = req;
		this.resp = resp;
		
		HttpSession session = req.getSession();
		
		int loginedMemberId = 0;
		
		if(session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		this.loginedMemberId = loginedMemberId;
		
	}

	public void jsPrintHistoryBack(String msg) {
		this.resp.setContentType("text/html; charset=utf-8");
		
		try {
			this.resp.getWriter().append(Util.jsHistoryBack(msg));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
}
