using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace ITSupport
{
    public partial class ITSupport : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        MySqlConnection conn = new MySqlConnection();
        MySqlCommand cmd = new MySqlCommand();
        MySqlDataAdapter da = new MySqlDataAdapter();
        DataTable dt = new DataTable();

        int count;
        string query;

        static string _ITID;
        public static string ITID
        {
            get
            {
                return _ITID;

            }
            set
            {
                _ITID = value;
            }
        }

        static string _DateStart;
        public static string DateStart
        {
            get
            {
                return _DateStart;
            }
            set
            {
                _DateStart = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                conn = new MySqlConnection(constr);
                conn.Open();
                List<ListItem> items = new List<ListItem>();
                List<ListItem> items2 = new List<ListItem>();

                ITID = "1";
                txtIT.Text = "Gilbert Dioquino";
                    query = "SELECT DEPTID, DEPTNAME, DEPTCODE FROM TBLDEPARTMENT ORDER BY DEPTCODE";
                    cmd = new MySqlCommand(query, conn);
                    da = new MySqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt = new DataTable());
                    items.Clear();
                    for (int ctr = 0; ctr < dt.Rows.Count; ctr++)
                    {
                        items.Add(new ListItem(dt.Rows[ctr]["DEPTCODE"].ToString(), dt.Rows[ctr]["DEPTID"].ToString()));
                    }
                    drpDepartment.Items.AddRange(items.ToArray());


                    query = "SELECT EMPNAME, EMPID FROM TBLEMP WHERE DEPTID = '" + drpDepartment.SelectedValue + "' ORDER BY EMPID DESC ";
                    cmd = new MySqlCommand(query, conn);
                    da = new MySqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt = new DataTable());
                    items.Clear();
                    for (int ctr = 0; ctr < dt.Rows.Count; ctr++)
                    {
                        items.Add(new ListItem(dt.Rows[ctr]["EMPNAME"].ToString(), dt.Rows[ctr]["EMPID"].ToString()));
                    }
                    drpEMP.Items.AddRange(items.ToArray());
                    conn.Close();
                
                
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int Count, Count2;
            Count = int.Parse(lblSecondCounter.Text);
            Count++;
            lblSecondCounter.Text = Count.ToString();
            if (Count == 60)
            {
                Count2 = int.Parse(lblMinuteCounter.Text);
                Count2++;
                lblMinuteCounter.Text = Count2.ToString();
                lblSecondCounter.Text = "00";
            }
            
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = true;
            DateStart = DateTime.Now.ToString();
            txtRemarks.Enabled = true;
            drpResult.Enabled = true;
            drpProblem.Enabled = true;
            btnEndSupport.Enabled = true;
            txtOtherProb.Enabled = true;
            if (drpEquip.SelectedValue == "Laptop" || drpEquip.SelectedValue == "Desktop")
            {
                drpProblem.Items.Add("Network Connectivity");
                drpProblem.Items.Add("Printing/Scanning Problems");
                drpProblem.Items.Add("Hardware Failure");
                drpProblem.Items.Add("System Hang-up/Crash");
                drpProblem.Items.Add("Email Problems");
                drpProblem.Items.Add("Microsoft Office Problems");
                drpProblem.Items.Add("Software Installation");
            }
            if (drpEquip.SelectedValue == "Mobile")
            {
                
                
                drpProblem.Items.Add("Signal Problems");
                
                drpProblem.Items.Add("Email Problems");
                drpProblem.Items.Add("Software/App Installation");
                drpProblem.Items.Add("Incoming/Outgoing Call/Message");
                
            }
            if (drpEquip.SelectedValue == "Printer")
            {
                drpProblem.Items.Add("Print Quality");
                drpProblem.Items.Add("Paper Jam");
                drpProblem.Items.Add("Network Connectivity");
                drpProblem.Items.Add("Ink Refill");
                drpProblem.Items.Add("Printer Error");
            }
            if (drpEquip.SelectedValue == "Accounting System")
            {
                drpProblem.Items.Add("Network Connectivity");
                
            }
            if (drpEquip.SelectedValue == "Payroll System")
            {
                drpProblem.Items.Add("Network Connectivity");
            }
            if (drpEquip.SelectedValue == "Portal")
            {
                drpProblem.Items.Add("Network Connectivity");
                drpProblem.Items.Add("Forms");
            }
            if (drpEquip.SelectedValue == "Internet Connection")
            {
                drpProblem.Items.Add("Network Connectivity");
                
            }
            if (drpEquip.SelectedValue == "Telephone")
            {
                drpProblem.Items.Add("Incoming/Outgoing Call");
                drpProblem.Items.Add("Dial Tone");
            }
            if (drpEquip.SelectedValue == "Server")
            {
                drpProblem.Items.Add("Network Connectivity");
                drpProblem.Items.Add("Accessibility");
                drpProblem.Items.Add("File Retrieval");
            }
            if (drpEquip.SelectedValue == "IT Request")
            {
                drpProblem.Items.Add("IT Request");
            }
            drpProblem.Items.Add("Others");

            
        }

        protected void btnEndSupport_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            string difference = lblMinuteCounter.Text + " : " + lblSecondCounter.Text;
            conn = new MySqlConnection(constr);
            conn.Open();
            query = "INSERT INTO TBLITSUPPORT(ITNAME,EMPNAME, EQUIPMENTNAME, OTHEREQUIPMENT, PROBLEM, OTHERPROBLEM, STARTTIME, RESULT,REMARKS,ENDTIME,DIFFTIME)";
            query += " VALUES('" + ITID + "','" + drpEMP.SelectedValue +"', '"+ drpEquip.SelectedValue +"', '"+ txtOtherEquip.Text +"' , '"+ drpProblem.SelectedValue +"','"+ txtOtherProb.Text +"' ,'"+ DateStart +"','"+ drpResult.SelectedValue +"','"+ txtRemarks.Text +"','"+ DateTime.Now +"','"+ difference +"')";
            cmd = new MySqlCommand(query,conn);
            count = cmd.ExecuteNonQuery();
            if (count > 0)
            {
                
                lblMessage.Text = "IT SUPPORT COMPLETE";
                lblMinuteCounter.Text = "00";
                lblSecondCounter.Text = "00";
                txtRemarks.Text = "";
                txtRemarks.Enabled = false;
                drpResult.Enabled = false ;
                drpProblem.Enabled = false;
                btnEndSupport.Enabled = false;
                txtOtherProb.Enabled = false;
                drpProblem.Items.Clear();
                txtOtherProb.Text = "";
                txtOtherEquip.Style.Add("display", "none");
                
                txtOtherProb.Text = "";
                
            }
        }

        protected void drpEquip_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpEquip.SelectedValue == "Others")
            {
                OtherEquipment.Style.Add("display", "true");
                divOtherProb.Style.Add("display", "true");
            }
            
        }

        protected void drpDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn = new MySqlConnection(constr);
            conn.Open();

            List<ListItem> items = new List<ListItem>();
            query = "SELECT EMPNAME, EMPID FROM TBLEMP WHERE DEPTID = '" + drpDepartment.SelectedValue + "' ORDER BY EMPNAME ";
            cmd = new MySqlCommand(query, conn);
            da = new MySqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt = new DataTable());
            items.Clear();
            for (int ctr = 0; ctr < dt.Rows.Count; ctr++)
            {
                items.Add(new ListItem(dt.Rows[ctr]["EMPNAME"].ToString(), dt.Rows[ctr]["EMPID"].ToString()));
            }
            drpEMP.Items.Clear();
            drpEMP.Items.AddRange(items.ToArray());
        }

        protected void drpProblem_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpProblem.SelectedValue == "Others")
            {
                txtOtherProb.Style.Add("display", "block");
            }
        }

        

      

      
    }
}