package org.ghast.grest.presentation.controller;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.Parameter;

public class Util {

	public static String getStringParamStatic(Parameter parameter, String name) {
		
		if (parameter.getName().equalsIgnoreCase(name))
			return parameter.getValue();
		else 
			return null;
		
	}
	
	public static String getStringParamArray(Parameter parameter, String name) {
		
		if (parameter.getName().equalsIgnoreCase(name))
			return parameter.getValue();
		else 
			return null;
		
	}
	
	public static String getStringParam(Map<String, Parameter> parameters, String name) {
		
		String result = "";
		if (parameters.get(name) != null && !parameters.get(name).getClass().isArray())
			result = getStringParamArray(parameters.get(name),name);
		else if (parameters.get(name) != null)
			result = getStringParamStatic(parameters.get(name),name);
		return result;
		
	}
	
	public static int getIntParam(Map<String, Object> params, String name) {
		
		int result = 0;
		if (params.get(name) != null && !params.get(name).getClass().isArray())
			result = (Integer) params.get(name);
		return result;
		
	}
	
	/*public static String getIntParam(Map<String, Parameter> parameters, String name) {
		
		String result = "0";
		if (parameters.get(name) != null && !parameters.get(name).getClass().isArray())
			result = getStringParamArray(parameters.get(name),name);
		else if (parameters.get(name) != null)
			result = getStringParamStatic(parameters.get(name),name);
		return result;
		
	}*/
	
	public static boolean getBooleanParam(Map<String, Parameter> parameters, String name) {
		
		boolean result = false;
		if (parameters.get(name) != null && !parameters.get(name).getClass().isArray())
			result = Boolean.valueOf(getStringParamArray(parameters.get(name),name));
		else if (parameters.get(name) != null)
			result = Boolean.valueOf(getStringParamStatic(parameters.get(name),name));
		return result;
		
	}

	public static List<?> wrapObjectList(List<?> objectList, Class<?> resultClass) {
		
		List<Object> resultObjectList = new ArrayList<Object>();
		for (Object object : objectList) {
			Object resultObject = null;
			try {
				resultObject = resultClass.getDeclaredConstructor().newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Method[] methods = object.getClass().getMethods();
			
			for (Method method : methods) {
				if (method.getName().contains("get")) {
					Method setMethod = null;
					Method[] methods1 = resultObject.getClass().getMethods();
					String name = method.getName().replace("get", "set");
					for (Method method1 : methods1) {
						if (method1.getName().equals(name)) {
							setMethod = method1;
						}
					}
					
					try {
						setMethod.invoke(resultObject, method.invoke(object));
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				System.out.print(method.getName());
			}
		}
		
		return resultObjectList;
		
	}
	
	public static Object wrapObject(Object inObject, Object outObject) {
		
		Method[] inMethods = inObject.getClass().getMethods();
		Method[] outMethods = outObject.getClass().getMethods();
		
		for (Method inMethod : inMethods) {
			if (inMethod.getName().contains("get") & !inMethod.getName().equals("getClass")) {
				Method setMethod = null;
				String name = inMethod.getName().replace("get", "set");
				for (Method outMethod : outMethods) {
					if (outMethod.getName().equals(name)) {
						setMethod = outMethod;
					}
				}
				
				String item = null;
				try {
					item = String.valueOf(inMethod.invoke(inObject));
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
					setMethod.invoke(outObject, item);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return outObject;
		
	}
	
}
