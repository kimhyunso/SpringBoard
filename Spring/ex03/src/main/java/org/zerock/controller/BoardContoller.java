package org.zerock.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/board/*")
@Controller
@AllArgsConstructor
public class BoardContoller {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list",service.getList(cri));
		//model.addAttribute("pageMaker",new PageDTO(cri, 123));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board",service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr,  @ModelAttribute("cri") Criteria cri) {
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		/*rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());*/
		
		
		return "redirect:/board/list" + cri.getListLink();
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		/*rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());*/
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String registerPost(BoardVO board, RedirectAttributes rttr) {
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(board);
		rttr.addFlashAttribute("result",board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/excel")
    public void downloadExcel(Criteria cri, HttpServletResponse response) throws IOException{
        Workbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet("게시판글들");
        int rowNo = 0;
 
        Row headerRow = sheet.createRow(rowNo++);
        headerRow.createCell(0).setCellValue("글 번호");
        headerRow.createCell(1).setCellValue("작성자");
        headerRow.createCell(2).setCellValue("제목");
        headerRow.createCell(3).setCellValue("내용");
 
        List<BoardVO> list = service.getList(cri);
        for (BoardVO board : list) {
            Row row = sheet.createRow(rowNo++);
            row.createCell(0).setCellValue(board.getBno());
            row.createCell(1).setCellValue(board.getWriter());
            row.createCell(2).setCellValue(board.getTitle());
            row.createCell(3).setCellValue(board.getContent());
        }
 
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=boardlist.xls");
 
        workbook.write(response.getOutputStream());
        workbook.close();
    }
	
	
	@GetMapping(value = "/getAttachList")
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList : "+bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	
	
}
