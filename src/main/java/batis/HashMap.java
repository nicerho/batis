package batis;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

public class HashMap {
	public static void main(String[] args) {
		// Map<String,String> m = new HashMap<>();
		Map<String, String> map = new java.util.HashMap<String, String>();
		map.put("name", "testname");
		map.put("id", "testname");
		// System.out.println(map.size());
		// System.out.println(map.get("name"));
		// System.out.println(map.keySet());
		map.remove("name");
		// System.out.println(map.keySet());
		// System.out.println(map.size());
		// System.out.println(map.containsKey("name"));
		Map<String, Integer> m = new java.util.HashMap<String, Integer>();
		m.put("point", 5000);
		m.put("level", 3);
		// System.out.println(m.get("point").getClass());
		Map<String, Object> m2 = new java.util.HashMap<String, Object>();
		m2.put("userTel", "01012341234");
		m2.put("userPost", 05123);
		m2.put("agree", true);
		// System.out.println(m2.get("userPost"));
		Map<Integer, String> m3 = new TreeMap<>();
		m3.put(1, "String 1");
		m3.put(2, "String 2");
		m3.put(3, "String 3");
		m3.put(4, "String 4");
		m3.put(5, "String 5");
		List<String> list = m3.values().stream().collect(Collectors.toList());
	}
}
