package edu.tamu.ctv.entity.enums;

public enum Roles
{
	ADMIN(0, "Admin"),
	USER(1,"User"),
	PROJECTMANAGER(2, "Project Manager"),
	TEAMMEMBER(3, "Team Member"),
	PROJECTREVIEWER(4, "Project Reviewer"),
	UNREGISTERER(100, "Unregistered");

	private int id;
	private String value;

	Roles(int id, String value)
	{
		this.id = id;
		this.value = value;
	}

	public int getId()
	{
		return id;
	}
	
	public String getValue()
	{
		return value;
	}
	
	public String getCode()
	{
		return value.toUpperCase();
	}
	
	public static Roles parse(String val)
	{
		Roles role = null;
		for (Roles item : Roles.values())
		{
			if (item.getValue() == val)
			{
				role = item;
				break;
			}
		}
		return role;
	}
	
	public static Roles parse(int id)
	{
		Roles role = null;
		for (Roles item : Roles.values())
		{
			if (item.getId() == id)
			{
				role = item;
				break;
			}
		}
		return role;
	}
}
