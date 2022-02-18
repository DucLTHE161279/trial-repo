/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.student;

import dal.DeptDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Department;
import model.Student;

/**
 *
 * @author Dell
 */
public class InsertController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


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
       DeptDBContext db = new DeptDBContext();
       ArrayList<Department> depts=db.getDepts();
       request.setAttribute("depts",depts);
       request.getRequestDispatcher("../view/student/insert.jsp").forward(request, response);
 
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
    String raw_id=request.getParameter("id");
     String raw_name=request.getParameter("name");
      String raw_gender=request.getParameter("gender");
     String raw_dob=request.getParameter("dob");
      String raw_did=request.getParameter("did");
      //validate data
      int id=Integer.parseInt(raw_id);
      int did=Integer.parseInt(raw_did);
      String name=raw_name;
      boolean gender=raw_gender.equals("male");
      Date dob=Date.valueOf(raw_dob);
      
      Department d=new Department ();
      d.setId(did);
      Student s= new Student();
      s.setDept(d);
      s.setId(id);
      s.setName(name);
      s.setGender(gender);
      s.setDob(dob);
      
      StudentDBContext db= new StudentDBContext();
      db.insertStudent(s);
      response.getWriter().println("done");
      
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
