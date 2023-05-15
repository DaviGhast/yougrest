package org.ghast.grest.buisness.model;

import java.time.LocalDate;

public class GrestModel {
	
	private long id;
	private String name;
	private int year;
	private int num_weeks; 
	private LocalDate start_date;
	private double sub_price;
	private double week_price;
	private double lunch_price;
	private double pool_price; 
	private byte pool_day;
	private byte trip_day;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getNum_weeks() {
		return num_weeks;
	}
	public void setNum_weeks(int num_weeks) {
		this.num_weeks = num_weeks;
	}
	public LocalDate getStart_date() {
		return start_date;
	}
	public void setStart_date(LocalDate start_date) {
		this.start_date = start_date;
	}
	public double getSub_price() {
		return sub_price;
	}
	public void setSub_price(double sub_price) {
		this.sub_price = sub_price;
	}
	public double getWeek_price() {
		return week_price;
	}
	public void setWeek_price(double week_price) {
		this.week_price = week_price;
	}
	public double getLunch_price() {
		return lunch_price;
	}
	public void setLunch_price(double lunch_price) {
		this.lunch_price = lunch_price;
	}
	public double getPool_price() {
		return pool_price;
	}
	public void setPool_price(double pool_price) {
		this.pool_price = pool_price;
	}
	public byte getPool_day() {
		return pool_day;
	}
	public void setPool_day(byte pool_day) {
		this.pool_day = pool_day;
	}
	public byte getTrip_day() {
		return trip_day;
	}
	public void setTrip_day(byte trip_day) {
		this.trip_day = trip_day;
	}
	
}
