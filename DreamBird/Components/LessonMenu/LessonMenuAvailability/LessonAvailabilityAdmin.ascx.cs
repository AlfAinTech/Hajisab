using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuAvailability_LessonAvailabilityAdmin : System.Web.UI.UserControl
{
   public event EventHandler ShowPopup;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void bindData(int menu_id)
    {
        ClearControl();
        DreamBirdEntities db = new DreamBirdEntities();
        var data = db.LessonMenuAvailabilities.Where(q => q.MenuID == menu_id).ToList();
        if(data.Count() !=0)
        {
            
            LessonMenuAvailability lma = data[0];
            if (lma.AvailableFrom != null) { DateTime d = (DateTime)lma.AvailableFrom;
                availableDate.Text = d.ToString("yyyy-MM-dd"); }
            if (lma.DeadLine != null){
                DateTime d = (DateTime)lma.DeadLine;
                deadLineDate.Text = d.ToString("yyyy-MM-dd"); }
            timeLimit.Text = lma.TimeLimit.ToString();
            id_lbl.Text = lma.id.ToString();
           
        }
        menuID_lbl.Text = menu_id.ToString();
        limitType.SelectedIndex = 0;
    }
    protected void save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) { 
        DreamBirdEntities db = new DreamBirdEntities();

        LessonMenuAvailability lma;
            int id = int.Parse(menuID_lbl.Text.ToString());
             var data = db.LessonMenuAvailabilities.Where(q => q.MenuID == id).ToList();
            if(data.Count != 0) {
                lma = data[0];
                lma.AvailableFrom = DateTime.Parse(availableDate.Text.ToString()); 
                lma.DeadLine = DateTime.Parse(deadLineDate.Text.ToString()); 
                lma.TimeLimit = getDays();
            }
        else
        {
                lma = new LessonMenuAvailability();
                lma.AvailableFrom = DateTime.Parse(availableDate.Text.ToString()); 
               lma.DeadLine = DateTime.Parse(deadLineDate.Text.ToString()); 
                lma.TimeLimit = getDays();
                lma.MenuID = int.Parse(menuID_lbl.Text);
                db.LessonMenuAvailabilities.Add(lma);
            }
       
        db.SaveChanges();
       
        

        }
        else { 
        if(ShowPopup != null) {        ShowPopup(sender, e);}
    }
    }
    protected int getDays()
    {
        int dayPerWeek = 7;
        int value = int.Parse(timeLimit.Text);
        if(limitType.SelectedValue == "1")
        {
            value = value * dayPerWeek;

        }
        return value;
    }

    protected void Available_chk_CheckedChanged(object sender, EventArgs e)
    {
        availableTxt_validator.Enabled = true;
        if (ShowPopup != null) { ShowPopup(sender, e); }

    }

    protected void deadline_chk_CheckedChanged(object sender, EventArgs e)
    {
        deadLineTxt_validator.Enabled = true;
        if (ShowPopup != null) { ShowPopup(sender, e); }
    }

    protected void timeLimit_chk_CheckedChanged(object sender, EventArgs e)
    {

    }
    public void ClearControl()
    {
        
        availableDate.Text = timeLimit.Text = "";
        timeLimit.Text = "0";
    }
}