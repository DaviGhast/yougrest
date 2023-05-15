package org.ghast.grest.presentation.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import org.ghast.grest.presentation.model.Grest;
import org.ghast.grest.presentation.model.GrestOratory;
import org.ghast.grest.presentation.model.GrestOratory2;
import org.ghast.grest.presentation.model.Oratory;
import org.ghast.grest.presentation.model.Oratory2;
import org.ghast.grest.presentation.model.PersonSubList;
import org.ghast.grest.presentation.model.Receipt;
import org.ghast.grest.presentation.model.Receipt2;
import org.ghast.grest.presentation.model.Week;
import org.ghast.grest.presentation.model.SubPayment;
import org.ghast.grest.presentation.model.SubWeek;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WelcomePageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8830315492487543122L;
	private static Logger logger = LogManager.getLogger(WelcomePageAction.class);
	private static StoreProcedureManager spm = new StoreProcedureManager();
	
	@SuppressWarnings("unchecked")
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
			
			String week = Util.getStringParam(parameters, "inParam1");
			String day = Util.getStringParam(parameters, "inParam2");
			
			List<Object> resList = new ArrayList<Object>();
			
			resList.add(week);
			resList.add(day);
				
			//GetGrestOratoryByIds
				List<GrestOratory2> grestOratory = null;
				inParams = new LinkedHashMap<String, Object>();
				inParams.put("inParam1", login.getSelectedGrest().getId());
				inParams.put("inParam2", login.getOratory().getId());
				String serviceLocator = "grest";
				String sPPackage = "";
				String storedProcedureName = "GetGrestOratoryByIds";
				int inParamsNum = 2;
				String resultClass = "org.ghast.grest.presentation.model.GrestOratory2";
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
				grestOratory = (ArrayList<GrestOratory2>) item.getResult();
				//position 2
				resList.add(grestOratory.get(0));
			
			
			object.setResult(resList);
			
			//set result in request
			request.setAttribute("result" + suffix, object.getResult());
					
			//setResultAction
			//result = setResultAction(object, request, login, result);
			
			result = SUCCESS;
			
		}
		else {
			result = LOGIN;
		}
		
		logger.info("Struts Action " + this.getClass().getName() + " result: " + result + " eseguita con successo!!");

		return result;
	}

}
