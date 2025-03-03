package com.auo.backend.auth;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
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
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.util.WebUtils;

import java.io.IOException;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter{

    private final JwtService jwtService;
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
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            var tokenCookie = WebUtils.getCookie(request, "token");
            if (tokenCookie == null) {
                var refreshTokenCookie = WebUtils.getCookie(request, "refreshtoken");
                if (refreshTokenCookie == null) {
                    filterChain.doFilter(request,response);
                    return;
                } else {
                    jwt = refreshTokenCookie.getValue();
                }
            } else {
                jwt = tokenCookie.getValue();
            }

        }
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
        } catch (UsernameNotFoundException e) {
            filterChain.doFilter(request,response);
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "username not found");
        }
        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            UserDetails userDetails = this.userDetailsService.loadUserByUsername(username);
            if (jwtService.isTokenValid(jwt,userDetails)) {
                UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );
                authToken.setDetails(
                        new WebAuthenticationDetailsSource().buildDetails(request)
                );
                SecurityContextHolder.getContext().setAuthentication(authToken);
                var newToken = jwtService.generateToken(userDetails);
                authService.createTokenCookie(newToken,response);
            }

        }
        filterChain.doFilter(request,response);
    }
}
