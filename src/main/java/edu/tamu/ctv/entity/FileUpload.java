package edu.tamu.ctv.entity;

import java.util.Date;


public class FileUpload implements java.io.Serializable
{
	private Integer id;
	private Integer project_id;
	private String filename;
	private String filelocation;
	private Integer createdby;
	private Integer lastmodifiedby;
	private Date registereddt;
	private Date lastupdatedt;
	
	public Integer getProject_id() {
		return project_id;
	}

	public FileUpload()
	{
	}
	
	public FileUpload(Integer id, Integer project_id, String filename, String filelocation, Integer createdby, Integer lastmodifiedby, Date registereddt, Date lastupdatedt)
	{
		this.id = id;
		this.project_id = project_id;
		this.filename=filename;
		this.filelocation = filelocation;
		this.createdby =createdby;
		this.lastmodifiedby = lastmodifiedby;
		this.registereddt = registereddt;
		this.lastupdatedt = lastupdatedt;
		
	}
	
	public void setProject_id(Integer project_id) {
		this.project_id = project_id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilelocation() {
		return filelocation;
	}

	public void setFilelocation(String filelocation) {
		this.filelocation = filelocation;
	}

	public boolean isNew()
	{
		return null == id;
	}
	
	
	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getCreatedby()
	{
		return createdby;
	}

	public void setCreatedby(Integer createdby)
	{
		this.createdby = createdby;
	}

	public Integer getLastmodifiedby()
	{
		return lastmodifiedby;
	}

	public void setLastmodifiedby(Integer lastmodifiedby)
	{
		this.lastmodifiedby = lastmodifiedby;
	}

	public Date getRegistereddt()
	{
		return registereddt;
	}

	public void setRegistereddt(Date registereddt)
	{
		this.registereddt = registereddt;
	}

	public Date getLastupdatedt()
	{
		return lastupdatedt;
	}

	public void setLastupdatedt(Date lastupdatedt)
	{
		this.lastupdatedt = lastupdatedt;
	}

	

}
