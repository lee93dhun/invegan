package kr.co.invegan.diet.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.diet.dao.MyRecipeDAO;

@Service
public class MyRecipeService {
	
	@Autowired MyRecipeDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<HashMap<String, Object>> mlist(String fname) {
		
		logger.info("fname :"+fname);
		return dao.mlist(fname);
	}

	public ArrayList<HashMap<String, Object>> mMaterial(String mName, int gram) {
		logger.info("mName : " + mName);
		logger.info("gram : "+gram);
		
		return dao.mMaterial(mName);
	}

	public void rListUpdate(HashMap<String, Object> params) {
		
		logger.info("params : "+params);
		int row = dao.rListUpdate(params);
	}



}