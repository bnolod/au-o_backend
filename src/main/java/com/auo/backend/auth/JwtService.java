package com.auo.backend.auth;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.function.Function;

@Service
public class JwtService {

    private static final String SECRET_KEY = "I4krgP23R8GgbLnT2wRaPrYDm5Sk8INS70XWDPQF67JHymRjUULcdA6G42+wU4q/drb6jT2JeIqHP3SD4nsvEMInhbReoYXvxE3zF0TLXe9HBurpLj0gBYaHxa6Ste8ejgx+fzBRbnEixuBVPfmu8GGtjh0WhaOzHw2JMoex7ieaztyKdPgywHz3f09VcILWRRjqom616lSUhsiK5OafxwpK/j4utDhmmmzZSayUe9AL6PqdGDg+AS0slkBjzUUfKd2p573EQ1UJqO9tScFk4l6UR3xWhjX55MQbg366DGZQDPA2plmeGfgsYkSBrfdT5sFnevQ7/7kV4a0VSIbFDNa4TQdSi2TElsceOA14X0g=";

    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    public <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }



    public String generateToken(UserDetails userDetails) {
        return Jwts
                .builder()
//                .setClaims(extraClaims)
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis()+ 1000 * 60 * 24))
                .signWith(getSigningKey())
                .compact();
    }

    public Claims extractAllClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(getSigningKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    public boolean isTokenValid(String token, UserDetails userDetails) {
        final String username = extractUsername(token);
        return (username.equals(userDetails.getUsername()) && !isTokenExpired(token));
    }

    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }

    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    private Key getSigningKey() {
        byte[] keyBytes = Decoders.BASE64.decode(SECRET_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
