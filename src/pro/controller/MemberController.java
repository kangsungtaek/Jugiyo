package pro.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MemberDao;
import pro.service.UploadService;
import pro.vo.CouponVo;
import pro.vo.LogVo;
import pro.vo.MemberVo;
import pro.vo.MultiCouponVo;
import pro.vo.ReviewVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberDao memberDao;
	@Autowired
	UploadService us;

	@RequestMapping("/memInfo")
	public String memInfoHandle(WebRequest req) {
		MemberVo vo = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		Map ip = new HashMap<>();
			ip.put("id", vo.getId());
			ip.put("password", vo.getPassword());
		vo = memberDao.findById(ip);
		// 등급조정 -> 관리자페이지에서 하는게 좋을듯
		List<LogVo> list = memberDao.readAllById(vo.getId());
		Map grade = new HashMap<>();
		grade.put("id", vo.getId());
		if (list.size() < 10) {
			grade.put("grade", 1);
		} else if (list.size() < 20) {
			grade.put("grade", 2);
		} else if (list.size() < 30) {
			grade.put("grade", 3);
		} else {
			grade.put("grade", 4);
		}

		Map m = new HashMap<>();
			m.put("id", vo.getId());
			m.put("password", vo.getPassword());
		vo = memberDao.findById(m);
		
		if (vo.getGrade() != (int) grade.get("grade")) {
			memberDao.updateGrade(grade);
			List<CouponVo> c = memberDao.getCoupon((int) grade.get("grade"));
			Map map = new HashMap<>();
				map.put("userId", vo.getId());
				map.put("coupons", c);
			memberDao.updateCoupon(map);
			
			vo.setCoupons(c);
		} else {
			MultiCouponVo coupons = memberDao.findCoupon(vo.getId());
			System.out.println("[controller:member] coupons : " + coupons.toString());

			vo.setCoupons(coupons.getCoupons());
		}
		req.setAttribute("vo", vo, WebRequest.SCOPE_SESSION);
		return "member/memInfo";
	}

	// 주문내역 불러오기
	@RequestMapping("/history")
	public ModelAndView historyHandle(WebRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/history");

		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);

		List<LogVo> list = memberDao.readAllById(member.getId());
		System.out.println("[controller:member] history : " + list);

		for (LogVo v : list) {
			if (v.getReviewd().equals("Y")) {
				ReviewVo review = memberDao.findReivewByLogId(v.getId());
				v.setReview(review);
			}
		}

		mav.addObject("list", list);
		return mav;
	}

	// 쿠폰확인하기
	@RequestMapping("/coupon")
	public ModelAndView couponHandle(WebRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/coupon");

		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		System.out.println("[controller:member] coupon : " + member.toString());
		mav.addObject("list", member.getCoupons());

		return mav;
	}

	// 다시주문하기
	@RequestMapping("/reorder")
	public ModelAndView reorderHandle(@RequestParam("id") String id, WebRequest req) {
		ModelAndView mav = new ModelAndView();
		LogVo log = memberDao.readByObjectId(id);
		req.setAttribute("orderList", log.getOrderList(), WebRequest.SCOPE_SESSION);
		req.setAttribute("totalPrice", log.getTotalPrice(), WebRequest.SCOPE_SESSION);
		mav.setViewName("redirect:/order/ordered?storeNo=" + log.getStoreNo());
		return mav;
	}

	@GetMapping("/writeReview")
	public ModelAndView writeGetReviewHandle(@RequestParam("_id") String id, @RequestParam("storeNo") int storeNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("_id", id);
		mav.addObject("storeNo", storeNo);
		mav.setViewName("member/writeReview");
		return mav;
	}

	// review등록
	@PostMapping("/writeReview")
	public ModelAndView writeReviewPostHandle(@RequestParam Map<String, Object> map,
			@RequestParam(value = "img", required = false) List<MultipartFile> imgs, WebRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println("[controller:member] review : " + map);
		mav.setViewName("member/memInfo");
		MemberVo vo = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);

		Map<String, Object> data = new LinkedHashMap<>();
		String logId = (String) map.get("_id");

		data.put("logId", logId);
		data.put("no", Integer.parseInt((String) map.get("storeNo")));
		data.put("star", Double.parseDouble((String) map.get("star")));
		data.put("content", map.get("content"));
		data.put("nickname", vo.getNickname());

		String[] img = null;
		try {
			if (!imgs.isEmpty()) {
				img = new String[imgs.size()];
				int i = 0;
				for (MultipartFile f : imgs) {
					img[i] = us.makeUrl(f, (String) map.get("storeNo"));
					System.out.println("[controller:member]img url :" + img[i]);
					++i;
				}
				data.put("img", img);
			} else {
				data.put("img", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		data.put("reply", "");
		System.out.println("[controller:member] writeReview : " + data);
		memberDao.addReview(data);
		memberDao.updateLogReviewd(logId);
		return mav;
	}

	@RequestMapping("/addAddr")
	@ResponseBody
	public String addAddrHandle(@RequestParam("addr") String addr, @RequestParam("xcor") double xcor,
			@RequestParam("ycor") double ycor, WebRequest req) {
		System.out.println("[controller:member]Address : " + addr + "/" + xcor + "." + ycor);
		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		Map<String, Object> map = new HashMap<>();
		map.put("id", member.getId());
		map.put("addr", addr);
		map.put("xcor", xcor);
		map.put("ycor", ycor);
		System.out.println("[controller:member]Address" + map);
		memberDao.addAddr(map);
		return "true";
	}
}
