# NextStop – Bus Ticketing System

# Getting Started/Demo Information

Welcome! If you'd like to see out our application hosted on Azure App Service, please visit [NextStop.xyz](https://nextstop-baatfxcxefcahqdh.eastus2-01.azurewebsites.net). This is a full stack web application where users can search for trips and purchases tickets.  
We hope you enjoy our app! Feel free to reach out if you have any questions.

# Technologies
Our technology stack for making this app consisted of: ASP.NET Core, Razor Pages, Entity Framework Core, HTML, Bootstrap, , Azure Blob Storage, Azure SQL Database, Azure App Service

# Functionalities
•	Registration for users  
•	Login/logout for users and admins  
•	Users can search for trips 
•	Users can buy tickets 
•	Customers can view their orders 
•	Users can buy tickets 
•	Admins can add buses 
•	Admins can add and edit trips 

# How to Run
- Clone the Repository 
- Restore Dependencies with the command: dotnet restore 
- Use Secrets Manager to configure sensitive data: 
  dotnet user-secrets init 
  dotnet user-secrets set "ConnectionStrings:AzureConnection" "your-database-connection-string" 
  dotnet user-secrets set "AzureBlobStorage:ConnectionString" "your-blob-storage-connection-string" 
  dotnet user-secrets set "AzureBlobStorage:ContainerName" "profilepictures" 
  dotnet user-secrets set "Stripe:PublishableKey" "your-stripe-publishable-key" 
  dotnet user-secrets set "Stripe:SecretKey" "your-stripe-secret-key" 
  dotnet user-secrets set "Stripe:WebhookSecret" "your-stripe-webhook-secret" 
- Run the app with the command: dotnet run 

