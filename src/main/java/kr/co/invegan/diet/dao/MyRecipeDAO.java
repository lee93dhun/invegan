package kr.co.invegan.diet.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface MyRecipeDAO {
	ArrayList<HashMap<String, Object>> mlist(String fname);

	ArrayList<HashMap<String, Object>> mMaterial(String mName);

	int rListUpdate(HashMap<String, Object> params);

}