package org.ghast.grest.presentation.controller.impl;

import java.io.InputStream;
import java.time.LocalDate;
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
import org.ghast.grest.presentation.controller.Util;
import org.ghast.grest.presentation.model.Grest;

public class SelectDefaultGrestImpl extends UniversalController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;

	@Override
	public HashMap<String, Object> setParams(HashMap<String, Object> params, Login login) {
		// TODO Auto-generated method stub
		
		String serviceLocator = "grest";
		String sPPackage = "";
		String storedProcedureName = "getGrestByYaer";
		
		int inParamsNum = 1;
		
		params.put("serviceLocator", serviceLocator);
		params.put("sPPackage", sPPackage);
		params.put("sPName", storedProcedureName);
		params.put("inParamsNum", inParamsNum);
		
		//String resultClass = "org.ghast.grest.buisness.model.GrestModel";
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
		
		int nowYear = LocalDate.now().getYear();
		inParams.put("inParam1", String.valueOf(nowYear));
		
		return inParams;
	}

	@Override
	public StoreProcedureResult manipulateResult(StoreProcedureResult spr, Login login) {
		// TODO Auto-generated method stub
		
		/*List<GrestModel> grestModelList = (ArrayList<GrestModel>) spr.getResult();
		List<Grest> grestList = new ArrayList<Grest>();
		
		for (GrestModel grestModel : grestModelList) {
			Grest grest = new Grest();
			grest = (Grest) Util.wrapObject(grestModel, grest);
			grestList.add(grest);
		}
		
		
		spr.setResult(grestList);*/
		
		List<Grest> grestList = (ArrayList<Grest>) spr.getResult();
		
		if (grestList.size() == 1) {
			login.setSelectedGrest(grestList.get(0));
			
		}
		
		return spr;
	}

	@Override
	public String setResultAction(StoreProcedureResult spr, HttpServletRequest request, Login login, String result) {
		// TODO Auto-generated method stub
		return null;
	}

	/*@Override
	public String setResultAction(StoreProcedureResult spr, HttpServletRequest request, 
			Login login, String result) {
		// TODO Auto-generated method stub
		
		List<Grest> grestList = (ArrayList<Grest>) spr.getResult();
		if (grestList.size() == 1) {
			login.setSelectedGrest(grestList.get(0));
			result = SUCCESS;
		}
		else {
			result = ERROR;
		}
			
		//request.getSession().removeAttribute("login");
		//request.getSession().setAttribute("login", login);
		
		
		return result;
	}*/

}
