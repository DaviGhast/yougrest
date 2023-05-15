package org.ghast.grest.presentation.controller.impl;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.Serializable;
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
import org.ghast.grest.presentation.model.PersonSubList;
import org.ghast.grest.presentation.model.SuccessReturn;

import com.google.gson.Gson;

public class SaveReceiptImpl extends UniversalController {

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
		String storedProcedureName = "SaveReceipt";
		
		int inParamsNum = 10;
		
		params.put("serviceLocator", serviceLocator);
		params.put("sPPackage", sPPackage);
		params.put("sPName", storedProcedureName);
		params.put("inParamsNum", inParamsNum);
		
		String resultClass = "org.ghast.grest.presentation.model.SuccessReturn";
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
		
		List<SuccessReturn> res = (List<SuccessReturn>) spr.getResult();
		SerializedObj resSer = new SerializedObj();
		resSer.data = res;
		inputStream = new ByteArrayInputStream(new Gson().toJson(resSer).getBytes());
		
		result = "stream";
		
		return result;
	}
	
	public class SerializedObj implements Serializable {
		protected List<SuccessReturn> data;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	

}
