package com.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * Servlet implementation class AdminLogoMapping
 */
@WebServlet("/AdminLogoMapping")
public class AdminLogoMapping extends HttpServlet {

	private final String UPLOAD_DIRECTORY = "/home/pennontr/jvm/apache-tomcat-8.5.34/domains/pennontraders.com/uploads/";

	// This is Manual Path for image uploading
	// private final String UPLOAD_DIRECTORY
	// ="F:/Proffesional-Java-Development/StockMarket/WebContent/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload.isMultipartContent(request)) {

			try {
				List<org.apache.tomcat.util.http.fileupload.FileItem> multiparts = new org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload(new org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory()).parseRequest((RequestContext) request);
				int adminId = 0;
				String logoName = null;
				String adminName = null;
				for (org.apache.tomcat.util.http.fileupload.FileItem item : multiparts) {
					if (!item.isFormField()) {
						logoName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + logoName));
					}
				}

				int clientId = 0;
				String logoPath = UPLOAD_DIRECTORY + logoName;

				ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select admin_id from admin where uname='" + session.getAttribute("uname") + "'");
				if (resultset.next()) {
					adminId = resultset.getInt(1);
				}

				int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into admin_config values('" + adminId+ "','" + session.getAttribute("uname") + "','" + logoName + "','" + logoPath + "')");
				if (i > 0) {
					String success = "Logo Uploaded Successfully.";
					session.setAttribute("message", success);
					response.sendRedirect("admin-logo-mapping.jsp");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
