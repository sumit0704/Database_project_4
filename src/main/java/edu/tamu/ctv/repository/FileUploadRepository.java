package edu.tamu.ctv.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.tamu.ctv.entity.FileUpload;

@Repository
public interface FileUploadRepository extends CrudRepository<FileUpload, Integer> {
    @Query(value="select max(id) as id from FileUpload")
    public Integer findMaxIdForSave();
    
    @Query(value="select filename from FileUpload where project_id=:id")
    public List<String> findFilesById(@Param(value="id") Long var1);
}
