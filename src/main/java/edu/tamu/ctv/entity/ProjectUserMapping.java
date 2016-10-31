package edu.tamu.ctv.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import edu.tamu.ctv.entity.enums.Access;
import edu.tamu.ctv.entity.enums.Status;

public class ProjectUserMapping implements java.io.Serializable
{
	private Integer id;
	private Integer user_id;
	private Integer project_id;
	private Integer role;
	private char is_active;
	private Date registereddt;
	private Date lastvisitdt;
	
	public ProjectUserMapping()
	{
	}

	public Integer getId() {
		return id;
	}
	public boolean isNew()
	{
		return null == id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getProject_id() {
		return project_id;
	}

	public void setProject_id(Integer project_id) {
		this.project_id = project_id;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public char getIs_active() {
		return is_active;
	}

	public void setIs_active(char is_active) {
		this.is_active = is_active;
	}

	public Date getRegistereddt() {
		return registereddt;
	}

	public void setRegistereddt(Date registereddt) {
		this.registereddt = registereddt;
	}

	public Date getLastvisitdt() {
		return lastvisitdt;
	}

	public void setLastvisitdt(Date lastvisitdt) {
		this.lastvisitdt = lastvisitdt;
	}

	

}
