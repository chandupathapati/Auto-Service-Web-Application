using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace SAD_Project_Sprint_1
{
    public partial class Customer_Interface : System.Web.UI.Page
    {

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Panel pnl = (Panel)Master.FindControl("masterPanel");
            pnl.Visible = false;
            Panel pn2 = (Panel)Master.FindControl("PanelCustomer");
            pn2.Visible = true;
            Label lb = (Label)Master.FindControl("Labelmaster");
            lb.Text = "Welcome " + (string)Session["custname"];
            lb.ForeColor = Color.Red;
            

            Label1.Text = "Welcome " + (string)Session["custname"];
            OrderPanel.Visible = false;
            Payment_Summary.Visible = false;
            var record = "";


        }

        protected void Placing_Order(object sender, EventArgs e)
        {
            
            Payments_to_pay.Visible = false;
            Payment_Panel.Visible = false;
            Payment_Summary.Visible = false;
            OrderPanel.Visible = true;

            int orhdid = updateorders();
            updateorderitems(orhdid);

        }

        public int updateorders()
        {
            int customer_id = (int)Session["cust_id"];


            using (DatabaseEntities db = new DatabaseEntities())
            {
                db.orders.Add(new order
                {
                    cus_id = customer_id,
                    car_no = TextBox1.Text,
                    emp_id = 1,
                    order_date = DateTime.Now,
                    order_status = "Open"
                });
                db.SaveChanges();
                

                int orderheaderid = (from c in db.orders
                                     select c.order_hed_id).Max();

                return orderheaderid;
            }

        }
        public void updateorderitems(int orhdid)
        {

            using (DatabaseEntities db = new DatabaseEntities())
            {
                if (CheckBox1.Checked)
                {

                    db.order_line.Add(new order_line
                    {
                        order_hed_id = orhdid,

                        ser_id = 1

                    });
                }
                if (CheckBox2.Checked)
                {

                    db.order_line.Add(new order_line
                    {
                        order_hed_id = orhdid,

                        ser_id = 2

                    });
                }
                if (CheckBox3.Checked)
                {

                    db.order_line.Add(new order_line
                    {
                        order_hed_id = orhdid,

                        ser_id = 3

                    });
                }

                db.SaveChanges();

                db.invoices.Add(new invoice
                {
                    order_hed_id = orhdid,
                    total_cost = 0
                });
                db.SaveChanges();


                TextBox1.Text = "";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;

                Label5.Text = "Your Order has been placed successfully..! Thank You....! ";

            }



        }

        protected void Make_an_Order(object sender, EventArgs e)
        {
            OrderPanel.Visible = true;
        }

        protected void Order_Status(object sender, EventArgs e)
        {
            int customer_id = (int)Session["cust_id"];

            OrderPanel.Visible = false;
            Status_Panel.Visible = true;
            Payments_to_pay.Visible = false;
            Payment_Summary.Visible = false;

            using (DatabaseEntities db = new DatabaseEntities())
            {
                var Status = (from or in db.orders
                              where or.cus_id == customer_id
                              select new
                              {
                                  Car_Number = or.car_no,
                                  Order_Date = or.order_date,
                                  Order_Status = or.order_status
                              }
                              ).ToList();

                Or_Status.DataSource = Status;
                Or_Status.DataBind();
            }
                        


        }

        protected void Payment(object sender, EventArgs e)
        {
            int customer_id = (int)Session["cust_id"];

            OrderPanel.Visible = false;
            Status_Panel.Visible = false;
            Payments_to_pay.Visible = true;
            Payment_Summary.Visible = false;

            using (DatabaseEntities db = new DatabaseEntities())
            {

                var Amount = (from or in db.orders
                              join iv in db.invoices
                              on or.order_hed_id equals iv.order_hed_id
                              where or.cus_id == customer_id && or.order_status == "Invoice Created"
                              select new
                              {
                                  Car_Number = or.car_no,
                                  Order_Date = or.order_date,
                                  Total_Amount = iv.total_cost
                              }
                               ).ToList();

                Payments_to_pay.DataSource = Amount;
                Payments_to_pay.DataBind();

            }



        }

        protected void Payments_to_pay_RowCommand(object sender, GridViewDeleteEventArgs e)
        {

            int customer_id = (int)Session["cust_id"];

            Payments_to_pay.Visible = false;
           
            Payment_Summary.Visible = true;
            

            using (DatabaseEntities db = new DatabaseEntities())
            {

                var Amount = (from or in db.orders
                              join iv in db.invoices
                              on or.order_hed_id equals iv.order_hed_id
                              where or.cus_id == customer_id && or.order_status == "Invoice Created"
                              select new
                              { 
                                   CarNumber = or.car_no,
                                   TotalAmount = iv.total_cost

                                });



                foreach (var item in Amount)
                {

                    Label6.Text = item.CarNumber;
                    Label7.Text = Convert.ToString(item.TotalAmount);

                }


                

            }

            

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Payments_to_pay.Visible = false;

            Payment_Summary.Visible = true;

            

           


                Label8.Text = "Thank you for making the Payment...!";
        }

       
    }
}