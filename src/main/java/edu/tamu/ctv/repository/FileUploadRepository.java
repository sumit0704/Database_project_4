package edu.tamu.ctv.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.tamu.ctv.entity.FileUpload;

@Repository
public interface FileUploadRepository extends CrudRepository<FileUpload, Integer> {
    @Query(value="from FileUpload as fp where fp.project_id = :id")
    public FileUpload findMaxIdForSave(@Param(value="id") Integer var1);
}
