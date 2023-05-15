package org.ghast.grest.presentation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.action.SessionAware;
import org.apache.struts2.dispatcher.Parameter;
import org.ghast.grest.architecture.database.StoreProcedureManager;
import org.ghast.grest.architecture.model.Login;
import org.ghast.grest.architecture.model.StoreProcedureResult;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public abstract class UniversalController extends ActionSupport {
	
	private static Logger logger = LogManager.getLogger(UniversalController.class);
	private static StoreProcedureManager spm = new StoreProcedureManager();
	private static final long serialVersionUID = 1L;
	
	public abstract HashMap<String, Object> setParams (HashMap<String, Object> params, Login login);
	public abstract HashMap<String, Object> manageInputParams (LinkedHashMap<String, Object> inParams, Login login);
	public abstract StoreProcedureResult objectDeser (StoreProcedureResult object);
	public abstract StoreProcedureResult manipulateResult (StoreProcedureResult spr, Login login);
	public abstract String setResultAction (StoreProcedureResult spr, HttpServletRequest request, Login login, String result);
	
//	protected Map<String, Object> session = null;
	
	public String execute() throws Exception {
		
		
		int inParamsNum = 0;
		String actionName = "";
		Map<String, Parameter> parameters = new HashMap<String, Parameter>();
		Map<String, Object> session = null;
		Login login = null;
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		LinkedHashMap<String, Object> inParams;
		HashMap<String, Object> params = null;
		ActionContext ctx = null;
		StoreProcedureResult object = new StoreProcedureResult();
		String result = ERROR;
		String suffix = "_";
		
		ctx = ActionContext.getContext();
		parameters = ctx.getParameters();
		request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		
		response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
		session = ctx.getSession();	
		login = (Login) session.get("login");
		
		//call customize set base params for store procedure
		params = new HashMap<String, Object>();
		params = setParams(params, login);
		
		inParamsNum = Util.getIntParam(params, "inParamsNum");
		
		if (suffix.trim().equalsIgnoreCase("_")) suffix = "";
		
		inParams = new LinkedHashMap<String, Object>();
		
		if (inParamsNum>0) {
			for (int i=0; i<inParamsNum; i++) {
				String param = Util.getStringParam(parameters, "inParam"+(i+1));
				inParams.put("inParam"+(i+1), param);
			}
		}
		
		//manage InputParams
		inParams = (LinkedHashMap<String, Object>) manageInputParams(inParams, login);
		params.put("inParams", inParams);
		
		if (!params.get("sPName").toString().isEmpty()) {
					
			String sPName = (String) params.get("sPName");
			String sPPackage = (String) params.get("sPPackage");
			String serviceLocator = (String) params.get("serviceLocator");
			Class resultClass = (Class) params.get("resultClass");
			List<Integer> outParams = new ArrayList<Integer>();
			if (params.get("outParams") != null) {
				outParams = (List<Integer>) params.get("outParams");
			}
			
			object = spm.callSP(serviceLocator, sPName, inParams.values().toArray(), outParams.toArray(), resultClass);
			
			if (object.getStatus().equals("B")) {
				return ERROR;
			}
		}
		
		object.setParams(params);
		
		//manipulateResult
		object = manipulateResult(object, login);
		
		//object = objectDeser(object);
		
		//set result in request
		request.setAttribute("result" + suffix, object.getResult());
		
		//setResultAction
		result = setResultAction(object, request, login, result);
		
		logger.info("Struts Action " +  " result: " + result + " eseguita con successo!!");
        //return !result.equalsIgnoreCase("") ? "success" : result;
		return result;
		
	}

}
