package edu.tamu.ctv.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.tamu.ctv.entity.FileUpload;

@Repository
public interface FileUploadRepository extends CrudRepository<FileUpload, Integer>
{
	// System.out.println("\n\nLogin @ home: ");
	// System.out.println("test");
	 
	@Query("from FileUpload as fp where fp.project_id = :id")
	FileUpload findMaxIdForSave(@Param("id")Integer id);


}
