package org.ghast.grest.presentation.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.ghast.grest.architecture.model.Login;

public class ActiveSessionListener implements HttpSessionListener, HttpSessionAttributeListener {

	private static Logger logger = LogManager.getLogger(ActiveSessionListener.class);
	
	private Map<String, String> activeUserMap = new HashMap<String, String>();;
	private static Map<String, HttpSession> usersSessions = new HashMap<String, HttpSession>();
	
	public void sessionCreated(HttpSessionEvent event) {
		Date date = new Date(event.getSession().getCreationTime());
		
		//System.out.println("-- HttpSessionListener#sessionCreated invoked --");
		logger.info("HttpSessionListener#sessionCreated invoked");
	    HttpSession session = event.getSession();
	    //System.out.println("session id: " + session.getId());
	    logger.info("session id: " + session.getId());
	    session.setMaxInactiveInterval(900);//in seconds
	}
	
	@SuppressWarnings("unchecked")
	public void sessionDestroyed(HttpSessionEvent event) {
		Date date = new Date(event.getSession().getCreationTime());
		
		System.out.println("-- HttpSessionListener#sessionDestroyed invoked --");
		
		ServletContext servletContext = event.getSession().getServletContext();
		
		activeUserMap = (HashMap<String, String>) servletContext.getAttribute("activeUserMap");
		if (activeUserMap != null && event != null && event.getSession() != null) {
			usersSessions.remove(activeUserMap.get(event.getSession().getId()));
			activeUserMap.remove(event.getSession().getId());
			servletContext.setAttribute("activeUserMap", activeUserMap);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void attributeAdded(HttpSessionBindingEvent event) {
		if (event.getValue().getClass().equals(Login.class)) {
			Login login = (Login) event.getValue();
			
			MainController mc = new MainController();
			ZeusHybridViewController zeusHybridViewController = mc.getHybridViewController();
			
			if (login != null ) {
				
				ServletContext servletContext = event.getSession().getServletContext();
				
				activeUserMap = (servletContext.getAttribute("activeUserMap") == null)
						? new HashMap<String, String>() : 
							(HashMap<String, String>) servletContext.getAttribute("activeUserMap");
				
				usersSessions.put(login.getUsername(), event.getSession());
				activeUserMap.put(event.getSession().getId(), login.getUsername());
				servletContext.setAttribute("activeUserMap", activeUserMap);
			}
		}
	}

	public static Map<String, HttpSession> getUsersSessions() {
		return usersSessions;
	}

	
	
}
