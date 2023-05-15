package org.ghast.grest.architecture.database;

import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ServiceLocator {
	
	private static Logger logger = LogManager.getLogger(ServiceLocator.class);
	
	private static HashMap<String,DataSource> cacheDB = new HashMap<String,DataSource>();
	
	static {
		
		cacheDB.put("grest", obtainDataSource("java:/comp/env/jdbc/grestDB"));
		
	}
	
	private static synchronized DataSource obtainDataSource(String resourcePath) {
		
		Context ctx = null;
		DataSource ds = null;
		try {
			
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(resourcePath);
			
		} catch (NamingException e) {
			
			logger.error("Eccezione in lookup della risorsa: "+resourcePath, e);
			
		}
		return ds;
		
	}
	
	public static synchronized DataSource getGrestDBDataSource() throws NamingException {
		
		return cacheDB.get("grest");
		
	}
	
}
