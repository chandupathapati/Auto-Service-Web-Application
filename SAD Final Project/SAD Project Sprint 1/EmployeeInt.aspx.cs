using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAD_Project_Sprint_1
{
    public partial class EmployeeInt : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

            Panel pnl = (Panel)Master.FindControl("masterPanel");
            pnl.Visible = false;
            Panel pn2 = (Panel)Master.FindControl("PanelCustomer");
            pn2.Visible = true;
            Label lb = (Label)Master.FindControl("Labelmaster");
            lb.Text = "Welcome " + (string)Session["emp_name"];
            lb.ForeColor = Color.Red;

            var result = (from emp in db.employees
                          select new
                          {
                              employee_id = emp.emp_id,
                              emp_name = emp.emp_name
                          }).ToList();

            GridView1.DataSource = result;
            GridView1.DataBind();
        }

        protected void notifications(object sender, EventArgs e)
        {
            panel1.Visible = true;
            Panel2.Visible = false;
            var result = (from o in db.orders
                          where o.order_status == "open"
                          orderby o.order_date
                          select new
                          {
                              ord_hed_id = o.order_hed_id,
                              cust_id = o.cus_id,
                              car_num = o.car_no,
                              emp_id = o.emp_id,
                              ord_date = o.order_date,
                              ord_stat = o.order_status
                          }).ToList();
            OrderDetails.DataSource = result;
            OrderDetails.DataBind();
            Panel4.Visible = false;
            panel1.Visible = true;

        }

        protected void OrderDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            panel1.Visible = true;
            Panel2.Visible = true;
            GridViewRow row = OrderDetails.Rows[e.NewEditIndex];
            blank.Text = row.Cells[0].Text.ToString();
            ord_hed_id.Text = row.Cells[1].Text.ToString();
            cus_id.Text = row.Cells[2].Text.ToString();
            car_no.Text = row.Cells[3].Text.ToString();
            emp_id.Text = row.Cells[4].Text.ToString();
            order_date.Text = row.Cells[5].Text.ToString();
            ord_status.Text = row.Cells[6].Text.ToString();
        }



        protected void Btnsave_Click(object sender, EventArgs e)
        {
            panel1.Visible = false;
            int hed_id = Convert.ToInt32(ord_hed_id.Text);
            int id = Convert.ToInt32(emp_id.Text);
            String stat = Convert.ToString(ord_status.Text);
            using (var context = new DatabaseEntities())
            {
                var result = (from or in context.orders
                              where or.order_hed_id == hed_id
                              select or).FirstOrDefault();

                if (result != null)
                {
                    result.order_hed_id = hed_id;
                    result.emp_id = id;
                    result.order_status = stat;
                    context.SaveChanges();
                }

                Panel2.Visible = false;
                panel3.Visible = false;
                var result1 = (from ord in context.orders
                               where ord.order_status == "open"
                               orderby ord.order_date
                               select new
                               {
                                   ord_hed_id = ord.order_hed_id,
                                   cust_id = ord.cus_id,
                                   car_num = ord.car_no,
                                   emp_id = ord.emp_id,
                                   ord_date = ord.order_date,
                                   ord_stat = ord.order_status
                               }).ToList();
                GridView1.DataSource = result1;
                GridView1.DataBind();
                panel1.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            var result = (from c in db.orders
                          orderby c.order_date
                          where c.order_status == "closed"
                          select new
                          {
                              ord_hed_id = c.order_hed_id,
                              cus_id = c.cus_id,
                              car_num = c.car_no,
                              empl_id = c.emp_id,
                              ord_date = c.order_date,
                              ord_stat = c.order_status
                          }).ToList();
            GridView2.DataSource = result;
            GridView2.DataBind();
            panel1.Visible = false;
            Panel4.Visible = true;


        }



        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add line items")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int value = Convert.ToInt32(GridView2.Rows[rowIndex].Cells[1].Text);

                var results = (from l in db.order_line
                               where l.order_hed_id == value
                               select new invoice_line_itms()
                               {
                                   ser_id = l.ser_id
                               }).ToList();

                foreach (var r in results)
                {
                    Response.Write(r.ser_id);
                }
                List<invoice_line_itms> serv_ids = new List<invoice_line_itms>();

                serv_ids.AddRange(results);
                using (var context1 = new DatabaseEntities())
                {
                    for (int i = 0; i < serv_ids.Count; i++)
                    {
                        int serv_id = Convert.ToInt32(serv_ids[i].ser_id);
                        var results1 = from r in context1.services
                                       where r.ser_id == serv_id
                                       select new
                                       {
                                           servc_id = r.ser_id,
                                           serv_cost = r.ser_cost
                                       };

                        var InvoiceHeaderId = (from x in context1.invoices
                                               where x.order_hed_id == value
                                               select x.inv_hed_id).Single();

                        Response.Write(InvoiceHeaderId);


                        foreach (var r in results1)
                        {
                            if (results1 != null)
                            {
                                context1.invoice_line_item.Add(new invoice_line_item
                                {

                                    ser_id = serv_ids[i].ser_id,
                                    inv_hed_id = Convert.ToInt32(InvoiceHeaderId),
                                    ser_cost = r.serv_cost
                                });
                            }
                        }

                        var OrResult = (from r in context1.orders
                                        where r.order_hed_id == value
                                        select r).Single();
                        OrResult.order_status = "Invoice Created";
                        context1.SaveChanges();

                    }

                }
            }
        }

        // to add total to invoice table
        protected void Button3_Click(object sender, EventArgs e)
        {
            using (DatabaseEntities db = new DatabaseEntities())
            {
                var result = from i in db.invoice_line_item
                             group i by new
                             {
                                 i.inv_hed_id
                             } into g

                             select new
                             {
                                 g.Key.inv_hed_id,
                                 totalcost = (double)g.Sum(x => x.ser_cost)
                             };

                foreach (var r in result)
                {
                    foreach (var s in db.invoices)
                    {
                        if (r.inv_hed_id == s.inv_hed_id)
                        {
                            s.total_cost = r.totalcost;
                        }
                    }
                }

                db.SaveChanges();

            }

            var invoices = db.invoices.ToList();
            InvoiceList.DataSource = invoices;
            InvoiceList.DataBind();

        }


        protected void DisplayInvoiceButton_Click(object sender, EventArgs e)
        {

        }

        protected void InvoiceList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InvoiceDetail")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridView grid = sender as GridView;
                GridViewRow row = grid.Rows[index];
                int invoice_id = Convert.ToInt32(row.Cells[1].Text);

                int service_id = Convert.ToInt32(row.Cells[1].Text);

                using (DatabaseEntities db = new DatabaseEntities())
                {
                    var result = (from d in db.invoice_line_item
                                  join dd in db.services on d.ser_id equals dd.ser_id
                                  //where d.ser_id == service_id
                                  where d.inv_hed_id == invoice_id
                                  select new
                                  {
                                      Invoice_number = d.inv_hed_id,
                                      Service_Id = d.ser_id,
                                      Details = dd.ser_name,
                                      Amount = dd.ser_cost
                                  }
                            ).ToList();


                    GridView3.DataSource = result;
                    GridView3.DataBind();

                    var total = result.AsEnumerable().Sum(t => t.Amount);

                    GridView3.FooterRow.Cells[2].Text = "Total";
                    GridView3.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Left;

                    GridView3.FooterRow.Cells[3].Text = total.ToString("N2");
                }

                InvoiceDetailPanel.Visible = true;


            }

            e.Handled = true;
        }
    }
}