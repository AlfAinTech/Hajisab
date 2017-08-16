using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static DreamUtil;

/// <summary>
/// Summary description for IQuestion
/// </summary>
public interface IQuestion
{
    decimal isCorrect();
    int QuestionID();
    decimal GetCorrectionPercentage();
    void BindQuiz(int id, bool CorrectOption);
    void BindQuiz(LessonQuestion quiz);

    event EventHandler DoSubmit;
}