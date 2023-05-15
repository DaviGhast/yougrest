package org.ghast.grest.architecture.database;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.ghast.grest.architecture.model.StoreProcedureResult;



public class StoreProcedureManager {
	
	private static Logger logger = LogManager.getLogger(StoreProcedureManager.class);
	
	private static List<Object> wrapResult(ResultSet rs, Class<?> resultClass) 
			throws SQLException, InstantiationException, IllegalAccessException, 
			IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		
		ResultSetMetaData resMeta = rs.getMetaData();
		int columnCount = resMeta.getColumnCount();
		
		Vector<String> columnsNames = new Vector<String>();
		Vector<String> columnsTypes = new Vector<String>();
		for (int i=1; i<columnCount+1; i++) {
			columnsNames.addElement(resMeta.getColumnLabel(i).toLowerCase());
			columnsTypes.addElement(resMeta.getColumnTypeName(i).toLowerCase());
		}
			
		List<Object> resultList = new ArrayList<Object>();
		
		while (rs.next()) {
			Object resultObject = resultClass.getDeclaredConstructor().newInstance();
			for (int i=0; i<columnCount; i++) {
				Method method = null;
				try {
					if (columnsTypes.get(i).equalsIgnoreCase("int")) {
						method = resultClass.getDeclaredMethod("set"+columnsNames.get(i).substring(0, 1).toUpperCase()+
								columnsNames.get(i).substring(1), int.class);
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("varchar")) {
						method = resultClass.getDeclaredMethod("set"+columnsNames.get(i).substring(0, 1).toUpperCase()+
								columnsNames.get(i).substring(1), String.class);
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("bigint")) {
						method = resultClass.getDeclaredMethod("set"+columnsNames.get(i).substring(0, 1).toUpperCase()+
								columnsNames.get(i).substring(1), long.class);
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("tinyint")) {
						method = resultClass.getDeclaredMethod("set"+columnsNames.get(i).substring(0, 1).toUpperCase()+
								columnsNames.get(i).substring(1), byte.class);
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("double")) {
						method = resultClass.getDeclaredMethod("set"+columnsNames.get(i).substring(0, 1).toUpperCase()+
								columnsNames.get(i).substring(1), double.class);
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("date")) {
						method = resultClass.getDeclaredMethod("set"+columnsNames.get(i).substring(0, 1).toUpperCase()+
								columnsNames.get(i).substring(1), LocalDate.class);
					}
				}
				catch (Exception e) {
					// TODO: handle exception
					method = resultClass.getDeclaredMethod("set"+columnsNames.get(i).substring(0, 1).toUpperCase()+
							columnsNames.get(i).substring(1), String.class);
				}
				/*String item = null;
				try {
					
					item = rs.getString(columnsNames.get(i).toUpperCase());
					if (item.length()>1 && item.charAt(0) == '0') {
						
					}
					else {
						float temp = rs.getFloat(columnsNames.get(i).toUpperCase());
						if ((temp+"").trim().indexOf("E")!=-1) {
							item = rs.getString(columnsNames.get(i).toUpperCase());
						}
						else {
							long intPart = (long) temp;
							float decPart = temp - intPart;
							if (decPart==0.0) item = intPart+"";
							else item = temp+"";
						}
						Long longNumber = Long.valueOf(0);
						item = item == null ? longNumber + "" : item;
					}
				}
				catch (Exception e) {
					item = rs.getString(columnsNames.get(i).toUpperCase());
					item = item == null ? "" : item;
				}*/
				Object item = null;
				try {
					if (columnsTypes.get(i).equalsIgnoreCase("int")) {
						item = rs.getInt(columnsNames.get(i).toLowerCase());
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("varchar")) {
						item = rs.getString(columnsNames.get(i).toLowerCase());
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("bigint")) {
						item = rs.getLong(columnsNames.get(i).toLowerCase());
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("tinyint")) {
						item = rs.getByte(columnsNames.get(i).toLowerCase());
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("double")) {
						item = rs.getDouble(columnsNames.get(i).toLowerCase());
					}
					else if (columnsTypes.get(i).equalsIgnoreCase("date")) {
						item = rs.getDate(columnsNames.get(i).toLowerCase()).toLocalDate();
					}
				}
				catch (Exception e) {
					// TODO: handle exception
					item = rs.getString(columnsNames.get(i).toLowerCase());
				}
				try {
					method.invoke(resultObject,item);
				}
				catch (Exception e) {
					method.invoke(resultObject,String.valueOf(item));
				}
			}
			resultList.add(resultObject);
			
		}
		return resultList;
		
	}
	
	public StoreProcedureResult callSP(String serviceLocator, String nameSP, Object[] paramsIN, Object[] paramsOUT, Class resultClass) {
		
		Connection cn = null;
		CallableStatement cs = null;
		StoreProcedureResult spr = new StoreProcedureResult();
		ResultSet rs = null;
		
		String callSP =  "";
		
		callSP = "{call " + serviceLocator + "." + nameSP + "(";
		
		int maxParam = paramsIN.length;
		
		for (int i=0; i<maxParam;i++) {
			if (i==(maxParam-1))
				callSP += " ? ";
			else callSP += " ? ,";
		}
		
		if (paramsOUT != null || paramsOUT.length>0) {
			for (int i=0; i<paramsOUT.length; i++) {
				if (i==(-1+paramsOUT.length)) 
					callSP += " ? ";
				else callSP += " ? ,";
			}
		}
		
		callSP += ")}";
		
		try {
			
			DataSource ds = null;
			
			try {
				ds = ServiceLocator.getGrestDBDataSource();		
			} catch (NamingException e) {
				spr.setStackTrace(e.getStackTrace());
				spr.setStatus("B");
				spr.setErrorCode("NamingException");
				spr.setErrorMessage(e.getMessage());
			}
			
			try {
				
				cn = ds.getConnection();
				
			} catch (SQLException e) {
				
				logger.error("Eccezione SQL: "+e.getMessage(), e);
				
			}
			
			cs = cn.prepareCall(callSP);
			
			int r=0;
			
			for (int i=0; i<maxParam; i++) {
				r++;
				if (paramsIN[i] instanceof String) {
					cs.setString(r, String.valueOf(paramsIN[i]));
				}
			}
			
			if (paramsOUT != null) {
				for (int i=0; i<paramsOUT.length; i++) {
					r++;
					cs.registerOutParameter(r, (Integer) paramsOUT[i]);
				}
			}
			
			
			cs.execute();
			rs = cs.getResultSet();
			
			List<Object> res = new ArrayList<Object>();
			
			if (rs!=null)
				try {
					res = wrapResult(rs, resultClass);
				} catch (Exception e) {
					// TODO: handle exception
				}
			
			else res = null;
			spr.setResult(res);
			
			if (rs!=null)
				rs.close();
			rs = null;
			
			spr.setErrorMessage("");
			spr.setStatus("G");
			
			logger.info("Stored procedure " + serviceLocator + "." + nameSP + " eseguita con successo!!");
			
			
			cs.close();
			
		} catch (SQLException e) {
			
			int sqlErrorCode = e.getErrorCode();
			String sqlState = e.getSQLState();
			String sqlMsg = e.getMessage();
			
			logger.error("Errore Stored procedure " + serviceLocator + "." + nameSP + " >>> " + e.getMessage());
			
			spr.setStackTrace(e.getStackTrace());
			spr.setStatus("B");
			spr.setErrorCode(String.valueOf(e.getSQLState() + " - " + e.getErrorCode()));
			spr.setErrorMessage(e.getMessage());
			
			if (cn != null)
				try {
					cn.rollback();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			
		} finally {
			
			if (cs != null)
				try {
					cs.close();
				} catch (SQLException e) {
					spr.setStackTrace(e.getStackTrace());
					spr.setStatus("B");
					spr.setErrorCode(String.valueOf(e.getSQLState() + " - " + e.getErrorCode()));
					spr.setErrorMessage(e.getMessage());
				}
			
			if (cn != null)
				try {
					cn.close();
				} catch (SQLException e) {
					spr.setStackTrace(e.getStackTrace());
					spr.setStatus("B");
					spr.setErrorCode(String.valueOf(e.getSQLState() + " - " + e.getErrorCode()));
					spr.setErrorMessage(e.getMessage());
				}
			
		}
		
		return spr;
		
	}

}
