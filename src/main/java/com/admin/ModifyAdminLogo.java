package com.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.RequestContext;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class ModifyAdminLogo
 */
@WebServlet("/ModifyAdminLogo")
public class ModifyAdminLogo extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "/home/pennontr/jvm/apache-tomcat-8.5.34/domains/pennontraders.com/uploads/";
	//private final String UPLOAD_DIRECTORY ="F:/Proffesional-Java-Development/StockMarket/WebContent/uploads/";
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload.isMultipartContent(request)) {
			try {
				List<org.apache.tomcat.util.http.fileupload.FileItem> multiparts = new org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload(new org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory()).parseRequest((RequestContext) request);
				String logoName = null;
				String adminId = null;
				for (org.apache.tomcat.util.http.fileupload.FileItem item : multiparts) {
					if (!item.isFormField()) {
						logoName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + logoName));
						org.apache.tomcat.util.http.fileupload.FileItem id = (org.apache.tomcat.util.http.fileupload.FileItem) multiparts.get(0);
						adminId = id.getString();

					}
				}
				try {
					int clientId = 0;
					String logoPath = UPLOAD_DIRECTORY + logoName;
				
					int i = DatabaseConnection.insertUpdateFromSqlQuery("update admin_config set logo_name='" + logoName + "',logo_path='"+ logoPath + "' where admin_id='" + adminId + "'");
					if (i > 0) {
						String success = "Logo edit successfully.";
						session.setAttribute("message", success);
						response.sendRedirect("admin-manage-logo.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}

			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}
}
