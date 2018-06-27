package controller.access;

import java.io.IOException;
import java.util.Date;
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
public class AccessControllerAdd extends HttpServlet{
	@SuppressWarnings("unchecked")
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
						query4 = "SELECT FROM "+ Resource.class.getName();
						List<Resource> losResources = (List<Resource>)pm.newQuery(query4).execute();
						request.setAttribute("roles", losRoles);
						request.setAttribute("recursos", losResources);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/add.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
		}



	}
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "SELECT FROM "+ Rol.class.getName();
		List<Rol> losRoles = (List<Rol>)pm.newQuery(query).execute();
		query = "SELECT FROM "+ Resource.class.getName();
		List<Resource> losResources = (List<Resource>)pm.newQuery(query).execute();
		String rolUser = request.getParameter("rolUser");
		Long idRolUser = (long) 0;
		for(int i = 0 ; i < losRoles.size(); i++)
			if(rolUser.equals(losRoles.get(i).getName()))
				idRolUser = losRoles.get(i).getId();
		Long idRecurso =  (long) 0;
		String recursoUrl = request.getParameter("recursoUrl");
		for(int i = 0 ; i < losResources.size(); i++)
			if(recursoUrl.equals(losResources.get(i).getUrl()))
				idRecurso = losResources.get(i).getId();
		Date creacion = new Date();
		Access a = new Access(idRolUser,
				idRecurso,
				true,
				creacion);
		try{
			pm.makePersistent(a);
			pm.close();
			response.sendRedirect("/access");
		}
		catch(Exception e){
			response.getWriter().println(e.getMessage());
		}

	}

}
