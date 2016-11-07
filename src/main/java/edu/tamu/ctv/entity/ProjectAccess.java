package edu.tamu.ctv.entity;

import java.util.Date;

import javax.annotation.Generated;

import org.hibernate.annotations.GenericGenerator;

public class ProjectAccess implements java.io.Serializable
{
	
	@Generated(value="GenerationTime.INSERT")
	@GenericGenerator(name="fieldGenerator", strategy="sequence")
	private Long id;
	private Integer project_id;
	private Integer user_id;
	private Date createddt;
	private Date lastupdateddat;
	private char read;
	private char write;
	private char is_Active;
	
	public char getIs_Active() {
		return is_Active;
	}
	public void setIs_Active(char is_Active) {
		this.is_Active = is_Active;
	}
	public Date getLastupdateddat() {
		return lastupdateddat;
	}
	public void setLastupdateddat(Date lastupdateddat) {
		this.lastupdateddat = lastupdateddat;
	}
	public Integer getProject_id() {
		return project_id;
	}
	public void setProject_id(Integer project_id) {
		this.project_id = project_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Date getCreateddt() {
		return createddt;
	}
	public void setCreateddt(Date createddt) {
		this.createddt = createddt;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public char getRead() {
		return read;
	}
	public void setRead(char read) {
		this.read = read;
	}
	public char getWrite() {
		return write;
	}
	public void setWrite(char write) {
		this.write = write;
	}
	
	

}
