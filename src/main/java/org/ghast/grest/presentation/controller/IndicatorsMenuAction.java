package org.ghast.grest.presentation.controller;

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
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.Parameter;
import org.ghast.grest.architecture.database.StoreProcedureManager;
import org.ghast.grest.architecture.model.Login;
import org.ghast.grest.architecture.model.StoreProcedureResult;
import org.ghast.grest.buisness.model.GrestModel;
import org.ghast.grest.presentation.controller.impl.InfoGrestOratoryByGrestImpl;
import org.ghast.grest.presentation.controller.impl.SelectDefaultGrestImpl;
import org.ghast.grest.presentation.controller.impl.SelectGrestImpl;
import org.ghast.grest.presentation.controller.impl.PersonSubListByGrestImpl.SerializedObj;
import org.ghast.grest.presentation.model.Grest;
import org.ghast.grest.presentation.model.GrestOratory;
import org.ghast.grest.presentation.model.Indicator;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndicatorsMenuAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8830315492487543122L;
	private static Logger logger = LogManager.getLogger(IndicatorsMenuAction.class);
	private static StoreProcedureManager spm = new StoreProcedureManager();
	private InputStream inputStream;
	
	public String execute() throws Exception {
		
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
		List<Integer> outParams = new ArrayList<Integer>();
		String result = ERROR;
		String suffix = "_";
		
		ctx = ActionContext.getContext();
		parameters = ctx.getParameters();
		request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		
		response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
		session = ctx.getSession();	
		login = (Login) session.get("login");
		
		if (login != null) {
		
			params = new HashMap<String, Object>();
			
			if (suffix.trim().equalsIgnoreCase("_")) suffix = "";
			
			List<Object> resList = new ArrayList<Object>();
			
			String param = Util.getStringParam(parameters, "inParam1");
			
			//IndicatorsSubByGrest
				List<Indicator> list = null;
				inParams = new LinkedHashMap<String, Object>();
				inParams.put("inParam1", param);
				String serviceLocator = "grest";
				String sPPackage = "";
				String storedProcedureName = "IndicatorSubByGrest";
				int inParamsNum = 1;
				String resultClass = "org.ghast.grest.presentation.model.Indicator";
				Class clazz = null;
				if (resultClass != null && !resultClass.trim().equalsIgnoreCase("")) {
					try {
						clazz = Class.forName(resultClass);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				StoreProcedureResult item = new StoreProcedureResult();
				item = spm.callSP(serviceLocator, storedProcedureName, inParams.values().toArray(), 
						outParams.toArray(), clazz);
				if (item.getStatus().equals("B")) {
					result = ERROR;
				}
				list = (ArrayList<Indicator>) item.getResult();
				resList.add(list.get(0));
			
			//IndicatorsSubByGrest
				list = null;
				inParams = new LinkedHashMap<String, Object>();
				inParams.put("inParam1", param);
				serviceLocator = "grest";
				sPPackage = "";
				storedProcedureName = "IndicatorsReceiptByGrest";
				/*inParamsNum = 1;
				resultClass = "org.ghast.grest.presentation.model.Indicator";
				clazz = null;
				if (resultClass != null && !resultClass.trim().equalsIgnoreCase("")) {
					try {
						clazz = Class.forName(resultClass);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}*/
				item = new StoreProcedureResult();
				item = spm.callSP(serviceLocator, storedProcedureName, inParams.values().toArray(), 
						outParams.toArray(), clazz);
				if (item.getStatus().equals("B")) {
					result = ERROR;
				}
				list = (ArrayList<Indicator>) item.getResult();
				resList.add(list.get(0));
					
			
			SerializedObj resSer = new SerializedObj();
			resSer.data = resList;
			inputStream = new ByteArrayInputStream(new Gson().toJson(resSer).getBytes());
			
			result = "stream";
			
		}
		else {
			result = LOGIN;
		}
		
		logger.info("Struts Action HomeAction" +  " result: " + result + " eseguita con successo!!");

		return result;
	}
	
	public class SerializedObj implements Serializable {
		protected List<Object> data;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}
