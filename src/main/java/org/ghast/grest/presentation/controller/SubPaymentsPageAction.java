package org.ghast.grest.presentation.controller;

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
import org.ghast.grest.presentation.model.Grest;
import org.ghast.grest.presentation.model.GrestOratory;
import org.ghast.grest.presentation.model.GrestOratory2;
import org.ghast.grest.presentation.model.PersonSubList;
import org.ghast.grest.presentation.model.Week;
import org.ghast.grest.presentation.model.SubPayment;
import org.ghast.grest.presentation.model.SubWeek;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SubPaymentsPageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8830315492487543122L;
	private static Logger logger = LogManager.getLogger(SubPaymentsPageAction.class);
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
			
			String sub_id = Util.getStringParam(parameters, "inParam1");
			String surname = Util.getStringParam(parameters, "inParam2");
			String name = Util.getStringParam(parameters, "inParam3");
			String school_class = Util.getStringParam(parameters, "inParam4");
			String oratory_location = Util.getStringParam(parameters, "inParam5");
			String person_id = Util.getStringParam(parameters, "inParam6");
			
			PersonSubList personSubList = new PersonSubList();
			personSubList.setId(sub_id);
			personSubList.setSurname(surname);
			personSubList.setName(name);
			personSubList.setSchool_class(school_class);
			personSubList.setOratory_location(oratory_location);
			personSubList.setPerson_id(person_id);
			
			List<Object> resList = new ArrayList<Object>();
			
			//position 0
			resList.add(personSubList);
			
			//GetSubPaymentBySubId
				List<SubPayment> subPaymentList = null;
				inParams = new LinkedHashMap<String, Object>();
				inParams.put("inParam1", sub_id);
				String serviceLocator = "grest";
				String sPPackage = "";
				String storedProcedureName = "GetSubPaymentBySubId";
				int inParamsNum = 1;
				String resultClass = "org.ghast.grest.presentation.model.SubPayment";
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
				subPaymentList = (ArrayList<SubPayment>) item.getResult();
				//position 1
				resList.add(subPaymentList.get(0));
				
			//GetWeekBySubId
				List<Week> weeks = null;
				inParams = new LinkedHashMap<String, Object>();
				inParams.put("inParam1", sub_id);
				serviceLocator = "grest";
				sPPackage = "";
				storedProcedureName = "GetWeekBySubId";
				inParamsNum = 1;
				resultClass = "org.ghast.grest.presentation.model.Week";
				clazz = null;
				if (resultClass != null && !resultClass.trim().equalsIgnoreCase("")) {
					try {
						clazz = Class.forName(resultClass);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				item = new StoreProcedureResult();
				item = spm.callSP(serviceLocator, storedProcedureName, inParams.values().toArray(), 
						outParams.toArray(), clazz);
				if (item.getStatus().equals("B")) {
					result = ERROR;
				}
				weeks = (ArrayList<Week>) item.getResult();
				//position 2
				resList.add(weeks);
				
			//GetGrestOratoryById
				List<GrestOratory2> grestOratories = null;
				inParams = new LinkedHashMap<String, Object>();
				inParams.put("inParam1", weeks.get(0).getGrest_oratory_id());
				serviceLocator = "grest";
				sPPackage = "";
				storedProcedureName = "GetGrestOratoryById";
				inParamsNum = 1;
				resultClass = "org.ghast.grest.presentation.model.GrestOratory2";
				clazz = null;
				if (resultClass != null && !resultClass.trim().equalsIgnoreCase("")) {
					try {
						clazz = Class.forName(resultClass);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				item = new StoreProcedureResult();
				item = spm.callSP(serviceLocator, storedProcedureName, inParams.values().toArray(), 
						outParams.toArray(), clazz);
				if (item.getStatus().equals("B")) {
					result = ERROR;
				}
				grestOratories = (ArrayList<GrestOratory2>) item.getResult();
				//position 3
				resList.add(grestOratories.get(0));
				
			//GetSubWeekBySubAndWeekId
				List<SubWeek> resultSubWeeks = new ArrayList<SubWeek>();
				for (Week week : weeks) {
					List<SubWeek> subWeeks = null;
					inParams = new LinkedHashMap<String, Object>();
					inParams.put("inParam1", sub_id);
					inParams.put("inParam2", week.getId());
					serviceLocator = "grest";
					sPPackage = "";
					storedProcedureName = "GetSubWeekBySubAndWeekId";
					inParamsNum = 2;
					resultClass = "org.ghast.grest.presentation.model.SubWeek";
					clazz = null;
					if (resultClass != null && !resultClass.trim().equalsIgnoreCase("")) {
						try {
							clazz = Class.forName(resultClass);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					item = new StoreProcedureResult();
					item = spm.callSP(serviceLocator, storedProcedureName, inParams.values().toArray(), 
							outParams.toArray(), clazz);
					if (item.getStatus().equals("B")) {
						result = ERROR;
					}
					subWeeks = (ArrayList<SubWeek>) item.getResult();
					resultSubWeeks.add(subWeeks.get(0));
				}
				//position 4
				resList.add(resultSubWeeks);
			
			//position 5
			resList.add(weeks.size());
			
			String subWeekIds = "";
			for (SubWeek subWeek : resultSubWeeks) {
				subWeekIds += subWeek.getId();
				subWeekIds += "-";
			}
			//position 6
			resList.add(subWeekIds);
			
			String weekIds = "";
			for (Week week : weeks) {
				weekIds += week.getId();
				weekIds += "-";
			}
			//position 7
			resList.add(weekIds);
			
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
