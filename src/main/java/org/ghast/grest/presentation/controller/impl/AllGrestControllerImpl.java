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
import org.ghast.grest.buisness.model.GrestModel;
import org.ghast.grest.presentation.controller.UniversalController;

import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;
import com.google.gson.reflect.TypeToken;

public class AllGrestControllerImpl extends UniversalController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public HashMap<String, Object> setParams(HashMap<String, Object> params, Login login) {
		
		String serviceLocator = "grestDB";
		String sPPackage = "";
		String storedProcedureName = "getAllGrest";
		
		int inParamsNum = 0;
		int outParamsNum = 0;
		int allParamsNum = 0;
		
		params.put("serviceLocator", serviceLocator);
		params.put("sPPackage", sPPackage);
		params.put("sPName", storedProcedureName);
		params.put("inParamsNum", inParamsNum);
		params.put("outParamsNum", outParamsNum);
		params.put("allParamsNum", allParamsNum);
		
		String resultClass = "org.ghast.grest.presentation.model.Grest";
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
	public StoreProcedureResult manipulateResult(StoreProcedureResult spr, Login login) {
		// TODO Auto-generated method stub
		return spr;
	}

	@Override
	public StoreProcedureResult objectDeser(StoreProcedureResult object) {
		List<GrestModel> lista = new Gson().fromJson(new Gson().toJson(((List<LinkedTreeMap<String, Object>>) object.getResult())), 
				new TypeToken<List<GrestModel>>() {}.getType());
		object.setResult(lista);
		
		return object;
	}

	public void withSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public HashMap<String, Object> manageInputParams(LinkedHashMap<String, Object> inParams, Login login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String setResultAction(StoreProcedureResult spr, HttpServletRequest request, Login login, String result) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
