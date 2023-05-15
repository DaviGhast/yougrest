package org.ghast.grest.presentation.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.ghast.grest.architecture.database.StoreProcedureManager;
import org.ghast.grest.architecture.model.StoreProcedureResult;
import org.ghast.grest.buisness.model.GrestModel;

public class GrestController {

	public String execute() {
        
		LinkedHashMap<String, Object> inputParams = new LinkedHashMap<String, Object>() {{}};
		
		StoreProcedureManager spm = new StoreProcedureManager();
		StoreProcedureResult spr = new StoreProcedureResult();
		
		String className = "org.ghast.grest.buisness.model.Grest";
		Class resultClass = null;
		try {
			resultClass = Class.forName(className);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Integer> outParams = new ArrayList<Integer>();
		
		spr = spm.callSP("grest", "selectGrest", inputParams.values().toArray(), outParams.toArray(), resultClass);
		
		List<GrestModel> grestList = (ArrayList<GrestModel>) spr.getResult();
		
		
        return "success";
    }
	
}
