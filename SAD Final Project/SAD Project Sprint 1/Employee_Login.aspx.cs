using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAD_Project_Sprint_1
{
    public partial class Employee_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel pn2 = (Panel)Master.FindControl("PanelCustomer");
            pn2.Visible = false;
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var result = (from emp in db.employees
                              where emp.emp_user_id == TextBox1.Text
                              && emp.emp_pwd == TextBox2.Text
                              select emp).ToList();

                if (result.Count != 0)
                {
                   
                    var x = (from emp in db.employees
                             where emp.emp_user_id == TextBox1.Text
                             && emp.emp_pwd == TextBox2.Text
                             select emp).FirstOrDefault();
                    Session["emp_name"] = x.emp_name;
                    Session["emp_id"] = x.emp_id;
                    Response.Redirect("EmployeeInt.aspx");
                }
                else
                {
                    Label1.Text = "Invalid username and password. please try again";
                }
            }
        }
    }
}