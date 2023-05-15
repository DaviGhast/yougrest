package org.ghast.grest.presentation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ghast.grest.architecture.database.StoreProcedureManager;
import org.ghast.grest.architecture.model.StoreProcedureResult;

public class ZeusHybridViewController {
	
	private static StoreProcedureManager spm = new StoreProcedureManager();

	public ZeusBean executeAction(ZeusBean requestBean, String actionName, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		StoreProcedureResult spr = requestBean.getResultObj();
		LinkedHashMap<String, Object> inParams = new LinkedHashMap<String, Object>();
		
		HashMap<String, Object> params = spr.getParams();
		if (params.get("inParams") != null) {
			inParams = (LinkedHashMap<String, Object>) params.get("inParams");
		}
		//String outParams = (String) params.get("outParams");
		String sPName = (String) params.get("sPName");
		String sPPackage = (String) params.get("sPPackage");
		String serviceLocator = (String) params.get("serviceLocator");
		Class resultClass = (Class) params.get("resultClass");
		List<Integer> outParams = new ArrayList<Integer>();
		if (params.get("inParams") != null) {
			outParams = (List<Integer>) params.get("outParams");
		}
		
		
		spr = spm.callSP(serviceLocator, sPName, inParams.values().toArray(), outParams.toArray(), resultClass);
		
		if (spr.getParams() == null) spr.setParams(params);
		
		requestBean.setResultObj(spr);
		
		return requestBean;
	}

}
