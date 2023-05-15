package org.ghast.grest.presentation.controller;

import java.util.HashMap;

import org.ghast.grest.architecture.model.StoreProcedureResult;

public class ZeusBean {

	private StoreProcedureResult resultObj;
	private String userName;

	public StoreProcedureResult getResultObj() {
		return resultObj;
	}

	public void setResultObj(HashMap<String, Object> params) {
		this.resultObj = new StoreProcedureResult();
		resultObj.setParams(params);
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setResultObj(StoreProcedureResult spr) {
		this.resultObj = spr;
	}
	
		

}
