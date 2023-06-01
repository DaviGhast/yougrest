package org.ghast.grest.presentation.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import org.ghast.grest.presentation.model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ReportsPageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8830315492487543122L;
	private static Logger logger = LogManager.getLogger(ReportsPageAction.class);
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
			
			/*String sub_id = Util.getStringParam(parameters, "inParam1");
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
			personSubList.setPerson_id(person_id);*/
			
			List<Object> resList = new ArrayList<Object>();
			
			//GetAllOratory
				List<Oratory2> oratories = null;
				inParams = new LinkedHashMap<String, Object>();
				String serviceLocator = "grest";
				String sPPackage = "";
				String storedProcedureName = "GetAllOratory";
				int inParamsNum = 0;
				String resultClass = "org.ghast.grest.presentation.model.Oratory2";
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
				oratories = (ArrayList<Oratory2>) item.getResult();
				//position 0
				resList.add(oratories);
				
			//GetAllUser
				List<User> users = null;
				inParams = new LinkedHashMap<String, Object>();
				serviceLocator = "grest";
				sPPackage = "";
				storedProcedureName = "GetAllUserByRole";
				inParamsNum = 0;
				resultClass = "org.ghast.grest.presentation.model.User";
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
				users = (ArrayList<User>) item.getResult();
				Collections.sort(users, new Comparator<User>() {
				    @Override
				    public int compare(User o1, User o2) {
				        return o1.getUsername().compareTo(o2.getUsername());
				    }
				});
				//position 1
				resList.add(users);
				
			//GetReceiptByDate
				List<Receipt2> receipts = null;
				inParams = new LinkedHashMap<String, Object>();
				inParams.put("inParam1", LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
				serviceLocator = "grest";
				sPPackage = "";
				storedProcedureName = "GetReceiptByDate";
				inParamsNum = 1;
				resultClass = "org.ghast.grest.presentation.model.Receipt2";
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
				receipts = (ArrayList<Receipt2>) item.getResult();
				//position 2
				resList.add(receipts);
				
			List<Object> reports = new ArrayList<Object>();
			for (Oratory2 oratory : oratories) {
				List<Object> reportsOratory = new ArrayList<Object>();
				for (Oratory2 oratory1 : oratories) {
					List<Object> reportsColumns = new ArrayList<Object>();
					double totReport = 0.0;
					for (Receipt2 receipt : receipts) {
						if (receipt.getPayment_oratory_location().equals(oratory.getLocation())) {
							if (receipt.getSub_oratory_location().equals(oratory1.getLocation())) {
								totReport += Double.parseDouble(receipt.getTotal());
							}
						}
					}
					reportsColumns.add(totReport);
					for (User user : users) {
						double totCont = 0.0;
						double totPos = 0.0;
						for (Receipt2 receipt : receipts) {
							if (receipt.getUsername().equals(user.getUsername())) {
								if (receipt.getPayment_oratory_location().equals(oratory.getLocation())) {
									if (receipt.getSub_oratory_location().equals(oratory1.getLocation())) {
										if (receipt.getType().equals("CONT")) {
											totCont += Double.parseDouble(receipt.getTotal());
										} else {
											totPos += Double.parseDouble(receipt.getTotal());
										}
									}
								}
							}
						}
						String string = "CONT: "+String.valueOf(totCont)+" &euro;<br/>"+"POS: "+String.valueOf(totPos)+" &euro;";
						reportsColumns.add(string);
					}
					reportsOratory.add(reportsColumns);
				}
				reports.add(reportsOratory);
			}
			
			//position 3
			resList.add(reports);
			
			//position 4
			resList.add(users.size());
			
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
