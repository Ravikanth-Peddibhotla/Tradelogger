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
        txtsetup.ReadOnly = true;
        if (!IsPostBack)
        {
            getModelDetails();
            int modelid = int.Parse(ddlmodel.SelectedValue);
            if (modelid == 1)
            {
                Fieldshow();
            }
            else if (modelid == 2)
            {
                Fieldshow();
            }
            getdirection();
            ddlindex.Items.Clear();
            ddlindex.DataBind();
            ddlindex.Items.Insert(0, new ListItem("--Select--", "0"));
           
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
                Fieldshow();
                if (modelId == 2)
                {
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
            if (directionid > 0)
            {
                getsetup();
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
            //string connectionString = @"Server=(LocalDB)\MSSQLLocalDB;Database=TradingLogger;User Id=TradeLoggerAdmin;Password=Admin@555;Integrated Security=True;";
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
                    divddlindex.Visible = false;
                }
                else if (modelid == 2)
                {
                    divtxtstockname.Visible = false;
                    divddlindex.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    #endregion method
}