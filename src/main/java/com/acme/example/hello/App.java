package com.acme.example.hello;

import io.javalin.Javalin;

public class App {
    public static void main(String[] args) {
        Javalin.create(/* config */)
                .get("/", ctx -> ctx.result("Hello World"))
                .get("/health/readiness", ctx -> ctx.result("Ready"))
                .get("/health/liveness", ctx -> ctx.result("Live"))
                .start(8080);
    }
}
