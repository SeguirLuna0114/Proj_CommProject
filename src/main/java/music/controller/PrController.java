package music.controller;

import java.io.File;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import music.model.prVO;
import music.service.prService;

@Controller
public class PrController {

	@Autowired
	private prService service;
	
	
//	@RequestMapping("home.do")
//	public String prList() {
//		return "home";
//	}
	
	@RequestMapping("prList.do")
	public String prInsertForm() {
		return "prList";
	}
	
	@RequestMapping("prInsertForm.do")
	public String insertPrForm() {
		
		System.out.println("여기는 들어왔니?");
		
		return "prInsertForm";
	}
	
	// 자기 홍보 insert
	@RequestMapping(value = "pr_insert_ok.do" ,method = RequestMethod.POST)
	public String prInsert(@ModelAttribute prVO pr , @RequestParam("pr_file1") MultipartFile mf, 
									HttpServletRequest request  ,Model model )throws Exception {
		System.out.println("들어왔어?");
		
		System.out.println(pr);
		
		String fileName = mf.getOriginalFilename(); // 첨부파일명
		
		int size = (int)mf.getSize();	// 첨부파일의 크기 (단위 : byte)
		
		String path = request.getRealPath("upload"); // 실제 업로드 되는 파일의 위치
		System.out.println("mf" + mf);
		System.out.println("fileName" + fileName);
		System.out.println("size" + size);
		System.out.println("path" + path);
		
		int result = 0;
		
		String file[] = new String[2];
		
		String newFileName = "";
		
		if(fileName != "") { // 첨부파일 전송될 경우
			
			String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length()); // 확장자명
			System.out.println(extension);
			
			UUID uuid = UUID.randomUUID();
			
			newFileName = uuid.toString() + extension;
			
			System.out.println("newFileName" + newFileName);
			
			if(size > 100000) { // 100KB
				result = 1;
				model.addAttribute("result", result);
				
				return "uploadResult";
			}
			
		}
		
		if ( size > 0) {
			System.out.println("ddd");
			mf.transferTo(new File(path+ "/" + newFileName));
			
		}
		
		pr.setPr_file(newFileName); // 새롭게 업로드한 파일명을 다시 setter파일에 넣어줘야한다.
		
		System.out.println("두번째" + pr);
		
		service.inserPr(pr); // insertPr
		
		System.out.println("결과");
		
		return "redirect:/prList.do";
	}
}
