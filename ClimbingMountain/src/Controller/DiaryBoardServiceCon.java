package Controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.Command;
import Model.DiaryDAO;
import Model.DiaryDTO;

public class DiaryBoardServiceCon implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "diaryView.jsp";
	}


