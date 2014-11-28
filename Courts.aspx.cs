using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TCCEFY
{
    public partial class Courts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadTxtFile();
        }

        protected void loadTxtFile()
        {
            string[] arrDays = new string[] {"Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"};


        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            tblCourts.Rows[Convert.ToInt32(ddlTime.SelectedValue)].Cells[Convert.ToInt32(ddlDays.SelectedValue)].Text = txtName.Text;
        }
    }
}