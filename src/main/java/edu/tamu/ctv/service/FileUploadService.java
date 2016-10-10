package edu.tamu.ctv.service;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

@Service("fileservice")
public class FileUploadService
{
	private Logger logger = LoggerFactory.getLogger(FileUploadService.class);
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource)
	{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public boolean getFileNamesByProjectId(Long id)
	{
		try
		{
			//logger.debug("isEmployeeExists()");

			StringBuilder queryString = new StringBuilder();
			queryString.append("SELECT filename FROM fileupload WHERE r.project_id = ?");
			Object[] parameterList = { id };
			SqlRowSet dataRow = jdbcTemplate.queryForRowSet(queryString.toString(), parameterList);

			if (dataRow.next())
			{
				Object obj = dataRow;
			}

		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		return false;
	}

}
