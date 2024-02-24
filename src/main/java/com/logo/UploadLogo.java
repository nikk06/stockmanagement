package com.logo;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.RequestContext;

import com.connection.DatabaseConnection;
import java.sql.*;

/**
 * Servlet implementation class UploadLogo
 */
@WebServlet("/UploadLogo")
public class UploadLogo extends HttpServlet {
	// This is Manual Path for image uploading
	private final String UPLOAD_DIRECTORY = "/home/pennontr/jvm/apache-tomcat-8.5.34/domains/pennontraders.com/uploads/";
	// private final String UPLOAD_DIRECTORY
	// ="F:/Proffesional-Java-Development/StockMarket/WebContent/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload.isMultipartContent(request)) {
			try {
				List<org.apache.tomcat.util.http.fileupload.FileItem> multiparts = new org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload(new org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory()).parseRequest((RequestContext) request);
				String logoName = null;
				String logoDataName = null;
				String clientName = null;
				for (org.apache.tomcat.util.http.fileupload.FileItem item : multiparts) {
					if (!item.isFormField()) {
						logoName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + logoName));
						org.apache.tomcat.util.http.fileupload.FileItem uploadClientName = (org.apache.tomcat.util.http.fileupload.FileItem) multiparts.get(0);
						clientName = uploadClientName.getString();
						org.apache.tomcat.util.http.fileupload.FileItem name = (org.apache.tomcat.util.http.fileupload.FileItem) multiparts.get(2);
						logoDataName = name.getString();
					}
				}
				try {
					int clientId = 0;
					String logoPath = UPLOAD_DIRECTORY + logoName;

					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select client_id from client_details where client_name='" + clientName + "'");
					if (resultset.next()) {
						clientId = resultset.getInt(1);
					}

					int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into client_config values('" + clientId+ "','" + logoName + "','" + logoDataName + "','" + logoPath + "')");
					if (i > 0) {
						String success = "Logo Uploaded Successfully.";
						session.setAttribute("message", success);
						response.sendRedirect("logo-mapping.jsp");
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
