# Karate Tournament Manager

A Rails application to manage Karate tournaments, competitors, and categories (Kata/Kumite).

## Prerequisites

- Ruby 3.x
- Rails 7.x
- Docker & Docker Compose (for PostgreSQL)

## Getting Started

### 1. Start the Database
Ensure Docker is running, then start the PostgreSQL container:
```bash
docker compose up -d
```

### 2. Setup Database
Create the database and run migrations:
```bash
rails db:create
rails db:migrate
```
*Note: If you encounter connection errors, ensure port 5432 is free and Docker is running.*

### 3. Start the Server
Run the Rails server:
```bash
rails s
```

### 4. Use the App
Open your browser and visit:
- **Competitors**: [http://localhost:3000/competitors](http://localhost:3000/competitors)

## Features
- **Competitors**: Manage fighters with Belt validations.
- **Tournaments & Categories**: Organize events.
- **Enrollments**: Sign up competitors for categories.
- **Matches**: Handle Kata (Scores) and Kumite (Points) matches.
# karate_kumite
