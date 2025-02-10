package com.auo.backend.exceptions;


import io.jsonwebtoken.ExpiredJwtException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.ResponseStatusException;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(ResponseStatusException.class)
    public ResponseEntity<CustomErrorResponse> handleResponseStatusException(ResponseStatusException ex) {
        return new ResponseEntity<>(
                new CustomErrorResponse(ex.getStatusCode().value(), ex.getReason()),
                ex.getStatusCode());
    }

    @ExceptionHandler(ExpiredJwtException.class)
    public ResponseEntity<CustomErrorResponse> handleJwtExpirationError(ExpiredJwtException ex) {
        return new ResponseEntity<>(
                new CustomErrorResponse(403, ex.getMessage()),
                HttpStatus.FORBIDDEN);
    }
}

