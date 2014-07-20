package woo.framework.core.dao;

import java.util.Stack;

public class ThreadLocalMaps {
	
	private static ThreadLocal<Stack<Object>> threadLocal = new ThreadLocal<Stack<Object>>();
	public static void set(Object value){
		Stack<Object> stack = threadLocal.get();
		stack.push(value);
	}
	
	public static Object get(){
		Stack<Object> stack = threadLocal.get();
		if(stack.size() == 0){
			return null;
		}
		return stack.peek();
	}
	public static Object remove(){
		Stack<Object> stack = threadLocal.get();
		if(stack.size() == 0){
			return null;
		}
		return stack.pop();
	}
	
	public static void removeAll(){
		threadLocal.set(null);
	}
	
	public static boolean isInit(){
		return threadLocal.get() == null ? false : true;
	}
	
	public static void init(){
		threadLocal.set(new Stack<Object>());
	}
}

