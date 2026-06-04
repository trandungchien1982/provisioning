package com.example.unleashffdemo;

import io.getunleash.Unleash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class FeatureFlagLogger implements ApplicationRunner {

    private static final Logger log = LoggerFactory.getLogger(FeatureFlagLogger.class);

    private final Unleash unleash;
    private final FeatureFlagProperties properties;
    private final Environment environment;

    public FeatureFlagLogger(Unleash unleash,
                             FeatureFlagProperties properties,
                             Environment environment) {
        this.unleash = unleash;
        this.properties = properties;
        this.environment = environment;
    }

    @Override
    public void run(ApplicationArguments args) {
        String unleashEnvironment = environment.getProperty("io.getunleash.environment", "unknown");

        log.info("========== Unleash Feature Flag Status ==========");
        log.info("Current Unleash environment: {}", unleashEnvironment);

        properties.names().forEach(this::logFeatureFlagStatus);

        log.info("=================================================");
    }

    private void logFeatureFlagStatus(String featureFlagName) {
        boolean enabled = unleash.isEnabled(featureFlagName);

        if (enabled) {
            log.info("FF [{}] is ENABLED", featureFlagName);
        } else {
            log.warn("FF [{}] is DISABLED", featureFlagName);
        }
    }
}
