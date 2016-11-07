package edu.tamu.ctv.entity;

import java.io.Serializable;
import java.util.Date;

public class FileUpload
implements Serializable {
    private Integer id;
    private Long project_id;
    private String filename;
    private String filelocation;
    private Integer createdby;
    private Integer lastmodifiedby;
    private Date registereddt;
    private Date lastupdatedt;

    public Long getProject_id() {
        return this.project_id;
    }

    public FileUpload() {
    }

    public FileUpload(Integer id, Long project_id, String filename, String filelocation, Integer createdby, Integer lastmodifiedby, Date registereddt, Date lastupdatedt) {
        this.id = id;
        this.project_id = project_id;
        this.filename = filename;
        this.filelocation = filelocation;
        this.createdby = createdby;
        this.lastmodifiedby = lastmodifiedby;
        this.registereddt = registereddt;
        this.lastupdatedt = lastupdatedt;
    }

    public void setProject_id(Long project_id) {
        this.project_id = project_id;
    }

    public String getFilename() {
        return this.filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFilelocation() {
        return this.filelocation;
    }

    public void setFilelocation(String filelocation) {
        this.filelocation = filelocation;
    }

    public boolean isNew() {
        if (this.id == null) {
            return true;
        }
        return false;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCreatedby() {
        return this.createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public Integer getLastmodifiedby() {
        return this.lastmodifiedby;
    }

    public void setLastmodifiedby(Integer lastmodifiedby) {
        this.lastmodifiedby = lastmodifiedby;
    }

    public Date getRegistereddt() {
        return this.registereddt;
    }

    public void setRegistereddt(Date registereddt) {
        this.registereddt = registereddt;
    }

    public Date getLastupdatedt() {
        return this.lastupdatedt;
    }

    public void setLastupdatedt(Date lastupdatedt) {
        this.lastupdatedt = lastupdatedt;
    }
}