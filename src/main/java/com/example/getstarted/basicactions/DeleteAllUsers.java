package com.example.getstarted.basicactions;

import com.example.getstarted.daos.BookDao;
import com.example.getstarted.objects.Book;
import com.example.getstarted.objects.Result;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// [START example]
@SuppressWarnings("serial")
public class DeleteAllUsers  extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException,
        ServletException {
    BookDao dao = (BookDao) this.getServletContext().getAttribute("dao");
    String startCursor = req.getParameter("cursor");
    List<Book> books = null;
    try {
      Result<Book> result =
          dao.listBooksByUser((String) req.getSession().getAttribute("userId"), startCursor);
      books = result.result;
    } catch (Exception e) {
      throw new ServletException("Error listing books", e);
    }
    try {
	    for (Book book : books) {
	      //bookNames.append(book.getTitle() + " ");
	        dao.deleteBook(book.getId());
	    }
	        resp.sendRedirect("/lists/mine");
      } catch (Exception e) {
        throw new ServletException("Error deleting book", e);
      }
  }
}
// [END example]