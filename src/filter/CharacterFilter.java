package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//Filter는 클라이언트에서 요청한 페이지를 수행하기 전후로 처리한다.
@WebFilter("/*")
public class CharacterFilter implements Filter {

	// 필터가 웹 콘테이너에서 삭제될때 호출한다.
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	// 체인을 따라 다음에 존재하는 필터로 이동한다.
	// 체인의 가장 마지막에는 클라이언트가 요청한 최종 자원이 위치한다.
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// System.out.println("before");
		req.setCharacterEncoding("UTF-8");
		chain.doFilter(req, resp);

		// System.out.println("after");
	}

	// 필터가 웹 콘테이너에 생성한 후 초기화할 때 호출한다.
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}// end class
