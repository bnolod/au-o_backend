package com.auo.backend.auth;

import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.util.WebUtils;

import java.io.IOException;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter{

    private final JwtService jwtService;
    private final UserRepository userRepository;
    private final UserDetailsService userDetailsService;
    private final AuthenticationService authService;

    @Override
    protected void doFilterInternal(
            @NonNull HttpServletRequest request,
            @NonNull HttpServletResponse response,
            @NonNull FilterChain filterChain
    )
            throws ServletException, IOException {
        final String authHeader = request.getHeader("Authorization");
        String jwt = null;
        final String username;
        var tokenCookie = WebUtils.getCookie(request, "token");
        if (tokenCookie != null) {
            jwt = tokenCookie.getValue();
        }

        System.out.println(authHeader);
        if(jwt == null || jwt.isEmpty()) {
            if (authHeader!= null) {
                jwt = authHeader.substring(7);
            }
        }
        if (jwt == null || jwt.isEmpty()) {
            filterChain.doFilter(request,response);
            return;
        }
        System.out.println(jwt);

        try{
            username = jwtService.extractUsername(jwt);
        } catch (Exception e) {
            //delete the mishandle cookie
            Cookie cookie = new Cookie("token", null);
            cookie.setHttpOnly(true);
            cookie.setSecure(false);
            cookie.setPath("/");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            filterChain.doFilter(request,response);
            return;
        }
        Optional<User> user = userRepository.findUserByUsername(username);

        if (user.isEmpty()) {
            filterChain.doFilter(request,response);
            return;
        }
        if (SecurityContextHolder.getContext().getAuthentication() == null) {
            if (jwtService.isTokenValid(jwt,user.get())) {
                UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                        user.get(),
                        null,
                        user.get().getAuthorities()
                );
                authToken.setDetails(
                        new WebAuthenticationDetailsSource().buildDetails(request)
                );
                SecurityContextHolder.getContext().setAuthentication(authToken);
                var newToken = jwtService.generateToken(user.get());
                authService.createTokenCookie(newToken,response);
            }
        }
        filterChain.doFilter(request,response);
    }
}
