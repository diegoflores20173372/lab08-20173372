package controller.access;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;

import model.entity.PMF;
import model.entity.Resource;
import model.entity.Rol;
import model.entity.Access;

@SuppressWarnings("serial")
public class AccessControllerEdit extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
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
						String query4 = "SELECT FROM "+ Rol.class.getName();
						List<Rol> losRoles = (List<Rol>)pm.newQuery(query4).execute();
						query = "SELECT FROM "+ Resource.class.getName();
						List<Resource> losResources = (List<Resource>)pm.newQuery(query).execute();
						request.setAttribute("roles", losRoles);
						request.setAttribute("recursos", losResources);
						Access aux = pm.getObjectById(Access.class, Long.parseLong(request.getParameter("id")));
						pm.close();
						request.setAttribute("Acceso", aux);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/edit.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Access a = pm.getObjectById(Access.class,  Long.parseLong(request.getParameter("id")));
		String query = "SELECT FROM "+ Rol.class.getName();
		List<Rol> losRoles = (List<Rol>)pm.newQuery(query).execute();
		query = "SELECT FROM "+ Resource.class.getName();
		List<Resource> losResources = (List<Resource>)pm.newQuery(query).execute();
		Long RolId = (long) 0;
		for(int i = 0 ; i < losRoles.size(); i++)
			if(losRoles.get(i).getName().equals(request.getParameter("rolUser")))
				RolId = losRoles.get(i).getId();
		Long RecursoId = (long) 0;
		for(int i = 0 ; i < losResources.size(); i++)
			if(losResources.get(i).getUrl().equals(request.getParameter("recursoUrl")))
				RecursoId = losResources.get(i).getId();
		a.setIdRole(RolId);
		a.setIdResource(RecursoId);
		a.setStatus(request.getParameter("estado").equals("true"));
		pm.close();
		response.sendRedirect("/access");
	}

}
