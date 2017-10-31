package web.front.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.db.vo.Ridibook;
import web.query.vo.QueryBook;
import web.view.util.Pagination;

@Controller
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);	
	
	@RequestMapping(value="/book",method=RequestMethod.GET)
	public String book(QueryBook query, Model model, HttpServletRequest req) {
		logger.info("book");		
		
		return "booklist.tiles";
	}

	/************************************************************
	 * 							Util Method 
	 * **********************************************************/

	
}
