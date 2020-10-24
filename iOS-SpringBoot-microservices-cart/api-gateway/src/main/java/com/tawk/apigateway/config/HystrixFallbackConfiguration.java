package com.tawk.apigateway.config;

/*
 * tutorial link - https://www.baeldung.com/spring-zuul-fallback-route
 * */

import com.netflix.hystrix.exception.HystrixTimeoutException;
import com.tawk.apigateway.config.fallback.GatewayClientResponse;
import org.springframework.cloud.netflix.zuul.filters.route.FallbackProvider;
import org.springframework.http.HttpStatus;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;

@Component
public class HystrixFallbackConfiguration implements FallbackProvider {
    private static final String DEFAULT_MESSAGE = "Product information is not available.";

    @Override
    public String getRoute() {
        return "product-service";
    }

    @Override
    public ClientHttpResponse fallbackResponse(String route, Throwable cause) {
        if (cause instanceof HystrixTimeoutException) {
            return new GatewayClientResponse(HttpStatus.GATEWAY_TIMEOUT, DEFAULT_MESSAGE);
        } else {
            return new GatewayClientResponse(HttpStatus.INTERNAL_SERVER_ERROR, DEFAULT_MESSAGE);
        }
    }
}