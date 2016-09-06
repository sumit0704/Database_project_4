
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletDogNames")
public class ServletDogNames extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletDogNames() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			PrintWriter out = response.getWriter();
			out.println("DogName_Servlet.java: Hello Java!");
			
			if (request.getParameter("dog_name") == ""){
				getServletContext().getRequestDispatcher("/dogs.jsp").forward(request, response);
				return;
				// If no dog_name is provided, then go back to /index.jsp.
			}
				
			String received_dog_name = request.getParameter("dog_name");	
			
			
				// read from $_POST["dog_name"], and give to $dog_name.
			
				
			request.setAttribute("send_dog_name", received_dog_name);
				
				
			getServletContext().getRequestDispatcher("/display").forward(request, response);
				// This line is go to "/display" with all the parameters.
				// This parameter, "/display", should match exactly in the DisplayController,
				// Here it is "/display" and not "/display.jsp"
				
			// out.println("received_dog_name: " + received_dog_name);
			
			
	}

}
