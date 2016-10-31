package edu.tamu.ctv.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.tamu.ctv.entity.ProjectUserMapping;

@Repository
public interface ProjectUserMappingRepository extends CrudRepository<ProjectUserMapping, Integer> {
    @Query(value="from ProjectUserMapping as fp where fp.id = :id")
   ProjectUserMapping findmapbyId(Integer Id);
    @Query(value="from ProjectUserMapping as fp where fp.project_id = :projectId and fp.user_id=:userId")
   ProjectUserMapping findmapbyProjectandUserID(Integer projectId, Integer userId);
    @Query(value="select max(id) from ProjectUserMapping")
   Integer findMaxId(Integer Id);
   
}
