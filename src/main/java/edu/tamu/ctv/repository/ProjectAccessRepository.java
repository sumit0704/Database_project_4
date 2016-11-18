package edu.tamu.ctv.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.tamu.ctv.entity.ProjectAccess;

@Repository
public interface ProjectAccessRepository extends CrudRepository<ProjectAccess, Long>
{
	  @Query(value="from ProjectAccess as fp where fp.project_id = :projectId and fp.user_id=:userId")
	   ProjectAccess findAccess(@Param(value="projectId") Integer projectId, @Param(value="userId") Integer userId);
	  @Query(value="from ProjectAccess as fp where fp.project_id = :projectId")
	   ProjectAccess findAccessP(@Param(value="projectId") Integer projectId);
	  @Query(value="from ProjectAccess as fp where fp.project_id = :projectId and fp.user_id=:userId and fp.read='Y'")
	   ProjectAccess findRead(@Param(value="projectId") Integer projectId, @Param(value="userId") Integer userId);
	  @Query(value="from ProjectAccess as fp where fp.project_id = :projectId and fp.user_id=:userId and fp.write='Y'")
	   ProjectAccess findWrite(@Param(value="projectId") Integer projectId, @Param(value="userId") Integer userId);
}
