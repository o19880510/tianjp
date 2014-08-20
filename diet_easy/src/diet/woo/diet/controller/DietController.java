package woo.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lutongnet.system.annotation.MarkRequest;
import com.lutongnet.system.util.HttpUtils;

import woo.diet.constants.PageConstants;
import woo.diet.model.request.DietReq;
import woo.diet.model.request.NewDietReq;
import woo.diet.service.DietMasterService;

@Controller
@RequestMapping(value = "/diet/log")
public class DietController {
	
	private static Logger	log	= LoggerFactory.getLogger(DietController.class);
	
	@Resource(name = "dietMasterService")
	private DietMasterService dietMasterService;
	
	@RequestMapping ( value = "/list" )
	@MarkRequest
	public String list(HttpServletRequest request,  @ModelAttribute ( "dietReq" ) DietReq dietReq){
		if(dietReq == null){
			dietReq = new DietReq();
		}
		dietMasterService.getList(request, dietReq);
		
		return PageConstants.Diet.LIST;
	}
	
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request){
		
		request.setAttribute("newDietReq", new NewDietReq());
		
		return PageConstants.Diet.ADD;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(HttpServletRequest request, @ModelAttribute("newDietReq") NewDietReq newDietReq) {

		log.debug("newDietReq:" + newDietReq);
		
		dietMasterService.save(request, newDietReq);
		
		return "redirect:" + HttpUtils.getMarkRequestInfo(request);
	}
	
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(HttpServletRequest request, @RequestParam("id") Integer id){
		
		dietMasterService.remove(id);
		
		return "redirect:" + HttpUtils.getMarkRequestInfo(request);
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyBefore(HttpServletRequest request, @RequestParam("id") Integer id){
		
		dietMasterService.modifyBefore(request, id);
		
		return PageConstants.Diet.MODIFY;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyBefore(HttpServletRequest request, @ModelAttribute("newDietReq") NewDietReq newDietReq){
		
		dietMasterService.modify(request, newDietReq);
		
		return "redirect:" + HttpUtils.getMarkRequestInfo(request);
	}
	
}
