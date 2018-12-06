using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_orderdetail : System.Web.UI.Page
{
    DataProvider dp = new DataProvider();
    public static string id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request["id"];
        datebind(Request["id"]);
        listbind(id);
    }
    public void datebind(string id)
    {
        object[] obj = dp.proc_sel_orderInfo(new string[] { id });
        string[] str = new string[] { "订单编号：", "订单状态：", "订单总金额：", "运费：", "总数量：", "快递单号：", "快递名称：", "收件人姓名：", "收件人地址：", "收件人电话：", "下单时间：" };
        string html = string.Empty;
        for (int i = 0, len = obj.Length; i < len; i++)
        {
            if (i == 1)
            {
                html += "<li>";
                html += "<i class=\"icon-caret-right blue\"></i>";
                html += "<span style='color:red'>"+str[i]+states_cn(obj[i].ToString())+"</span>";
                html += "</li>";
            }
            else
            {
                html += "<li>";
                html += "<i class=\"icon-caret-right blue\"></i>";
                html += str[i] + obj[i].ToString();
                html += "</li>";
            }
        }
        orderDetail.Text = html;

    }
    private string states_cn(string num)
    {
        string res = "订单状态错误";
        switch (num)
        {
            case "0":
                res = "下单未支付";
                break;
            case "1":
                res = "支付未发货";
                break;
            case "2":
                res = "发货未确认";
                break;
            case "3":
                res = "确认未评价";
                break;
            case "4":
                res = "完成";
                break;

        }
        return res;
    }
    private void listbind(string id) {
        DataTable dt = new DataTable();
        dt = dp.C_CommonList("select (select [name] from prdct_info where id =pid) as name,(select [omoney] from prdct_type_info where id =gid) as omoney,money,num,(select [name] from prdct_type_info where id =gid) as kname from ord_child_info where oid=" + id);
        string html = string.Empty;
        if (dt.Rows.Count > 0)
        {
            for (int i = 0, len = dt.Rows.Count; i < len; i++)
            {
                html += "<tr>";
                html += "<td class=\"center\">"+(i+1).ToString()+"</td>";
                html += "<td>";
                html += dt.Rows[i][0].ToString()+"(" + dt.Rows[i][4].ToString() + ")";
                html += "</td>";
                html += "<td class=\"hidden-xs\">"+ dt.Rows[i][1].ToString();
                html += "</td>";
                html += "<td class=\"hidden-480\">" + dt.Rows[i][2].ToString()+"</td>";
                html += "<td>"+ dt.Rows[i][3].ToString() + "</td>";
                html += "</tr>";

            }
        }
        tablelist.Text = html;
    }
    protected void btn_Click(object sender, EventArgs e)
    {

        object[] obj = new object[2];
        obj = dp.proc_uporder(new string[] { id, Request["txt_name"], Request["txt_code"] });
        MessageBox.ReLocation(obj[1].ToString());
    }
}