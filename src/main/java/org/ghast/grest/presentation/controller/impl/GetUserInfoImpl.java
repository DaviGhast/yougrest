package org.ghast.grest.presentation.controller.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.Parameter;
import org.ghast.grest.architecture.model.Login;
import org.ghast.grest.architecture.model.StoreProcedureResult;
import org.ghast.grest.presentation.controller.UniversalController;
import org.ghast.grest.presentation.model.GetUserInfoReturn;
import org.ghast.grest.presentation.model.LoginValidReturn;

import com.opensymphony.xwork2.ActionContext;

public class GetUserInfoImpl extends UniversalController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public HashMap<String, Object> setParams(HashMap<String, Object> params, Login login) {
		// TODO Auto-generated method stub
		
		String serviceLocator = "grest";
		String sPPackage = "";
		String storedProcedureName = "getUserRole";
		
		int inParamsNum = 1;
		
		params.put("serviceLocator", serviceLocator);
		params.put("sPPackage", sPPackage);
		params.put("sPName", storedProcedureName);
		params.put("inParamsNum", inParamsNum);
		
		String resultClass = "org.ghast.grest.presentation.model.GetUserInfoReturn";
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
	public StoreProcedureResult objectDeser(StoreProcedureResult object) {
		// TODO Auto-generated method stub
		return object;
	}

	@Override
	public HashMap<String, Object> manageInputParams(LinkedHashMap<String, Object> inParams, 
			Login login) {
		// TODO Auto-generated method stub
		
		inParams.put("inParam1", login.getUsername());
		
		return inParams;
	}

	@Override
	public StoreProcedureResult manipulateResult(StoreProcedureResult spr, Login login) {
		// TODO Auto-generated method stub
		return spr;
	}

	@Override
	public String setResultAction(StoreProcedureResult spr, HttpServletRequest request, 
			Login login, String result) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<GetUserInfoReturn> listObject = (List<GetUserInfoReturn>) spr.getResult();
		
		if (!listObject.isEmpty()) {
			
			GetUserInfoReturn getUserInfoReturn = listObject.get(0);
			
			HashMap<String, Object> params = spr.getParams();
			LinkedHashMap<String, Object> inParams = new LinkedHashMap<String, Object>();
			if (params.get("inParams") != null) {
				inParams = (LinkedHashMap<String, Object>) params.get("inParams");
			}
			
			login.setRole(getUserInfoReturn.getRole());
			//login.setTerminal((String) inParams.get("inParam3"));
			//login.setIpAddress(null);
				
			//request.getSession().removeAttribute("login");
			//request.getSession().setAttribute("login", login);
			
			result = SUCCESS;
		}
		else {
			result = ERROR;
		}
		
		return result;
	}

}
