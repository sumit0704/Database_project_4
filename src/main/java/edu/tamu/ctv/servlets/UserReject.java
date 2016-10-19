package edu.tamu.ctv.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.tamu.ctv.utils.session.ProjectAuthentication;

//import edu.tamu.ctv.DAO.ApproveRejectDAO;

@WebServlet("/userReject")
public class UserReject extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private ProjectAuthentication projectAuthentication;
	
		//@SuppressWarnings("null")
		public void updateAccept(int k)
		throws IOException, ServletException{
			//String submitVal=request.getParameter("userApprove");
			//int submitValue = Integer.parseInt(submitVal);
			int submitValue=k;
			System.out.print("Value in ApproveReject: "+submitValue);
			
			
			java.sql.Connection con1;
			
			java.sql.PreparedStatement pst1;
			con1=null;
			
			pst1=null;
			
			String url1= 
			"jdbc:postgresql://localhost:5432/webtoxpi";
			String id1= "postgres";
			String pass1 = "postgres";
			try{
				

				Class.forName("org.postgresql.Driver").newInstance();
			con1 = java.sql.DriverManager.getConnection(url1, id1, pass1);

			} catch(ClassNotFoundException cnfex){
			cnfex.printStackTrace();

			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql1 = "Update users set approved='N' Where user_id=?";
			try{
			pst1 = con1.prepareStatement(sql1);
			pst1.setInt(1,submitValue);
			pst1.executeUpdate();
			}
			catch(Exception e){e.printStackTrace();}
			
	        
	        
			
		}
}