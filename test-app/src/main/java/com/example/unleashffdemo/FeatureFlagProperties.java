package com.example.unleashffdemo;

import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

@ConfigurationProperties(prefix = "app.feature-flags")
public record FeatureFlagProperties(List<String> names) {
}
