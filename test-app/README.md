# Unleash Feature Flag Demo - Spring Boot 3.x / Gradle / JDK 21

Sample app to read and log Unleash feature flag status from Unleash Open Source 7.6.4.

## Feature flags

- `mix-data-color-01`
- `home-page-02`
- `clear-data-03`
- `enabled-fill-data`
- `hot-reload-data`

## Requirements

- JDK 21
- Gradle Wrapper or local Gradle
- Unleash Backend SDK token for each environment

## Run with Gradle

Development:

```bash
export UNLEASH_API_URL='http://vm-unleash.tt:7000/api'
export UNLEASH_API_TOKEN='*:development.35a1b6148a05099f72cadb7b5c4154b5c2bd5135cc20bee41173e886'
export UNLEASH_ENVIRONMENT='development'
./gradlew bootRun --args='--spring.profiles.active=development'
```

Production:

```bash
export UNLEASH_API_URL='http://vm-unleash.tt:7000/api'
export UNLEASH_API_TOKEN='replace-with-production-backend-sdk-token'
export UNLEASH_ENVIRONMENT='production'
./gradlew bootRun --args='--spring.profiles.active=production'
```

## Build JAR

```bash
./gradlew clean bootJar
java -jar build/libs/unleash-ff-demo-0.0.1-SNAPSHOT.jar
```

## Run with Docker Compose

Create `.env` from `.env.example`:

```bash
cp .env.example .env
```

Then update token values and run:

```bash
docker compose up --build unleash-ff-demo-development
# or
docker compose up --build unleash-ff-demo-production
```

## Expected behavior

The app logs whether each feature flag is enabled or disabled for the selected Unleash environment.
