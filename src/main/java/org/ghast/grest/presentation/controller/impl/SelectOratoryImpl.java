package org.ghast.grest.presentation.controller.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.Parameter;
import org.ghast.grest.architecture.model.Login;
import org.ghast.grest.architecture.model.StoreProcedureResult;
import org.ghast.grest.presentation.controller.UniversalController;
import org.ghast.grest.presentation.model.Oratory2;

public class SelectOratoryImpl extends UniversalController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public HashMap<String, Object> setParams(HashMap<String, Object> params, Login login) {
		// TODO Auto-generated method stub
		
		String serviceLocator = "";
		String sPPackage = "";
		String storedProcedureName = "";
		
		int inParamsNum = 3;
		
		params.put("serviceLocator", serviceLocator);
		params.put("sPPackage", sPPackage);
		params.put("sPName", storedProcedureName);
		params.put("inParamsNum", inParamsNum);
		
		String resultClass = "";
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
		
		HashMap<String, Object> params = spr.getParams();
		LinkedHashMap<String, Object> inParams = new LinkedHashMap<String, Object>();
		if (params.get("inParams") != null) {
			inParams = (LinkedHashMap<String, Object>) params.get("inParams");
		}
		
		String id = (String) inParams.get("inParam1");
		String name = (String) inParams.get("inParam2");
		String location = (String) inParams.get("inParam3");
		
		if (id != null & !id.trim().isEmpty()) {
			if (name != null & !name.trim().isEmpty()) {
				if (location != null & !location.trim().isEmpty()) {
					Oratory2 oratory2 = new Oratory2();
					oratory2.setId(id);
					oratory2.setName(name);
					oratory2.getLocation();
					login.setOratory(oratory2);
					login.setLocation(location);
					result = SUCCESS;
				}
				else {
					result = ERROR;
				}
			}
			else {
				result = ERROR;
			}
		}
		else {
			result = ERROR;
		}
			
		//request.getSession().removeAttribute("login");
		//request.getSession().setAttribute("login", login);
		
		
		return result;
	}

}
