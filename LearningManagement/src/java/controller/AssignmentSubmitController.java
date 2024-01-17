/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ClassDAO;
import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Assignment;
import model.Chapter;

/**
 *
 * @author dell
 */
@WebServlet(name = "AssignmentSubmitController", urlPatterns = {"/assignment-submit"})
public class AssignmentSubmitController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AssignmentEvaluationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssignmentEvaluationController at " + request.getContextPath() + "</h1>");
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
        ClassDAO db = new ClassDAO();
        HttpSession session = request.getSession();
        ClassDAO classDAO = new ClassDAO();
        Account acc = (Account) session.getAttribute("accountCur");
        int classId = Integer.parseInt(request.getParameter("classId"));
        List<Assignment> listAsm = classDAO.getAllAsmByClass(classId);
        model.Class c = classDAO.getClassById(classId);
        StudentDAO sd = new StudentDAO();

        // Data cho Sidebar
        int sid = Integer.parseInt(request.getParameter("subject"));
        List<model.Class> listClasses = sd.getClassList(acc.getId(), sid, acc.getRole().getId());

        request.setAttribute("classList", listClasses);

        String cid_raw = request.getParameter("classid");

        int cid = 0;
        if (cid_raw != null) {
            cid = Integer.parseInt(cid_raw);
        } else {
            cid = listClasses.get(0).getClass_id();
        }
        request.setAttribute("classId", cid);

        List<Chapter> listChapters = sd.getChaptersList(sid);
        request.setAttribute("materials", listChapters);
        // Het
        int page_num;

        try {
            page_num = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException | NullPointerException e) {
            page_num = 1;
        }
        int asmId = Integer.parseInt(request.getParameter("id"));
        Assignment asm = db.getAsmById(asmId);

        int num_of_users = db.countSubmit(asmId);
        request.setAttribute("asm", asm);
        request.setAttribute("count", num_of_users);
        request.setAttribute("pages", Math.round(num_of_users / 8) + (num_of_users % 8 == 0 ? 0 : 1));
        request.setAttribute("data", db.getSubmitInPage(page_num, asmId));
        request.setAttribute("asmId", asmId);
        request.getRequestDispatcher("assignment-submit-list.jsp").forward(request, response);
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
        ClassDAO classDAO = new ClassDAO();
        int classId = Integer.parseInt(request.getParameter("classId"));
        int subject = Integer.parseInt(request.getParameter("subject"));
        float score = Float.parseFloat(request.getParameter("score")); // Điểm mới
        int asmId = Integer.parseInt(request.getParameter("asmId")); // ID của bài tập
        int accId = Integer.parseInt(request.getParameter("accId"));
        classDAO.updateScore(score, asmId, accId);
        response.sendRedirect("assignment-submit?id=" + asmId + "&subject=" + subject + "&classId=" + classId);
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
