package batis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Controller
public class webpage3 {
	@Inject
	private SqlSessionFactory factory;
	private MemberDTO dto;
	private String service_id = "ncp:sms:kr:318002283590:raemian";
	private String access_id = "r7CvGlRfIoILTf14q8kj";
	private String security_key = "PT351QPM4f43dJQ1ZBiUkf2efETeYJ5nJLWrxhkV";
	private String service = "SMS";
	private String url = "https://sens.apigw.ntruss.com/sms/v2/services/" + service_id + "/messages";
	private String url2 = "/sms/v2/services/" + service_id + "/messages";
	private String timestamp = Long.toString(System.currentTimeMillis());

	@RequestMapping("/searchUser.do")
	public String searchUser() {
		String userId = "hanpak33";
		SqlSession ss = factory.openSession();
		dto = ss.selectOne("reviewDB.searchUser", userId);
		System.out.println(dto.getMid() + " " + dto.getMemail());
		return "";
	}

	@RequestMapping("/searchUser2.do")
	public String searchUser2() {
		String data = "hanpak33";
		String part = "1";
		SqlSession ss = factory.openSession();
		Map<String, String> map = new HashMap<>();
		// part 1 : 아이디 2 : 이메일 3: 연락처 4: 복합적인 조건, 두 조건을 모두 충족할때 (연락처,지역)
		map.put("data", data);
		map.put("data", "wwms@nate.com");
		map.put("part", part);
		map.put("part", "2");
		map.put("part", "4");
		map.put("data", "5684");
		map.put("area", "3");
		dto = ss.selectOne("reviewDB.searchUser2", map);
		System.out.println(dto.getMid() + " " + dto.getMtel());
		return "";
	}

	@RequestMapping("/searchUser3.do")
	public void searchUser3() {
		SqlSession ss = factory.openSession();
		Map<String, String> map = new HashMap<>();
		String data1 = "wwms123";
		String data2 = "a1234";
		String part = "login"; // login, id중복체크
		map.put("userId", data1);
		map.put("userPw", data2);
		map.put("part", part);
		dto = ss.selectOne("reviewDB.searchUser3", map);
		System.out.println(dto.getMid() + " " + dto.getMemail());
	}

	// SMS 발송
	@PostMapping("/smsok")
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void smsOk(@RequestParam(required = false) String tel, @RequestParam(required = false) String context,HttpServletResponse response)
			throws IOException, Exception {
		JSONObject code1 = new JSONObject();
		JSONObject code2 = new JSONObject();
		JSONArray code3 = new JSONArray();
		code1.put("type", service);
		code1.put("countryCode", "82");
		code1.put("from", "01033419230");
		code1.put("contentType", "COMM");
		code1.put("content", "이벤트 내용 발송"); // 관리자가 확인하는 메세지 내용
		code2.put("content", context); // 클라이언트가 받을 메세지 내용
		code2.put("to", tel);
		code3.add(code2);
		code1.put("messages", code3);
		String data = code1.toString();
		// System.out.println("data = "+data);
		// header 제작 코드 curl - 클라이언트에서 서버와 통신 할 수 있는 서버 실행 명령어 툴
		OkHttpClient client = new OkHttpClient();
		System.out.println(data);
		PrintWriter pw = response.getWriter();
		Request req = new Request.Builder()
				.addHeader("x-ncp-apigw-timestamp", timestamp)
				.addHeader("x-ncp-iam-access-key", access_id)
				.addHeader("x-ncp-apigw-signature-v2", makese())
				.url(url)
				.post(RequestBody.create(MediaType.parse("application/json;"), data))
				.build();
		Response res = client.newCall(req).execute();
		
		String result = res.body().string();
		if(result.indexOf("200")>0) {
			pw.write("ok");
		}else {
			pw.write("error");
		}
		System.out.println(req);
		System.out.println(result);

	}

	// 코드 암호화 Base64 또는 SHA ~~
	public String makese() throws Exception{
		String sp = " ";
		String line = "\n";
		String msg = new StringBuilder()
				.append("POST")
				.append(sp)
				.append(url2)
				.append(line)
				.append(timestamp)
				.append(line)
				.append(access_id).toString();
	
		String base64 = "";
	
		SecretKeySpec key = new SecretKeySpec(security_key.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(key);
		byte[] rawHmac = mac.doFinal(msg.getBytes("UTF-8"));
		base64 = Base64.getEncoder().encodeToString(rawHmac);
	
		return base64;
	}
}
