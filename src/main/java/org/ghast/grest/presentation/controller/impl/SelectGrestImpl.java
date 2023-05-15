package org.ghast.grest.presentation.controller.impl;

import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;

import org.ghast.grest.architecture.model.Login;
import org.ghast.grest.architecture.model.StoreProcedureResult;
import org.ghast.grest.presentation.controller.UniversalController;

public class SelectGrestImpl extends UniversalController {

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
		
		String resultClass = "org.ghast.grest.buisness.model.GrestModel";
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
	public HashMap<String, Object> manageInputParams(LinkedHashMap<String, Object> inParams, Login login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreProcedureResult objectDeser(StoreProcedureResult object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreProcedureResult manipulateResult(StoreProcedureResult spr, Login login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String setResultAction(StoreProcedureResult spr, HttpServletRequest request, Login login, String result) {
		// TODO Auto-generated method stub
		return null;
	}

	

	/*@Override
	public StoreProcedureResult manipulateResult(StoreProcedureResult spr, Login login) {
		// TODO Auto-generated method stub
		
		List<GrestModel> grestModelList = (ArrayList<GrestModel>) spr.getResult();
		List<Grest> grestList = new ArrayList<Grest>();
		
		for (GrestModel grestModel : grestModelList) {
			Grest grest = new Grest();
			grest = (Grest) Util.wrapObject(grestModel, grest);
			grestList.add(grest);
		}
		
		
		spr.setResult(grestList);
		
		if (grestList.size() == 1) {
			login.setSelectedGrest(grestList.get(0));
		}
		
		return spr;
	}*/

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
