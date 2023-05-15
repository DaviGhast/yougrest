package org.ghast.grest.architecture.model;

import java.io.Serializable;
import java.util.HashMap;

public class StoreProcedureResult implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Object result;
	private String errorCode;
	private String status;
	private String errorMessage;
	private String resultClassName;
	private HashMap<String, Object> params;
	private StackTraceElement[] stackTrace;
	private int columnCount;
	private String[] columnName;
	private String resultJSON;
	
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getResultClassName() {
		return resultClassName;
	}
	public void setResultClassName(String resultClassName) {
		this.resultClassName = resultClassName;
	}
	public HashMap<String, Object> getParams() {
		return params;
	}
	public void setParams(HashMap<String, Object> params) {
		this.params = params;
	}
	public StackTraceElement[] getStackTrace() {
		return stackTrace;
	}
	public void setStackTrace(StackTraceElement[] stackTrace) {
		this.stackTrace = stackTrace;
	}
	public int getColumnCount() {
		return columnCount;
	}
	public void setColumnCount(int columnCount) {
		this.columnCount = columnCount;
	}
	public String[] getColumnName() {
		return columnName;
	}
	public void setColumnName(String[] columnName) {
		this.columnName = columnName;
	}
	public String getResultJSON() {
		return resultJSON;
	}
	public void setResultJSON(String resultJSON) {
		this.resultJSON = resultJSON;
	}
	
}
