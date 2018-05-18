using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAD_Project_Sprint_1
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel pn2 = (Panel)Master.FindControl("PanelCustomer");
            pn2.Visible = false;

        }
        private void SaveSignUpInfo()
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var result = (from c in db.customers
                              where c.cus_user_id == TextBoxID.Text
                              select c).ToList();
                if (result.Count == 0)
                {
                    customer cnew = new customer();
                    cnew.cus_name = TextBoxFirstName.Text + " " + TextBoxLastName.Text;
                    cnew.cus_user_id = TextBoxID.Text;
                    cnew.cus_pwd = TextBoxPassword.Text;
                    db.customers.Add(cnew);
                    db.SaveChanges();
                    Session["flag"] = "yes";
                    Response.Redirect("Login.aspx");
                }
                else
                    Label1.Text = "User already exists";
            }
        }
        protected void BtnSIgnUp_Click(object sender, EventArgs e)
        {
            SaveSignUpInfo();


        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}