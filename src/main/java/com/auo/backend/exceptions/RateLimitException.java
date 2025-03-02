package com.auo.backend.exceptions;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.server.ResponseStatusException;

@ResponseStatus(value = HttpStatus.TOO_MANY_REQUESTS)
public class RateLimitException extends RuntimeException {

    public RateLimitException(final String message) {
        super(message);
    }

    public ResponseStatusException toApiErrorMessage(final String path) {
        return new ResponseStatusException(HttpStatus.TOO_MANY_REQUESTS, HttpStatus.TOO_MANY_REQUESTS.name());
    }
}