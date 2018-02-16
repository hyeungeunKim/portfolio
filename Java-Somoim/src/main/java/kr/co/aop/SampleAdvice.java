package kr.co.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {

	private static final Logger logger = LoggerFactory.getLogger(SampleAdvice.class);
	
	@Before("execution(* kr.co.service.MsgService*.*(..))")
	// 괄호안에 부가기능인 얘네들을 어디에 적용할 지 명시해야 함
	public void startLog(JoinPoint jp){
		logger.info("-------------------------------");
		
		logger.info(Arrays.toString(jp.getArgs()));
		// pointcuts 쪽에 들어가는 파라미터 데이터를 가지고 오는 역할을 함
		logger.info(jp.getKind());
		// advice의 타입을 가져올 때 사용
		logger.info(jp.getTarget().toString());
		// target을 
		
		logger.info("-------------------------------");
	}
	
	@Around("execution(* kr.co.service.MsgService*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
	//ProceedingJoinPoint : Exception보다 상위의 Throwable
		
		long startT = System.currentTimeMillis();
		logger.info("start: "+startT);		
		
		Object result = pjp.proceed(); //기준이 되는 코드
		
		long endT = System.currentTimeMillis();
		logger.info("실행시간: "+(endT-startT));
		
		return result;
	}
}
