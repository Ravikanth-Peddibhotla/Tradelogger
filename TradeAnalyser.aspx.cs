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
        if (!IsPostBack)
        {
            getModelDetails();
            //ddlQueryType.Items.Clear();
            //ddlServerType.Items.Clear();
           
        }
    }

    #region Event




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
                ddlmodel.DataValueField = "stockname";
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

    #endregion method
}