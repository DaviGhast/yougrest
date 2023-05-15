package org.ghast.grest.presentation.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
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
import org.ghast.grest.presentation.controller.impl.PersonSubListByGrestImpl.SerializedObj;
import org.ghast.grest.presentation.model.Grest;
import org.ghast.grest.presentation.model.GrestOratory;
import org.ghast.grest.presentation.model.PersonSubList;
import org.ghast.grest.presentation.model.Receipt;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CreateReceipt extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8830315492487543122L;
	private static Logger logger = LogManager.getLogger(CreateReceipt.class);
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
			
			String surnameAndName = Util.getStringParam(parameters, "inParam1");
			String oratory = Util.getStringParam(parameters, "inParam2");
			String rawbody = Util.getStringParam(parameters, "inParam3");
			String amount = Util.getStringParam(parameters, "inParam4");
			String type = Util.getStringParam(parameters, "inParam5");
			String rest = Util.getStringParam(parameters, "inParam6");
			String exoneration = Util.getStringParam(parameters, "inParam7");
			
			Receipt receipt = new Receipt();
			String header = "";
			String body = "";
			String footer = "";
			
			ArrayList<String> receiptHeader = new ArrayList<String>();
			
			receiptHeader.add("Data e Ora: "+
					LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))+" "+
	                LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm")));
			receiptHeader.add("Nominativo: "+surnameAndName);
			receiptHeader.add("------------------------------------");
			
			for (String string : receiptHeader) {
				header += string;
				header += "\n";
			}
			
			receipt.setHeader(header);
			
			ArrayList<String> receiptBody = new ArrayList<String>();
			String TITOLOBODY = " Cosa hai pagato              Prezzo  ";
	        receiptBody.add(TITOLOBODY);
	        
	        double totalPrice = 0.0;
	        
	        if (!rawbody.isEmpty()) {
	        	String[] rawRowsBody = rawbody.split(";");
				for (String string : rawRowsBody) {
					String name = string.split(":")[0];
					String price = string.split(":")[1];
					totalPrice += Double.parseDouble(price); 
					
					receiptBody.add(adapter2(name, price +" €"));
				}
	        }
			
	        receiptBody.add("------------------------------------");
			
	        for (String string : receiptBody) {
	        	body += string;
	        	body += "\n";
			}
			
			receipt.setBody(body);
			
			ArrayList<String> receiptFooter = new ArrayList<String>();
			
			if (exoneration.equals("1")) {
				totalPrice = 0.0;
				receiptFooter.add(adapter("Esonerato dal Pagamento",0));
			} else {
				receiptFooter.add(adapter2("Tot. Spesa:", totalPrice +" €"));
		        receiptFooter.add(adapter2("Importo:", amount +" €"));
		        if (type.equals("CONT")){
		            receiptFooter.add(adapter2("Resto:", rest +" €"));
		            receiptFooter.add(adapter("Pagamento Effettuato con Contanti",0));
		        } else {
		            receiptFooter.add(adapter("Pagamento Effettuato con POS",0));
		        }
			}
	        receiptFooter.add("************************************");
	        receiptFooter.add("Ricevuta Emessa dall'oratorio");
	        receiptFooter.add("di "+oratory);
	        receiptFooter.add(adapter("Grazie, a Presto",0));
	        
	        for (String string : receiptFooter) {
				footer += string;
				footer += "\n";
			}
	        
	        receipt.setFooter(footer);
			
			int rows = receiptHeader.size()+receiptBody.size()+receiptFooter.size();
			receipt.setRows(String.valueOf(rows+1));
			
			receipt.setTotal(String.valueOf(totalPrice));
			
			SerializedObj resSer = new SerializedObj();
			resSer.data = receipt;
			inputStream = new ByteArrayInputStream(new Gson().toJson(resSer).getBytes());
			
			result = "stream";
			
		}
		else {
			result = LOGIN;
		}
		
		logger.info("Struts Action HomeAction" +  " result: " + result + " eseguita con successo!!");

		return result;
	}
	
	private String adapter(String string, int align){
        int maxLength = 38;
        String space = " ";
        if (string.length()<maxLength){
            if (align == -1){
                StringBuilder stringBuilder = new StringBuilder(string);
                for (int i = stringBuilder.length(); i < maxLength; i++) {
                    stringBuilder.append(space);
                }
                string = stringBuilder.toString();
            } else if (align == 1){
                StringBuilder stringBuilder = new StringBuilder(string);
                for (int i = stringBuilder.length(); i < maxLength; i++) {
                    stringBuilder.insert(0, space);
                }
                string = stringBuilder.toString();
            } else {
                int rest = maxLength - string.length();
                //System.out.println(rest);
                StringBuilder stringBuilder = new StringBuilder(string);
                for (int i = 0; i < rest/2; i++) {
                    stringBuilder.insert(0, space);
                }
                for (int i = 0; i < rest/2; i++) {
                    stringBuilder.append(space);
                }
                string = stringBuilder.toString();
                //System.out.println("["+string+"]");
            }
        }
        return string;
    }
	
	private String adapter2(String stringSx, String stringDx){
        int maxLength = 38;
        String output = "";
        String space = " ";
        stringSx = space + stringSx;
        stringDx = stringDx + space + space;
        if ((stringSx.length()+stringDx.length())<maxLength){
            int rest = maxLength - (stringSx.length()+stringDx.length());
            //System.out.println(rest);
            StringBuilder stringBuilder = new StringBuilder(output);
            stringBuilder.append(stringSx);
            for (int i = 0; i < rest; i++) {
                stringBuilder.append(space);
            }
            stringBuilder.append(stringDx);
            output = stringBuilder.toString();
            //System.out.println("["+string+"]");
        } else{
            output = stringSx + stringDx;
        }
        return output;
    }
	
	public class SerializedObj implements Serializable {
		protected Receipt data;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	

}
