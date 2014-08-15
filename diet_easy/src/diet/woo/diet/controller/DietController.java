package woo.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import woo.diet.constants.PageConstants;
import woo.diet.model.request.DietReq;
import woo.diet.service.DietMasterService;

@Controller
@RequestMapping(value = "/diet/log")
public class DietController {
	
	private static Logger	log	= LoggerFactory.getLogger(DietController.class);
	
	@Resource(name = "dietMasterService")
	private DietMasterService dietMasterService;
	
	@RequestMapping ( value = "/list" )
	public String list(HttpServletRequest request,  @ModelAttribute ( "dietReq" ) DietReq dietReq){
		if(dietReq == null){
			dietReq = new DietReq();
		}
		dietMasterService.getList(request, dietReq);
		
		return PageConstants.Diet.LIST;
	}
	
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(){
		return PageConstants.Diet.ADD;
	}
}
