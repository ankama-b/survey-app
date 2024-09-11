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
