using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAD_Project_Sprint_1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel pn2 = (Panel)Master.FindControl("PanelCustomer");
            pn2.Visible = false;
        }

        

        protected void Button1_Click1(object sender, EventArgs e)
        {

            using ( DatabaseEntities db = new DatabaseEntities())
            {
                var result = (from c in db.customers
                              where c.cus_user_id == TextBox1.Text
                              && c.cus_pwd == TextBox2.Text
                              select c).ToList();

                

                if (result.Count != 0)
                {
                    var x = (from y in db.customers
                             where y.cus_user_id == TextBox1.Text
                             select y).SingleOrDefault();
                    Session["custname"] = x.cus_name;
                    Session["cust_id"] = x.cus_id;

                    Response.Redirect("Customer_Interface.aspx");
                    //Response.Redirect("CustomerWelcomePage.aspx");

                    
                   
                 }
                else
                {
                    Label1.Text = "Invalid username and password. please try again";
                }
            }

        }
    }
}