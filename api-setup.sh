#!/bin/bash

# Variables
PROJECT_NAME="SurveyAppApi"
MIGRATION_NAME="InitialCreate"
DB_CONTEXT_FILE="Models/SurveyContext.cs"
MODEL_DIR="Models"
CONTROLLERS_DIR="Controllers"
API_PORT="5001"

# Create a new .NET Core Web API project
echo "Creating .NET Core Web API project: $PROJECT_NAME..."
dotnet new webapi -n $PROJECT_NAME
cd $PROJECT_NAME

# Install necessary packages
echo "Installing necessary packages..."
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer
dotnet add package System.IdentityModel.Tokens.Jwt

# Create Models directory
mkdir -p $MODEL_DIR

# Create model classes
echo "Creating model classes..."
cat <<EOL > $MODEL_DIR/User.cs
using System.Collections.Generic;

namespace SurveyAppApi.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public ICollection<Campaign> Campaigns { get; set; }
    }
}
EOL

cat <<EOL > $MODEL_DIR/Campaign.cs
using System.Collections.Generic;

namespace SurveyAppApi.Models
{
    public class Campaign
    {
        public int CampaignId { get; set; }
        public string Title { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public ICollection<Question> Questions { get; set; }
    }
}
EOL

cat <<EOL > $MODEL_DIR/Question.cs
using System.Collections.Generic;

namespace SurveyAppApi.Models
{
    public class Question
    {
        public int QuestionId { get; set; }
        public string Text { get; set; }
        public int CampaignId { get; set; }
        public Campaign Campaign { get; set; }
        public ICollection<Option> Options { get; set; }
    }
}
EOL

cat <<EOL > $MODEL_DIR/Option.cs
namespace SurveyAppApi.Models
{
    public class Option
    {
        public int OptionId { get; set; }
        public string Text { get; set; }
        public int QuestionId { get; set; }
        public Question Question { get; set; }
    }
}
EOL

# Create the database context
echo "Creating the database context..."
cat <<EOL > $DB_CONTEXT_FILE
using Microsoft.EntityFrameworkCore;

namespace SurveyAppApi.Models
{
    public class SurveyContext : DbContext
    {
        public SurveyContext(DbContextOptions<SurveyContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Campaign> Campaigns { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Option> Options { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().ToTable("User");
            modelBuilder.Entity<Campaign>().ToTable("Campaign");
            modelBuilder.Entity<Question>().ToTable("Question");
            modelBuilder.Entity<Option>().ToTable("Option");
        }
    }
}
EOL

# Update appsettings.json with connection string
echo "Updating appsettings.json with connection string..."
sed -i '/"ConnectionStrings": {/a\    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=SurveyAppDb;Trusted_Connection=True;MultipleActiveResultSets=true"' appsettings.json

# Add DbContext to Startup.cs
echo "Adding DbContext to Startup.cs..."
sed -i '/public void ConfigureServices(IServiceCollection services)/a\    services.AddDbContext<SurveyContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));' Startup.cs

# Create initial migration
echo "Creating initial migration..."
dotnet ef migrations add $MIGRATION_NAME

# Apply the migration to the database
echo "Applying migration to the database..."
dotnet ef database update

echo "Setup completed successfully!"
