package com.hng12.backend_task_0.controller;

import org.springframework.web.bind.annotation.*;
import java.time.Instant;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*") // Enable CORS for all origins
public class InfoController {

    @GetMapping("/")
    public Map<String, String> getInfo() {
        return Map.of(
            "email", "adebayoadedayoea@gmail.com",
            "current_datetime", Instant.now().toString(), // ISO 8601 format
            "github_url", "https://github.com/JPrince-E"
        );
    }
}
