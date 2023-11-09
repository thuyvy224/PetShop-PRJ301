package controller;

import dal.CategoriesDAO;
import dal.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Categories;
import models.Product;

/**
 *
 * @author ThuyVy
 */
public class AllProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AllProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AllProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryId = request.getParameter("categoryId") == null ? "" : request.getParameter("categoryId");
        String search = request.getParameter("search") == null ? "" : request.getParameter("search");
        String sort = request.getParameter("sort") == null ? "" : request.getParameter("sort");
        search = search.trim();
        ProductDAO pdao = new ProductDAO();
        List<Categories> clist = pdao.getCategory();
            int totalproduct = pdao.getNumberProduct(categoryId,search);
            int numberPage = (int) Math.ceil((double) totalproduct / 6);
            int index;
            String currentPage = request.getParameter("index");
            if (currentPage == null) {
                index = 1;
            } else {
                index = Integer.parseInt(currentPage);
            }
            ArrayList<Product> plist = pdao.getProduct(categoryId, search, index,sort);
            request.setAttribute("numberPage", numberPage);
            request.setAttribute("plist", plist);
            request.setAttribute("clist", clist);
            request.getRequestDispatcher("allproduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        CategoriesDAO catedao = new CategoriesDAO();
//        List<Categories> listCategories = new CategoriesDAO().getAllCategories();
//        request.setAttribute("listCategories", listCategories);
//
//        RequestDispatcher rd = request.getRequestDispatcher("allproduct.jsp");
//        rd.forward(request, response);
//
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
