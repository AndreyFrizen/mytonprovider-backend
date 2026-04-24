# mytonprovider-backend

**[Русская версия](README.ru.md)**

Backend service for mytonprovider.org - a TON Storage providers monitoring service.

## Description

This backend service:
- Communicates with storage providers via ADNL protocol
- Monitors provider performance, availability, do health checks
- Handles telemetry data from providers
- Provides API endpoints for frontend
- Computes provider ratings
- Collect own metrics via **Prometheus**
- Ports: 
  - nginx 8082
  - backend 8081
  - prometheus 9091

## Installation & Setup

command
```
  docker-compose up
```
## Project Structure

```
├── cmd/                   # Application entry point, configs, inits
├── pkg/                   # Application packages
│   ├── cache/             # Custom cache
│   ├── httpServer/        # Fiber server handlers
│   ├── models/            # DB and API data models
│   ├── repositories/      # All work with postgres here
│   ├── services/          # Business logic
│   ├── tonclient/         # TON blockchain client, wrap some usefull functions
│   └── workers/           # Workers
├── db/                    # Database schema
├── scripts/               # Setup and utility scripts
```

## API Endpoints

The server provides REST API endpoints for:
- Telemetry data collection
- Provider info and filters tool
- Metrics

## Workers

The application runs several background workers:
- **Providers Master**: Manages provider lifecycle and health checks
- **Telemetry Worker**: Processes incoming telemetry data
- **Cleaner Worker**: Maintains database hygiene and cleanup

## License
 
Apache-2.0



This project was created by order of a TON Foundation community member.
