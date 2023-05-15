package org.ghast.grest.presentation.controller.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.Parameter;
import org.ghast.grest.architecture.model.Login;
import org.ghast.grest.architecture.model.StoreProcedureResult;
import org.ghast.grest.presentation.controller.ActiveSessionListener;
import org.ghast.grest.presentation.controller.UniversalController;
import org.ghast.grest.presentation.model.LoginValidReturn;

import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends UniversalController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public HashMap<String, Object> setParams(HashMap<String, Object> params, Login login) {
		
		String serviceLocator = "grest";
		String sPPackage = "";
		String storedProcedureName = "CheckPassword";
		
		int inParamsNum = 2;
		int outParamsNum = 0;
		int allParamsNum = 2;
		
		params.put("serviceLocator", serviceLocator);
		params.put("sPPackage", sPPackage);
		params.put("sPName", storedProcedureName);
		params.put("inParamsNum", inParamsNum);
		params.put("outParamsNum", outParamsNum);
		params.put("allParamsNum", allParamsNum);
		
		String resultClass = "org.ghast.grest.presentation.model.LoginValidReturn";
		Class clazz = null;
		if (resultClass != null && !resultClass.trim().equalsIgnoreCase("")) {
			try {
				clazz = Class.forName(resultClass);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		params.put("resultClass", clazz);
		
		List<Integer> outParams = new ArrayList<Integer>();
		params.put("outParams", outParams);
		
		return params;
	}

	@Override
	public HashMap<String, Object> manageInputParams(LinkedHashMap<String, Object> inParams, Login login) {
		// TODO Auto-generated method stub
		return inParams;
	}
	
	@Override
	public StoreProcedureResult objectDeser(StoreProcedureResult object) {
		
		return object;
	}

	@SuppressWarnings("unchecked")
	@Override
	public StoreProcedureResult manipulateResult(StoreProcedureResult spr, Login login) {
		
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		Map<String, Object> session = ctx.getSession();
		login = (Login) session.get("login");
		
		//if (login == null || login.equals(new Login())) {
			
			login = new Login();
			
			HashMap<String, Object> params = spr.getParams();
			LinkedHashMap<String, Object> inParams = new LinkedHashMap<String, Object>();
			if (params.get("inParams") != null) {
				inParams = (LinkedHashMap<String, Object>) params.get("inParams");
			}
			
			
			login.setUsername((String) inParams.get("inParam1"));
			login.setTerminal((String) inParams.get("inParam3"));
			login.setIpAddress(null);
			
			//session.put("login", login);
			
			request.getSession().setAttribute("login", login);
			
		//}
		
		return spr;
	}

	@Override
	public String setResultAction(StoreProcedureResult spr, HttpServletRequest request, Login login, String result) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<LoginValidReturn> listObject = (List<LoginValidReturn>) spr.getResult();
		
		if (!listObject.isEmpty()) {
			
			LoginValidReturn object = listObject.get(0);
			
			if (object.getUser_exists().trim().isEmpty()) {
				result = ERROR;
			}
			else {
				try {
					if (Boolean.parseBoolean(object.getUser_exists().trim())) {
						
						Map<String, HttpSession> usersSessions= new HashMap<String, HttpSession>();
						usersSessions = ActiveSessionListener.getUsersSessions();
						
						ActionContext ctx = ActionContext.getContext();
						request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
						Map<String, Object> session = ctx.getSession();
						login = (Login) session.get("login");
						
						if (login == null) {
							
							login = new Login();
							
							HashMap<String, Object> params = spr.getParams();
							LinkedHashMap<String, Object> inParams = new LinkedHashMap<String, Object>();
							if (params.get("inParams") != null) {
								inParams = (LinkedHashMap<String, Object>) params.get("inParams");
							}
							
							login.setUsername((String) inParams.get("inParams1"));
							
						}
						
						if (usersSessions.containsKey(login.getUsername())) {
							
							if (usersSessions.get(login.getUsername()).getId() != request.getSession().getId()) {
								result = LOGIN;
							}
							else {
								//usersSessions.get(login.getUsername()).invalidate();
								result = SUCCESS;
							}
							
						}
						else {
							
							for (HttpSession httpSession : usersSessions.values()) {
								if (httpSession.getId() == request.getSession().getId()) {
									httpSession.invalidate();
									request.getSession().setAttribute("login", login);
								}
							}
							
							result = SUCCESS;
						}
						
					}
					else {
						result = INPUT;
					}
				}
				catch (Exception e) {
					result = ERROR;
				}
				
			}
		}
		
		return result;
	}

	

}
