# Baskt
Platform to connect customers with local grocery vendors

### Problem: 
           Customers can't tell which nearby kirana store has an item or its price

## Phase 1 Scope

Phase 1 delivers a deployed, tested, discovery-only platform. Local grocery stores list items and prices, and customers search for the nearest stores that stock what they need and contact them on WhatsApp.

### Included
- **Authentication and roles:** JWT login for customers, store owners and admins
- **Store onboarding:** owners register stores with location, phone and address; admins verify stores
- **Product catalog:** a shared master catalog of items
- **Per-store inventory:** each store sets its own price and stock for catalog items
- **CSV bulk upload:** owners update inventory from a spreadsheet
- **Nearest-store search:** find stores within a chosen radius that stock an item, sorted by distance, with typo-tolerant matching
- **WhatsApp click-to-chat:** a pre-filled message with the customer's item list
- **Stale-stock alerts:** items not updated recently are flagged to customers
- **Owner notifications:** store owners are emailed when a customer sends an inquiry
- **Performance and reliability:** Redis caching and rate limiting, health checks and metrics
- **Quality and delivery:** automated tests, CI pipeline, Docker Compose setup and a live deployment

### Not included (future phases)
- Online orders and payments
- Delivery and logistics
- WhatsApp Business API automation
- Mobile app
- Elasticsearch and microservices

### Tech stack
Java 21, Spring Boot, Spring Security (JWT), Spring Data JPA, PostgreSQL with PostGIS, Flyway, Redis, RabbitMQ, Docker, GitHub Actions, JUnit 5, Mockito, Testcontainers, Swagger (OpenAPI)

### How to Run :
             Coming Soon