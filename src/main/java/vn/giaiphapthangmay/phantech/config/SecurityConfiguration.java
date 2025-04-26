package vn.giaiphapthangmay.phantech.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;
import org.springframework.security.authentication.ProviderManager;
import jakarta.servlet.DispatcherType;
import vn.giaiphapthangmay.phantech.service.CustomUserDetailsService;
import vn.giaiphapthangmay.phantech.service.UserService;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder(); // Tạo bean BCryptPasswordEncoder để mã hóa mật khẩu
        }

        @Bean
        public UserDetailsService userDetailsService(UserService userService) {
                return new CustomUserDetailsService(userService);
        }

        @Bean
        public AuthenticationManager authenticationManager(
                        UserDetailsService userDetailsService,
                        PasswordEncoder passwordEncoder) throws Exception {

                return new ProviderManager(authProvider(passwordEncoder, userDetailsService));
        }

        @Bean
        public DaoAuthenticationProvider authProvider(
                        PasswordEncoder passwordEncoder,
                        UserDetailsService userDetailsService) {

                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(userDetailsService);
                authProvider.setPasswordEncoder(passwordEncoder);
                authProvider.setHideUserNotFoundExceptions(false);

                return authProvider;
        }

        @Bean
        public AuthenticationSuccessHandler customSuccessHandler() {
                return new CustomSuccessHandler(); // Tạo bean CustomSuccessHandler để xử lý khi đăng nhập thành công
        }

        @Bean
        public SpringSessionRememberMeServices rememberMeServices() {
                SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
                // optionally customize
                rememberMeServices.setAlwaysRemember(true);
                return rememberMeServices;
        }

        @Bean
        SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
                http
                                .authorizeHttpRequests(authorize -> authorize
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                                                DispatcherType.INCLUDE)
                                                .permitAll()
                                                .requestMatchers("/admin/**")
                                                .hasRole("ADMIN")
                                                .requestMatchers(
                                                                "/", "/login", "/client/**", "/css/**", "/js/**",
                                                                "/images/**", "/product/**", "/register")
                                                .permitAll()
                                                .anyRequest().authenticated())
                                .sessionManagement((sessionManagement) -> sessionManagement
                                                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                                                .invalidSessionUrl("/logout?expired")
                                                .maximumSessions(1)
                                                .maxSessionsPreventsLogin(false))

                                .logout(logout -> logout
                                                .logoutUrl("/logout")
                                                .logoutSuccessUrl("/login?logout")
                                                .deleteCookies("JSESSIONID")
                                                .invalidateHttpSession(true))

                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login")
                                                .failureUrl("/login?error")
                                                .successHandler(
                                                                customSuccessHandler())

                                                .permitAll())
                                .rememberMe((rememberMe) -> rememberMe
                                                .rememberMeServices(rememberMeServices()))

                                .exceptionHandling(exceptionHandling -> exceptionHandling
                                                .accessDeniedPage("/accessDenied"));

                return http.build();

        }

}
