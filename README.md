# NextStop – Bus Ticketing System

## Overview
NextStop is a full-stack web application built with ASP.NET Core that allows users to search for bus trips and purchase tickets online.

## Live Demo
Visit our application at [NextStop.xyz](https://nextstop-baatfxcxefcahqdh.eastus2-01.azurewebsites.net)

## Technologies
- **Backend**: ASP.NET Core 6.0, Entity Framework Core
- **Frontend**: Razor Pages, HTML5, CSS3, Bootstrap 5
- **Payment Processing**: Stripe API
- **Cloud Services**: 
  - Azure App Service (Web Hosting)
  - Azure SQL Database (Data Storage)
  - Azure Blob Storage (Profile Picture Storage)

## Key Features
- User authentication and profile management
- Trip search with filtering options
- Secure online ticket purchasing via Stripe
- Order history and ticket management
- Admin panel for bus and trip management

## Getting Started

### Prerequisites
- .NET 6.0 SDK or later
- Visual Studio or VS Code
- Stripe account (for payment processing)

### Local Setup

1. Clone the repository:
   ```
   git clone https://github.com/mankai-amine/twixer-client.git
   cd twixer-client
   ```

2. Restore dependencies:
   ```
   dotnet restore
   ```

3. Configure secrets (for local development):
   ```
   dotnet user-secrets init  
   dotnet user-secrets set "ConnectionStrings:AzureConnection" "your-database-connection-string"  
   dotnet user-secrets set "AzureBlobStorage:ConnectionString" "your-blob-storage-connection-string"  
   dotnet user-secrets set "AzureBlobStorage:ContainerName" "profilepictures"  
   dotnet user-secrets set "Stripe:PublishableKey" "your-stripe-publishable-key"  
   dotnet user-secrets set "Stripe:SecretKey" "your-stripe-secret-key"  
   dotnet user-secrets set "Stripe:WebhookSecret" "your-stripe-webhook-secret"
   ```

5. Run the application:
   ```
   dotnet run
   ```
## Database Schema
The application uses the following models:

- ApplicationUser: The custom user class that extends the ASP.NET Core Identity IdentityUser class
- Bus: Model for bus information (ID, model, manufacturer, capacity)
- Order: Represents ticket bookings/purchases (includes trip, customer, passenger counts, travel date)
- Trip: Contains journey details (origin, destination, times, price, bus, driver)
