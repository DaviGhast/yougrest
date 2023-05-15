package org.ghast.grest.architecture.model;

import java.io.Serializable;
import java.net.Inet4Address;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.ghast.grest.presentation.model.Grest;
import org.ghast.grest.presentation.model.Oratory;
import org.ghast.grest.presentation.model.Oratory2;

public class Login implements Serializable {

	private static final long serialVersionUID = 1L;
	private static Logger logger = LogManager.getLogger(Login.class);
	
	private String username;
	private String role;
	private String terminal;
	private Inet4Address ipAddress;
	private String location;
	private Oratory2 oratory;
	private List<Oratory2> listOratories;
	private Grest selectedGrest;
	private LocalDateTime loginDateTime;
	private HashMap<LocalDateTime, String> history;
	private String currentFunction;
	
		
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getTerminal() {
		return terminal;
	}
	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}
	public Inet4Address getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(Inet4Address ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public LocalDateTime getLoginDateTime() {
		return loginDateTime;
	}
	public void setLoginDateTime(LocalDateTime loginDateTime) {
		this.loginDateTime = loginDateTime;
	}
	public HashMap<LocalDateTime, String> getHistory() {
		return history;
	}
	public void setHistory(HashMap<LocalDateTime, String> history) {
		this.history = history;
	}
	public String getCurrentFunction() {
		return currentFunction;
	}
	public void setCurrentFunction(String currentFunction) {
		this.currentFunction = currentFunction;
	}
	public Grest getSelectedGrest() {
		return selectedGrest;
	}
	public void setSelectedGrest(Grest selectedGrest) {
		this.selectedGrest = selectedGrest;
	}
	public List<Oratory2> getListOratories() {
		return listOratories;
	}
	public void setListOratories(List<Oratory2> listOratories) {
		this.listOratories = listOratories;
	}
	public Oratory2 getOratory() {
		return oratory;
	}
	public void setOratory(Oratory2 oratory) {
		this.oratory = oratory;
	}
	
	
}
