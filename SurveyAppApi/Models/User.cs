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
