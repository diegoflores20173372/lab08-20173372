package controller.ballots;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;

import model.entity.*;
@SuppressWarnings("serial")
public class BallotsControllerEdit extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.google.appengine.api.users.User cuentaGoogle = UserServiceFactory.getUserService().getCurrentUser();
		if(cuentaGoogle == null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny1.jsp");
			dispatcher.forward(request, response);
		}
		else{
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + model.entity.User.class.getName() + " where email=='" + cuentaGoogle.getEmail() + "'" + "&& status==true";
			List<model.entity.User> uSearch = (List<model.entity.User>) pm.newQuery(query).execute();
			if(uSearch.isEmpty()){
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny2.jsp");
				dispatcher.forward(request, response);
			}
			else{
				System.out.println(request.getServletPath());
				String query2 = "select from " + Resource.class.getName() + " where url=='" + request.getServletPath() + "'" + " && status==true";
				List<Resource> rSearch = (List<Resource>) pm.newQuery(query2).execute();
				if(rSearch.isEmpty()){
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny3.jsp");
					dispatcher.forward(request, response);
				}
				else{
					String query3 = "select from " + model.entity.Access.class.getName() + " where idRole==" + uSearch.get(0).getIdRole() +
							"&& idResource==" + rSearch.get(0).getId() + "&& status==true";
					List<model.entity.Access> aSearch = (List<model.entity.Access>) pm.newQuery(query3).execute();
					if(aSearch.isEmpty()){
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny4.jsp");
						dispatcher.forward(request, response);
					}
					else{
						Ballot a = pm.getObjectById(Ballot.class,  Long.parseLong(request.getParameter("id")));
						pm.close();
						request.setAttribute("ballot", a);
						RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Ballots/edit.jsp");
						rd.forward(request, response);
					}
				}
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Ballot a = pm.getObjectById(Ballot.class,  Long.parseLong(request.getParameter("id")));
		a.setCliente(request.getParameter("Usuario"));
		a.getDni();
		a.setDireccion(request.getParameter("direccion"));
		a.setDistrito(request.getParameter("distrito"));
		a.setTelefono(request.getParameter("telefono"));
		a.setCantidad(request.getParameter("cantidad"));
		a.setPrecioFinal(Double.toString(Integer.parseInt(request.getParameter("cantidad"))*100.0));
		pm.close();
		response.sendRedirect("/ballots");
	}
}