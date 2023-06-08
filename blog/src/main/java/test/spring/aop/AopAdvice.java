package test.spring.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class AopAdvice {

	@Around("execution( * test.spring.controller..session*(..))")
	public Object printMVC(ProceedingJoinPoint jp) throws Throwable{
		// 세션 확인
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sa = (ServletRequestAttributes)ra;
		HttpServletRequest request = sa.getRequest();
		HttpSession session = request.getSession();
		
		Object obj ="/member/main";
		System.out.println("ㄴㄴㄴㄴ");
		if(session.getAttribute("memId") != null) {
			obj = jp.proceed();
			System.out.println("ㅇㅇㅇㅇ");
		}
		return obj;
	}
}
