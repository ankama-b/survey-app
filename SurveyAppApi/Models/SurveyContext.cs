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
