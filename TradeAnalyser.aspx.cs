﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class TradeAnalyser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        divtxtstockname.Visible = false;
        divddlindex.Visible = false;
        divqty.Visible = false;
        divlots.Visible = false;
        txtsetup.ReadOnly = true;
        txtindicator.ReadOnly = true;
        if (!IsPostBack)
        {
            getModelDetails();
            //Fieldshow();
            /*int modelid = int.Parse(ddlmodel.SelectedValue);
            if (modelid == 1)
            {
                Fieldshow();
            }
            else if (modelid == 2)
            {
                Fieldshow();
            }*/

            Fieldshow();
            getdirection();
            int directionid = int.Parse(ddldirection.SelectedValue);
            int setupid = (directionid > 0) && (directionid == 1) || (directionid == 2) ? 1 : (directionid > 0) && (directionid == 3) || (directionid == 4) ? 2 : 3;
            gettradesetup(directionid,setupid);
            ddlindex.Items.Clear();
            ddlindex.DataBind();
            ddlindex.Items.Insert(0, new ListItem("--Select--", "0"));
            ddltradesetup.Items.Clear();
            ddltradesetup.DataBind();
            ddltradesetup.Items.Insert(0, new ListItem("--Select--", "0"));         
        }
    }

    #region Event

    protected void ddlSelectedModel(object sender, EventArgs e)
    {
        try
        {
            int modelId = int.Parse(ddlmodel.SelectedValue);
            if (modelId > 0)
            {
                if (modelId == 1)
                {
                    divtxtstockname.Visible = true;
                }
                
                if (modelId == 2)
                {
                    divddlindex.Visible = true;
                    ddlindex.Focus();
                    getindexDetails();
                }
            }
            else
            {
                ddlindex.Items.Clear();
                ddlindex.DataBind();
                ddlindex.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    protected void ddlSelectedsetup(object sender, EventArgs e)
    {
        try
        {
            int directionid = int.Parse(ddldirection.SelectedValue);
            int setupid = (directionid > 0) && (directionid == 1) || (directionid == 2) ? 1 : (directionid > 0) && (directionid == 3) || (directionid == 4) ? 2 : 3;
            if (directionid > 0)
            {
                getsetup();
                gettradesetup(directionid, setupid);
            }
            else
            {
                //Error
            }
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    protected void ddlSelectedtradesetup(object sender, EventArgs e)
    {
        try
        {
            int tradesetupid = int.Parse(ddltradesetup.SelectedValue);
            if (tradesetupid > 0)
            {
                getindicator(tradesetupid);
            }
            else
            {
                //Error
            }
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    protected void resetAll(object sender, EventArgs e)
    {
        try
        {
            int modelId = int.Parse(ddlmodel.SelectedValue);
            Response.Redirect("TradeAnalyser.aspx?modelId=" + modelId, false);
        }
        catch (Exception ex)
        {
            //CustomException _expCustom3 = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }


    protected void finalSubmit(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }



    #endregion Event

    #region method

    public void getModelDetails()
    {
        try
        {
            DataTable dt = new DataTable();
            string sql = "select stockid,stockname from TradingLogger.dbo.stock";
            //string connectionString = @"Server=(LocalDB)\MSSQLLocalDB;Database=TradingLogger;User Id=TradeLoggerAdmin;Password=Admin@555;Integrated Security=True;";
            string connectionString = Convert.ToString(ConfigurationManager.ConnectionStrings["sqlServer"].ConnectionString);
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            conn.Close();
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlmodel.DataTextField = "stockname";
                ddlmodel.DataValueField = "stockid";
                ddlmodel.DataSource = dt;
                ddlmodel.DataBind();
                ddlmodel.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlmodel.DataBind();
                ddlmodel.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    public void getindexDetails()
    {
        try
        {
            DataTable dt = new DataTable();
            string sql = "select indexid,indexname from TradingLogger.dbo.indexname";
            string connectionString = Convert.ToString(ConfigurationManager.ConnectionStrings["sqlServer"].ConnectionString);
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            conn.Close();
            if (dt != null && dt.Rows.Count > 0)
            {
                
                ddlindex.DataTextField = "indexname";
                ddlindex.DataValueField = "indexid";
                ddlindex.DataSource = dt;
                ddlindex.DataBind();
                ddlindex.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlindex.DataBind();
                ddlindex.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    public void getdirection()
    {
        try
        {
            DataTable dt = new DataTable();
            string sql = "select directionid,directionname from TradingLogger.dbo.direction";
            string connectionString = Convert.ToString(ConfigurationManager.ConnectionStrings["sqlServer"].ConnectionString);
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            conn.Close();
            if (dt != null && dt.Rows.Count > 0)
            {

                ddldirection.DataTextField = "directionname";
                ddldirection.DataValueField = "directionid";
                ddldirection.DataSource = dt;
                ddldirection.DataBind();
                ddldirection.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddldirection.DataBind();
                ddldirection.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    public void getsetup()
    {
        try
        {
            int directionid = int.Parse(ddldirection.SelectedValue);
            string sql = "";
            DataTable dt = new DataTable();
            if (directionid == 1 || directionid == 2)
            {
                sql = "select top 1 setupid,setupname from TradingLogger.dbo.setup where setupid = 1";
            }
            else if (directionid == 3 || directionid == 4)
            {
                sql = "select top 1 setupid,setupname from TradingLogger.dbo.setup where setupid = 2";
            }
            else if (directionid == 5 || directionid == 6)
            {
                sql = "select top 1 setupid,setupname from TradingLogger.dbo.setup where setupid = 3";
            }
            string connectionString = Convert.ToString(ConfigurationManager.ConnectionStrings["sqlServer"].ConnectionString);
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                string setup = rdr["setupname"].ToString();
                txtsetup.Text = setup;
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    public void gettradesetup(int directionid, int setupid)
    {
        try
        {
            string sql = "";
            DataTable dt = new DataTable();
            sql = "select tradesetupid,tradesetupname from TradingLogger.dbo.tradesetup where setupid = " + setupid + " and directionid =" + directionid;
            string connectionString = Convert.ToString(ConfigurationManager.ConnectionStrings["sqlServer"].ConnectionString);
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            conn.Close();
            if (dt != null && dt.Rows.Count > 0)
            {

                ddltradesetup.DataTextField = "tradesetupname";
                ddltradesetup.DataValueField = "tradesetupid";
                ddltradesetup.DataSource = dt;
                ddltradesetup.DataBind();
                ddltradesetup.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddltradesetup.DataBind();
                ddltradesetup.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    public void getindicator(int tradesetupid)
    {
        try
        {
            string sql = "";
            DataTable dt = new DataTable();
            sql = "select Indicatorid,Indicatorname from TradingLogger.dbo.Indicator where tradesetupid = " + tradesetupid;
            string connectionString = Convert.ToString(ConfigurationManager.ConnectionStrings["sqlServer"].ConnectionString);
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                string indicator = rdr["Indicatorname"].ToString();
                txtindicator.Text = indicator;
            }
            conn.Close();

        }
        catch (Exception ex)
        {
            //CustomException _expCustom = new CustomException(ex.Message, CustomException.WhoCallsMe(), ExceptionSeverityLevel.Critical, ex, true);
            throw ex;
        }
    }

    public void Fieldshow()
    {
        try
        {
            int modelid = int.Parse(ddlmodel.SelectedValue);
            if (modelid > 0)
            {
                if (modelid == 1)
                {
                    divtxtstockname.Visible = true;
                    divqty.Visible = true;
                    //divddlindex.Visible = false;
                }
                else if (modelid == 2)
                {
                    //divtxtstockname.Visible = false;
                    divddlindex.Visible = true;
                    divlots.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvRequestDetails.PageIndex = e.NewPageIndex;
    }

    #endregion method
}