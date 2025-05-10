package vn.giaiphapthangmay.phantech.config;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.transaction.annotation.Transactional;
import vn.giaiphapthangmay.phantech.domain.User;
import vn.giaiphapthangmay.phantech.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {
    private static final Logger log = LoggerFactory.getLogger(CustomSuccessHandler.class);
    @Autowired
    private UserService userService;

    protected String determineTargetUrl(final Authentication authentication) {

        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin/user");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }

    protected void handle(
            HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication) throws IOException {

        String targetUrl = determineTargetUrl(authentication);

        redirectStrategy.sendRedirect(request, response, targetUrl);
    }

    @Transactional(readOnly = true)
    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
            long sum = user.getClientRequestList() == null ? 0
                    : user.getClientRequestList().getClientRequestItems().size();

            session.setAttribute("sum", sum);
        } else {
            session.removeAttribute("user");
        }
    }

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    @Transactional(readOnly = true)
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException {

        // Ghi log tường minh
        Object principal = authentication.getPrincipal();
        if (principal instanceof UserDetails userDetails) {
            log.info("\n=== DANG NHAP THANH CONG ===\n" +
                    "Tai Khoan    : {}\n" +
                    "Quyen Han    : {}\n" +
                    "IP            : {}\n" +
                    "Session ID    : {}\n",
                    userDetails.getUsername(),
                    userDetails.getAuthorities(),
                    request.getRemoteAddr(),
                    request.getSession().getId());
        } else {
            log.info("Dang Nhap Thanh Cong Voi principal: {}", principal);
        }

        // Xử lý redirect và xóa attribute cũ như mặc định
        handle(request, response, authentication);
        clearAuthenticationAttributes(request, authentication);
    }

}
