package kr.co.invegan.board.controller;

import java.lang.System.Logger;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dto.FeedDTO;
import kr.co.invegan.board.dto.PhotoDTO;
import kr.co.invegan.board.service.FeedService;

@Controller
public class FeedController {
	@Autowired FeedService service;
	org.slf4j.Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/feed/write.go") // feedWrite 페이지에 대한 URL 매핑을 추가
	public String feedWrite(Model model) {
		logger.info("feedWrite 접근");
		// 필요한 모델 데이터를 추가
		return "feedWrite"; // feedWrite.jsp로 이동
	}
	
	@RequestMapping(value="/feed/write.do" ,method= RequestMethod.POST)
	public String feedPost(Model model, @RequestParam String content, @RequestParam String feedTag
			){
		logger.info("feedPost 접근 ");
		logger.info("content:"+content);
		logger.info("feedTag:"+feedTag);
		;
//		logger.info("이미지 개수 :"+images.length);
		FeedDTO dto = new FeedDTO();
		dto.setContent(content);
		dto.setFeedTag(feedTag);
		service.writeFeed(dto);
		service.writeTag(dto);
		boolean aa = content.isEmpty();
		logger.info("공백확인"+aa);
		boolean bb = feedTag.isEmpty();
		logger.info("공백확인"+bb);
		if (content.isEmpty()){
			logger.info("content");
			model.addAttribute("msg", "내용을 입력해주세요.");
			logger.info("content1");
		}
		if(feedTag.isEmpty()) {
			logger.info("feedTag");
			model.addAttribute("msg", "태그를 입력해주세요.");
		}
	
		return "feedList";
		
	}
	
	
//	private void saveFile(MultipartFile[] photos) {
//		for (MultipartFile photo : photos) {			
//			String oriFileName = photo.getOriginalFilename();
//			logger.info("oriFileName : "+oriFileName);		
//			if(!oriFileName.equals("")) {
//				//1. 파일이름 변경
//				String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); 
//				String newFileName = System.currentTimeMillis()+ext;
//				//2. 파일 저장
//				byte[] arr = photo.getBytes();
//				Path path = Paths.get(root+newFileName);
//				Files.write(path, arr);
//				//3. 파일명, 변경된파일명, idx 를 photo 테이블에 추가 
//				dao.writePhoto(idx,oriFileName,newFileName);
//			}
//		}
//		
//	}

	@RequestMapping(value="/feedList.go")
	public String feedList() {
		
		return "feedList";
	}
	
}