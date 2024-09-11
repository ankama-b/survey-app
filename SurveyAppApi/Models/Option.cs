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
