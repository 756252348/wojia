using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections;

/// <summary>
/// 数据绑定
/// </summary>
public class DataProvider : DBHelper
{
    //1000操作成功，1001暂无记录，1002记录重复
    /// <summary>
    /// 数据库连接字符串
    /// </summary>
    public static string connectionString
    {
        get
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["webadmin"].ToString();
        }
    }

    #region 通用获取一行数据
    /// <summary>
    /// 获取数据库中指定的一行数据，一定要指定数组长度【字段个数大于2】
    /// </summary>
    /// <param name="comandText">执行SQL语句</param>
    /// <param name="sArray">值数组</param>
    /// <returns>object数组</returns>
    public string C_LoadArrayData(string comandText, ref string json)
    {
        string result = "1001";
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, comandText, null))
        {
            if (mr.Read())
            {
                if (mr.FieldCount == 1)
                {
                    result = mr.GetValue(0).ToString();
                }
                else
                {
                    result = "1000";
                    object[] sArray = new object[mr.FieldCount];
                    mr.GetValues(sArray);
                    json = Common.ToJson(sArray);
                }
            }
            mr.Dispose();
            mr.Close();
            return result;
        }
    }

    /// <summary>
    /// 获取数据库中指定的一行数据，一定要指定数组长度
    /// </summary>
    /// <param name="comandText">执行SQL语句</param>
    /// <param name="data">返回数组</param>
    /// <returns></returns>
    public string C_LoadArrayData(string comandText, ref object[] data)
    {
        string result = "1001";
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, comandText, null))
        {
            if (mr.Read())
            {
                if (mr.FieldCount == 1)
                {
                    result = mr.GetValue(0).ToString();
                }
                else
                {
                    result = "1000";
                    mr.GetValues(data);
                }
            }
            mr.Dispose();
            mr.Close();
            return result;
        }
    }

    /// <summary>
    /// 获取数据库中指定的一行数据，一定要指定数组长度
    /// </summary>
    /// <param name="procedureName">执行SQL语句</param>
    /// <param name="cmdParms">返回数组</param>
    /// <param name="data"></param>
    /// <returns></returns>
    public string C_LoadArrayData(string procedureName, string[] cmdParms, ref object[] data)
    {
        string result = "1001";
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, getParamString(procedureName, cmdParms), null))
        {
            if (mr.Read())
            {
                if (mr.FieldCount == 1)
                {
                    result = mr.GetValue(0).ToString();
                }
                else
                {
                    result = "1000";
                    mr.GetValues(data);
                }
            }
            mr.Dispose();
            mr.Close();
            return result;
        }
    }

    #endregion

    #region 通用获取多行数据
    /// <summary>
    /// 获取数据表(带表结构，可修改)
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public DataTable C_dataList(string sql)
    {
        return ExecuteDataSet(connectionString, CommandType.Text, sql, null).Tables[0];
    }

    /// <summary>
    /// 执行存储过程，返回多行数据
    /// </summary>
    /// <param name="sql">查询语句</param>
    /// <returns></returns>
    public DataTable C_CommonList(string sql)
    {
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, sql, null))
        {
            DataTable dt = new DataTable("dt");

            dt.Load(mr);
            mr.Dispose();
            mr.Close();
            return dt;
        }
    }

    /// <summary>
    /// 执行存储过程，返回多行数据
    /// </summary>
    /// <param name="sql"></param>
    /// <param name="json"></param>
    /// <returns></returns>
    public string C_CommonList(string sql, ref string json)
    {
        string result = "1001";
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, sql, null))
        {
            json = Common.ToJson(mr, ref result);

            mr.Dispose();
            mr.Close();
            return result;
        }
    }

    /// <summary>
    /// 执行存储过程，返回多行数据
    /// </summary>
    /// <param name="procedureName">存储过程名称</param>
    /// <param name="cmdParms">参数数组</param>
    /// <param name="json"></param>
    /// <returns></returns>
    public string C_CommonList(string procedureName, string[] cmdParms, ref string json)
    {
        string result = "1001";
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, getParamString(procedureName, cmdParms), null))
        {

            json = Common.ToJson(mr, ref result);

            mr.Dispose();
            mr.Close();
            return result;
        }
    }

    /// <summary>
    /// 执行存储过程，返回多行数据
    /// </summary>
    /// <param name="procedureName">存储过程名称</param>
    /// <param name="cmdParms">参数数组</param>
    /// <param name="dt"></param>
    /// <returns></returns>
    public string C_CommonList(string procedureName, string[] cmdParms, ref DataTable dt)
    {
        string result = "1001";
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, getParamString(procedureName, cmdParms), null))
        {
            dt.Load(mr);
            if (dt.Rows.Count > 0) result = "1000";
            mr.Dispose();
            mr.Close();
            return result;
        }
    }

    /// <summary>
    /// 执行存储过程，返回多行数据
    /// </summary>
    /// <param name="procedureName">存储过程名称</param>
    /// <param name="cmdParms">参数数组</param>
    /// <param name="list"></param>
    /// <returns></returns>
    public string C_CommonList(string procedureName, string[] cmdParms, ref List<object[]> list)
    {
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, getParamString(procedureName, cmdParms), null))
        {
            bool hasData = false;
            while (mr.Read())
            {
                hasData = true;
                object[] sArray = new object[mr.FieldCount];
                mr.GetValues(sArray);
                list.Add(sArray);
            }
            mr.Dispose();
            mr.Close();
            return hasData ? "1000" : "1001";
        }
    }

    /// <summary>
    /// 执行存储过程，返回多行数据
    /// </summary>
    /// <param name="procedureName">存储过程名称</param>
    /// <param name="cmdParms">参数数组</param>
    /// <param name="list"></param>
    /// <returns></returns>
    public string C_CommonList(string sql, ref List<object[]> list)
    {
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.Text, sql, null))
        {
            bool hasData = false;
            while (mr.Read())
            {
                hasData = true;
                object[] sArray = new object[mr.FieldCount];
                mr.GetValues(sArray);
                list.Add(sArray);
            }
            mr.Dispose();
            mr.Close();
            return hasData ? "1000" : "1001";
        }
    }
    #endregion

    #region 通用获取一个字段
    /// <summary>
    /// 通用数据库操作，返回第一行第一列的值
    /// </summary>
    /// <param name="sqlString">执行SQL语句</param>
    /// <returns></returns>
    public string C_ExecuteScalar(string sql)
    {
        return S_ExecuteScalar(sql);
    }

    /// <summary>
    /// 通用数据库操作，返回第一行第一列的值
    /// </summary>
    /// <param name="porcedureName">存储过程名称</param>
    /// <param name="cmdParms">参数数组</param>
    /// <returns></returns>
    public string G_ExecuteScalar(string porcedureName, string[] cmdParms)
    {
        return S_ExecuteScalar(getParamString(porcedureName, cmdParms));
    }

    /// <summary>
    /// 通用数据库操作，返回第一行第一列的值
    /// </summary>
    /// <param name="porcedureName">存储过程名称</param>
    /// <param name="cmdParms">参数数组</param>
    /// <returns></returns>
    public bool C_ExecuteScalar(string porcedureName, string[] cmdParms)
    {
        return S_ExecuteScalar(getParamString(porcedureName, cmdParms)) == "1";
    }

    /// <summary>
    /// 通用数据库操作，返回第一行第一列的值
    /// </summary>
    /// <param name="sqlString">执行SQL语句</param>
    /// <returns></returns>
    public string S_ExecuteScalar(string sql)
    {
        object result = null;
        result = ExecuteScalar(connectionString, CommandType.Text, sql, null);
        return result == null ? "" : result.ToString();
    }
    #endregion

    #region 通用数据统计
    /// <summary>
    /// 统计数据DECIMAL类型字段的值
    /// </summary>
    /// <param name="sqlstr">查询语句</param>
    /// <returns></returns>
    public decimal C_Proc_Sum_Decimal(string sql)
    {
        decimal result = 0m;
        SqlParameter[] paramter = { 
                                         MakeInParam("@SQL",SqlDbType.NVarChar,500,sql),
                                         MakeOutParam("@DSUM",SqlDbType.Decimal,18)
                                      };
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "C_Proc_Sum_Decimal", paramter))
        {

            result = Common.C_Decimal(paramter[1].Value.ToString());
            mr.Close();
            mr.Dispose();
        }
        return result;
    }

    /// <summary>
    /// 统计数据INT类型字段的值
    /// </summary>
    /// <param name="sqlstr">查询语句</param>
    /// <returns></returns>
    public int C_Proc_Sum_Int(string sql)
    {
        int result = 0;
        SqlParameter[] paramter = { 
                                         MakeInParam("@SQL",SqlDbType.NVarChar,500,sql),
                                         MakeOutParam("@ISUM",SqlDbType.Decimal,18)
                                      };
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "C_Proc_Sum_Int", paramter))
        {

            result = Common.S_Int(paramter[1].Value.ToString());

            mr.Dispose();
            mr.Close();

        }
        return result;
    }

    public int C_Proc_Sum_Int_Instance(string iSumExpression, string tableName, string condition)
    {
        string sql = "";
        if (string.IsNullOrEmpty(condition))
        {
            sql = string.Format("select @ISUM={0} from [{1}] ", iSumExpression, tableName);
        }
        else
        {
            sql = string.Format("select @ISUM={0} from [{1}]  where {2}", iSumExpression, tableName, condition);
        }
        return C_Proc_Sum_Int(sql);
    }

    public decimal C_Proc_Sum_Decimal_Instance(string iSumExpression, string tableName, string condition)
    {
        string sql = "";
        if (!string.IsNullOrEmpty(condition))
        {
            sql = string.Format("select @DSUM={0} from [{1}] ", iSumExpression, tableName);
        }
        else
        {
            sql = string.Format("select @DSUM={0} from [{1}] where {2}", iSumExpression, tableName, condition);
        }
        return C_Proc_Sum_Decimal(sql);
    }
    #endregion

    #region 通用数据分页
    /// <summary>
    /// 通用数据分页
    /// </summary>
    /// <param name="cmdParms">[0]当前页数，[1]每页显示记录数，[2]查询字段,[3]表名，[4]查询条件,[5]排序条件,字段名称加DESC或ASC</param>
    /// <param name="data">[0]数据列表，[1]总记录数，[2]总页数</param>
    /// <returns></returns>
    public string C_Pagination(string[] cmdParms, ref string[] data)
    {
        string result = "";
        SqlParameter[] paramter = { 
                                         MakeInParam("@IntCurrPage",SqlDbType.Int,8,cmdParms[0]),
                                         MakeInParam("@IntPageSize",SqlDbType.Int,8,cmdParms[1]),
                                         MakeInParam("@strFields",SqlDbType.VarChar,1000,cmdParms[2]),
                                         MakeInParam("@strTable",SqlDbType.VarChar,50,cmdParms[3]),
                                         MakeInParam("@strWhere",SqlDbType.VarChar,1000,cmdParms[4]),
                                         MakeInParam("@strOrder",SqlDbType.VarChar,50,cmdParms[5]),
                                         MakeOutParam("@getRecordCounts",SqlDbType.Int,8),
                                         MakeOutParam("@getPageCounts",SqlDbType.Int,8)
                                      };
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "C_Proc_Pagination", paramter))
        {
            data[0] = Common.ToJson(mr, ref result);

            if (result == "1000")
            {
                data[1] = paramter[6].Value.ToString();
                data[2] = paramter[7].Value.ToString();
            }
            mr.Dispose();
            mr.Close();

        }
        return result;
    }

    /// <summary>
    /// 通用数据分页
    /// </summary>
    /// <param name="cmdParms">[0]当前页数，[1]每页显示记录数，[2]查询字段,[3]表名，[4]查询条件,[5]排序条件,字段名称加DESC或ASC</param>
    /// <param name="pageCount">总页数</param>
    /// <param name="recordCount">总记录数</param>
    /// <returns></returns>
    public DataTable C_Pagination(string[] cmdParms, ref string pageCount, ref string recordCount)
    {
        SqlParameter[] paramter = { 
                                         MakeInParam("@IntCurrPage",SqlDbType.Int,8,cmdParms[0]),
                                         MakeInParam("@IntPageSize",SqlDbType.Int,8,cmdParms[1]),
                                         MakeInParam("@strFields",SqlDbType.VarChar,1000,cmdParms[2]),
                                         MakeInParam("@strTable",SqlDbType.VarChar,50,cmdParms[3]),
                                         MakeInParam("@strWhere",SqlDbType.VarChar,1000,cmdParms[4]),
                                         MakeInParam("@strOrder",SqlDbType.VarChar,50,cmdParms[5]),
                                         MakeOutParam("@getRecordCounts",SqlDbType.Int,8),
                                         MakeOutParam("@getPageCounts",SqlDbType.Int,8)
                                      };
        DataTable dt = new DataTable();
        using (SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "C_Proc_Pagination", paramter))
        {

            dt.Load(mr);

            pageCount = paramter[6].Value.ToString();
            recordCount = paramter[7].Value.ToString();

            mr.Dispose();
            mr.Close();

        }
        return dt;
    }
    #endregion

    #region 通用数据更新重复判断
    /// <summary>
    /// 通用数据更新重复判断
    /// </summary>
    /// <param name="cmdParms"></param>
    /// <returns></returns>
    public bool C_Update_IsRepeat(string[] cmdParms)
    {
        return ExecuteScalar(connectionString, CommandType.Text, getParamString("C_Proc_Update_IsRepeat", cmdParms), null).ToString() == "0";
    }
    #endregion

    #region 通用数据库操作
    /// <summary>
    /// 通用数据库操作，返回受影响行数
    /// </summary>
    /// <param name="sql">执行SQL语句</param>
    /// <returns></returns>
    public bool C_Operate(string sql)
    {
        return ExecuteNonQuery(connectionString, CommandType.Text, sql, null) > 0;
    }

    /// <summary>
    /// 通用数据库操作，返回受影响行数
    /// </summary>
    /// <param name="porcedureName">存储过程名称</param>
    /// <param name="cmdParms">执行存储过程</param>
    /// <returns></returns>
    public bool C_Operate(string porcedureName, string[] cmdParms)
    {
        return ExecuteNonQuery(connectionString, CommandType.Text, getParamString(porcedureName, cmdParms), null) > 0;
    }
    #endregion

    #region 通用数据插入重复判断
    /// <summary>
    /// 通用数据插入重复判断,true表示重复，false表示不重复
    /// </summary>
    /// <param name="cmdParms">参数[0]表名，[1]字段名称,[2]字段值</param>
    /// <returns></returns>
    public bool C_Insert_IsRepeat(string[] cmdParms)
    {
        return !(S_ExecuteScalar(getParamString("C_Proc_Insert_IsRepeat", cmdParms)) == "0");
    }
    #endregion

    #region 通用数据库删除
    /// <summary>
    /// 通用数据库操作，返回受影响行数
    /// </summary>
    /// <param name="TableName">表名</param>
    /// <param name="IDs">标识集合</param>
    /// <returns></returns>
    public bool C_Operate_Delete(string TableName, string IDs)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@ITABLENAME",SqlDbType.VarChar,20,TableName),
                                        MakeInParam("@IIDs",SqlDbType.VarChar,100,IDs)
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "S_Proc_Operate_Delete", parameter) > 0;
    }
    public bool C_Operate_NewDelete(string TableName, string IDs)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@ITABLENAME",SqlDbType.VarChar,50,TableName),
                                        MakeInParam("@IIDs",SqlDbType.VarChar,100,IDs)
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "S_Proc_Operate_NewDelete", parameter) > 0;
    }
    #endregion

    #region 管理员登陆
    /// <summary>
    /// 后台管理员登录
    /// </summary>
    /// <param name="data">{string[]} 【0】用户名 【1】密码</param>
    /// <returns>object[]</returns>
    public object[] a_admin_login(ArrayList data)
    {
        object[] dt = new object[3];
        SqlParameter[] parameter = {
                                        MakeInParam("@account",SqlDbType.NVarChar,50,data[0]==""?"":data[0]),//用户名
										MakeInParam("@pwd",SqlDbType.NVarChar,32,data[1]==""?"":data[1])//密码
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "a_admin_login", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion

    #region 权限判断
    /// <summary>
    /// 获取权限列表
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <returns></returns>
    public DataTable GetPromissionList(string RoleID)
    {
        DataTable dt = (DataTable)CacheHelper.GetCache(Common.SessionPrefix +  "PromissionList");
        if (!Common.DataTableIsNull(dt))
        {
            dt = this.C_CommonList("EXEC S_Proc_GetRolePermission " + RoleID);
            CacheHelper.SetCache(Common.SessionPrefix + "PromissionList", dt);
            
            
            CacheHelper.SetCache(Common.SessionPrefix + "ApplicationList", this.C_CommonList("SELECT *  FROM S_Application"));
            
        }
        return dt;
    }

    /// <summary>
    /// 根据应用标识获取应用的名称和标识代码
    /// </summary>
    /// <param name="ApplictionID">应用ID</param>
    /// <returns></returns>
    public string[] GetApplicion(string ApplictionID)
    {
        string[] sArray = new string[2];
        DataTable dt = (DataTable)CacheHelper.GetCache(Common.SessionPrefix + "ApplicationList");
        int len = dt.Rows.Count;
        if (len > 0)
        {
            for (int i = 0; i < len; i++)
            {
                if (dt.Rows[i][0].ToString() == ApplictionID)
                {
                    sArray[0] = dt.Rows[i][1].ToString();
                    sArray[1] = dt.Rows[i][2].ToString();
                    break;
                }
            }
        }
        dt.Dispose();
        return sArray;
    }

    /// <summary>
    /// 获取某模块下的权限
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleID">模块标识</param>
    /// <returns></returns>
    public string GetPromissionApplication(string RoleID, string ModuleID, ref object[] oArray)
    {
        DataTable dt = Common.SelectDataTable( GetPromissionList(RoleID), " ID=" + ModuleID);
        if (Common.DataTableIsNull(dt))
        {
            for (int i = 0, len = dt.Columns.Count; i < len; i++)
            {
                if (i < 5)
                {
                    if (i > 1 && i < 5)
                    {
                        oArray[i - 2] = dt.Rows[0][i].ToString();
                    }
                    continue;
                }
                else
                {
                    break;
                }
            }
            dt.Dispose();
            return "1000";
        }
        dt.Dispose();
        return "1001";
    }

    /// <summary>
    /// 判断当前页面的权限
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleCode">页面名称</param>
    /// <param name="Appcation">操作标识</param>
    /// <returns></returns>
    public bool GetRolePromission(string RoleID, string ModuleID, string Appcation)
    {
        return IsPromission(RoleID, ModuleID, Appcation, null);
    }

    /// <summary>
    /// 判断当前页面的权限（含定位标题）
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleCode">页面名称</param>
    /// <param name="Appcation">操作标识</param>
    /// <returns></returns>
    public bool GetRolePromission(string RoleID, string ModuleID, string Appcation, System.Web.UI.WebControls.Label label)
    {
        return IsPromission(RoleID, ModuleID, Appcation, label) ;
    }

    /// <summary>
    /// 判断当前页面的权限
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleID">模块标识</param>
    /// <param name="Appcation">应用标识</param>
    /// <param name="label">Label控件</param>
    /// <returns></returns>
    public bool IsPromission(string RoleID, string ModuleID, string Appcation, System.Web.UI.WebControls.Label label)
    {
        bool IsPromission = false;
        object[] oArray = new object[3];
        if (this.GetPromissionApplication(RoleID, ModuleID, ref oArray) == "1000")
        {
            string[] sArray = this.GetApplicion(Appcation);
            if (label != null) label.Text = string.Format("<a href=\"DataList.aspx?ID={0}\"><input type=\"hidden\" id=\"ModuleCode\" value=\"{1}\"  data-module=\"{0}\" >{2}</a> >&nbsp;<a href=\"javascript:;\" onclick='window.location.href=window.location.href' title='点击刷新'>{3}</a>", 
                                            ModuleID, oArray[2], oArray[0], sArray[1]);

            string[] _promiss = oArray[1].ToString().Split('|');
            for (int i = 0, len = _promiss.Length; i < len; i++)
            {
                if (_promiss[i] == sArray[0])
                {
                    IsPromission = true;
                    break;
                }
            }
        }
        return IsPromission;
    }

    /// <summary>
    /// 判断当前页面的权限[修改、添加]（含定位标题）
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleCode">页面名称</param>
    /// <param name="id">操作标识</param>
    /// <param name="label"></param>
    public void PromissionOfEdit(string RoleID, string ModuleID, int id, System.Web.UI.WebControls.Label label)
    {
        PromissionOfCommon(RoleID, ModuleID, (id > 0 ? "6" : "4"), label);
    }

    /// <summary>
    /// 通用，判断前用户对指定模块列表是否有权限
    /// </summary>
    /// <param name="context"></param>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleID">模块标识</param>
    /// <param name="Appcation">应用标识</param>
    /// <param name="label">Label控件</param>
    public void PromissionOfCommon(string RoleID, string ModuleID, string Appcation, System.Web.UI.WebControls.Label label)
    {
        Common._Redirect(isPromission(RoleID,ModuleID,Appcation,label) ,ModuleID,Appcation );
    }

    /// <summary>
    /// 判断AJAX页面的权限，并返回权限错误代码
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleID">模块标识</param>
    /// <param name="Appcation">应用标识</param>
    /// <returns></returns>
    public string GetRolePromissionEx(string RoleID, string ModuleID, string Appcation)
    {
        return isPromission(RoleID, ModuleID, Appcation, null);
    }

    /// <summary>
    /// 判断页面权限
    /// </summary>
    /// <param name="RoleID">角色标识</param>
    /// <param name="ModuleID">模块标识</param>
    /// <param name="Appcation">应用标识</param>
    /// <param name="label">Label控件</param>
    /// <returns></returns>
    public string isPromission(string RoleID, string ModuleID, string Appcation, System.Web.UI.WebControls.Label label)
    {
        if (ModuleID == "0")
        {
            return "808";
        }
        else if (!Authority.IsLogin)
        {
            return "505";
        }
        else if (GetRolePromission(RoleID, ModuleID, Appcation, label))
        {
            return "000";
        }
        else
        {
            return "404";
        }
    }


    
    #endregion

    #region 将指定DataTable生成JSON数据
    /// <summary>
    /// 将指定DataTable生成JSON数据
    /// </summary>
    /// <param name="dt">指定数据表[第一列为主键，第二列为父节点标识]</param>
    /// <param name="parentId">父标识</param>
    /// <param name="parentName">父标识字段名</param>
    /// <returns></returns>
    public string dataTableToJSON(DataTable dt, string parentId, string parentName)
    {
        DataTable jsonTable = Common.SelectDataTable(dt, string.Format("{0}='{1}'", parentName, parentId));
        StringBuilder Json = new StringBuilder();
        int len = jsonTable.Rows.Count;
        if (len > 0)
        {
            Json.Append(",\"sub\":[");
            for (int i = 0; i < len; i++)
            {
                Json.Append("{");
                for (int j = 0, len1 = jsonTable.Columns.Count; j < len1; j++)
                {
                    Type type = jsonTable.Rows[i][j].GetType();
                    Json.Append("\"" + "data" + j.ToString() + "\":" + Common.StringFormat(jsonTable.Rows[i][j].ToString(), type));
                    if (j < len1 - 1)
                        Json.Append(",");

                }
                Json.Append(this.dataTableToJSON(dt, jsonTable.Rows[i][0].ToString(), parentName));
                //jsonTable.Rows.RemoveAt(i);
                //len = len - 1;
                Json.Append("}");
                if (i < len - 1)
                    Json.Append(",");

            }
            Json.Append("]");
        }
        jsonTable.Dispose();
        return Json.ToString();
    }

    /// <summary>
    /// 将指定的data生成.JS文件
    /// </summary>
    /// <param name="path">绝对路径</param>
    /// <returns></returns>
    public void dataToFile(string path, WebConfigType configType)
    {
        dataToFile(path,configType,true);
    }

    public void dataToFile(string path, WebConfigType configType ,bool addAsynTitle)
    {
        string json = string.Empty;
        switch (configType)
        {
            case WebConfigType.Module:
                json = dataTableToJSON(C_CommonList("SELECT * FROM S_Module order by M_SortID desc"), "0", "M_ParentID");
                break;
            case WebConfigType.Column:
                json = dataTableToJSON(C_CommonList("SELECT * FROM A_Column order by C_SortID desc"), "0", "C_ParentID");
                break;
        }
        if (!string.IsNullOrEmpty(json))
        {
            if (addAsynTitle)
                json = Common.GetAppSettings("JSONP") + "(" + json.Substring(7) + ")";
            else
                json = json.Substring(7);

            FileUtils.WriteFileEx(path, json);
        }
    }
    #endregion

    #region 系统基本存储过程调用
    //文章表的存储过程调用
    public bool C_EssayOperate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IESSAYID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@ICOLUMNID",SqlDbType.Int,8,cmdParms[1]),
                                        MakeInParam("@ITITLE",SqlDbType.NVarChar,50,cmdParms[2]),
                                        MakeInParam("@ICONTENT",SqlDbType.NVarChar,-1,cmdParms[3]),
                                        MakeInParam("@ISORTID",SqlDbType.Int,8,cmdParms[4]),
                                        MakeInParam("@IISHOW",SqlDbType.Bit,1,cmdParms[5]=="1" ? "True" : "False"),
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "A_Proc_Operate_Essay", parameter) > 0;
    }
    //广告表的存储过程调用
    public  bool C_AdOperate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IADID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@ICOLUMNID",SqlDbType.Int,8,cmdParms[1]),
                                        MakeInParam("@ITITLE",SqlDbType.NVarChar,50,cmdParms[2]),
                                        MakeInParam("@ICONTENT",SqlDbType.NVarChar,-1,cmdParms[3]),
                                        MakeInParam("@ITYPE",SqlDbType.TinyInt,2,cmdParms[4]),
                                        MakeInParam("@IIMG",SqlDbType.VarChar,-1,cmdParms[5]),
                                        MakeInParam("@IISHOW",SqlDbType.Bit,1,cmdParms[6]=="1" ? "True" : "False"),
                                        MakeInParam("@ISORTID",SqlDbType.Int,8,cmdParms[7]),
                                        MakeInParam("@ILINK",SqlDbType.NVarChar,255,cmdParms[8])
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "A_Proc_Operate_Ad", parameter) > 0;
    }
    //新闻表的存储过程调用
    public bool C_ArticleOperate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IARTICLEID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@ICOLUMNID",SqlDbType.Int,8,cmdParms[1]),
                                        MakeInParam("@ITITLE",SqlDbType.NVarChar,50,cmdParms[2]),
                                        MakeInParam("@IABSTRACT",SqlDbType.NVarChar,200,cmdParms[3]),
                                        MakeInParam("@ICONTENT",SqlDbType.NVarChar,-1,cmdParms[4]),
                                        MakeInParam("@IAUTHOR",SqlDbType.NVarChar,20,cmdParms[5]),
                                        MakeInParam("@IKEYWORDS",SqlDbType.NVarChar,50,cmdParms[6]),
                                        MakeInParam("@IISSHOW",SqlDbType.Bit,1,cmdParms[7]=="1" ? "True" : "False"),
                                        MakeInParam("@ILINK",SqlDbType.NVarChar,255,cmdParms[8]),
                                        MakeInParam("@IFILEURL",SqlDbType.NVarChar,255,cmdParms[9]),
                                        MakeInParam("@IIMG",SqlDbType.VarChar,-1,cmdParms[10]),
                                        MakeInParam("@ISORTID",SqlDbType.Int,8,cmdParms[11])
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "A_Proc_Operate_Article", parameter) > 0;
    }
    //友情链接表的存储过程调用
    public bool C_FriendLinkOperate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@ILINKID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@ITITLE",SqlDbType.NVarChar,20,cmdParms[1]),
                                        MakeInParam("@IURL",SqlDbType.NVarChar,255,cmdParms[2]),
                                        MakeInParam("@ISORTID",SqlDbType.Int,8,cmdParms[3]),
                                        MakeInParam("@IIMG",SqlDbType.VarChar,50,cmdParms[4]),
                                        MakeInParam("@IISSHOW",SqlDbType.Bit,1,cmdParms[5]=="1" ? "True" : "False")
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "A_Proc_Operate_FriendLink", parameter) > 0;
    }
    //招聘表的存储过程调用
    public bool C_RecruitmentOperate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IRECRUITMENTID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@IJOBNAME",SqlDbType.NVarChar,50,cmdParms[1]),
                                        MakeInParam("@IDEPARTMENT",SqlDbType.NVarChar,50,cmdParms[2]),
                                        MakeInParam("@INUMBER",SqlDbType.Int,8,cmdParms[3]),
                                        MakeInParam("@ISEX",SqlDbType.NVarChar,50,cmdParms[4]),
                                        MakeInParam("@IAGE",SqlDbType.NVarChar,50,cmdParms[5]),
                                        MakeInParam("@IWORKAREA",SqlDbType.NVarChar,200,cmdParms[6]),
                                        MakeInParam("@IEXPERIENCE",SqlDbType.NVarChar,50,cmdParms[7]),
                                        MakeInParam("@IEDUCATION",SqlDbType.NVarChar,50,cmdParms[8]),
                                        MakeInParam("@IVAILDDATE",SqlDbType.NVarChar,50,cmdParms[9]),
                                        MakeInParam("@ICONTENT",SqlDbType.NVarChar,-1,cmdParms[10]),
                                        MakeInParam("@IISHOW",SqlDbType.Bit,1,cmdParms[11]=="1" ? "True" : "False"),
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "A_Proc_Operate_Recruitment", parameter) > 0;
    }
    //产品表的存储过程调用
    public bool C_ProductOperate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IPRODUCTID",SqlDbType.Int,4,cmdParms[0]),
                                        MakeInParam("@ICOLUMNID",SqlDbType.Int,4,cmdParms[1]),
                                        MakeInParam("@INAME",SqlDbType.NVarChar,50,cmdParms[2]),
                                        MakeInParam("@ICONTENT",SqlDbType.NVarChar,-1,cmdParms[3]),
                                        MakeInParam("@IIMG",SqlDbType.VarChar,-1,cmdParms[4]),
                                        MakeInParam("@ISORTID",SqlDbType.Int,4,cmdParms[5]),
                                        MakeInParam("@IISSHOW",SqlDbType.Bit,1,cmdParms[6]=="1" ? "True" : "False"),
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "A_Proc_Operate_Product", parameter) > 0;
    }
    //管理员表的存储过程调用
    public bool C_Admin_Operate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IADMINID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@IACCOUNT",SqlDbType.NVarChar,20,cmdParms[1]),
                                        MakeInParam("@IPASSWORD",SqlDbType.Char,32,cmdParms[2]),
                                        MakeInParam("@IROLEID",SqlDbType.Int,8,cmdParms[3]),
                                        MakeInParam("@IREALNAME",SqlDbType.NVarChar,20,cmdParms[4]),
                                        MakeInParam("@INICKNAME",SqlDbType.NVarChar,20,cmdParms[5]),
                                        MakeInParam("@IPOSITION",SqlDbType.NVarChar,20,cmdParms[6]),
                                        MakeInParam("@IDEPART",SqlDbType.NVarChar,20,cmdParms[7]),
                                        MakeInParam("@ISTATUS",SqlDbType.TinyInt,2,cmdParms[8]),
                                        MakeInParam("@IDESCRIPTION",SqlDbType.NVarChar,200,cmdParms[9])
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "S_Proc_Operate_Admin", parameter) > 0;
    }
    //角色表的存储过程调用
    public bool C_Role_Operate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@INAME",SqlDbType.NVarChar,20,cmdParms[1]),
                                        MakeInParam("@IDESCRIPTION",SqlDbType.NVarChar,200,cmdParms[2])
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "S_Proc_Operate_Role", parameter) > 0;
    }
    //系统配置表的操作
    public bool C_Config_Operate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@ISITENAME",SqlDbType.NVarChar,50,cmdParms[0]),
                                        MakeInParam("@IICP",SqlDbType.NVarChar,50,cmdParms[1]),
                                        MakeInParam("@IKEYWORDS",SqlDbType.NVarChar,100,cmdParms[2]),
                                        MakeInParam("@ILOGO",SqlDbType.VarChar,50,cmdParms[3]),
                                        MakeInParam("@ITEL",SqlDbType.NVarChar,100,cmdParms[4]),
                                        MakeInParam("@IADDRESS",SqlDbType.NVarChar,200,cmdParms[5])
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "S_Proc_Operate_ConfigInfo", parameter) > 0;
    }
    
    //系统权限表的操作
    public bool C_Application_Operate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@ICODE",SqlDbType.VarChar,20,cmdParms[1]),
                                        MakeInParam("@INAME",SqlDbType.NVarChar,20,cmdParms[2]),
                                        MakeInParam("@ITYPE",SqlDbType.TinyInt,2,cmdParms[3]),
                                        MakeInParam("@IICON",SqlDbType.VarChar,100,cmdParms[4]),
                                        MakeInParam("@IFIELD",SqlDbType.VarChar,200,cmdParms[5]),
                                        MakeInParam("@IDESCRIPTION",SqlDbType.NVarChar,200,cmdParms[6])
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "S_Proc_Operate_Application", parameter) > 0;
    }
    //节点表的操作
    public bool C_Moudle_Operate(string[] cmdParms)
    {
        SqlParameter[] parameter = { 
                                        MakeInParam("@IID",SqlDbType.Int,8,cmdParms[0]),
                                        MakeInParam("@IPARENTID",SqlDbType.Int,8,cmdParms[1]),
                                        MakeInParam("@INAME",SqlDbType.NVarChar,20,cmdParms[2]),
                                        MakeInParam("@ICODE",SqlDbType.NVarChar,20,cmdParms[3]),
                                        MakeInParam("@ILEVEL",SqlDbType.TinyInt,2,cmdParms[4]),
                                        MakeInParam("@IDIRECTORY",SqlDbType.VarChar,100,cmdParms[5]),
                                        MakeInParam("@IISENABLE",SqlDbType.Bit,1,cmdParms[6]=="1" ? "True" : "False"),
                                        MakeInParam("@IISSYSTEM",SqlDbType.Bit,1,cmdParms[7]=="1" ? "True" : "False"),
                                        MakeInParam("@ISORTID",SqlDbType.Int,8,cmdParms[8]),
                                        MakeInParam("@IICON",SqlDbType.VarChar,150,cmdParms[9]),
                                        MakeInParam("@IITEM",SqlDbType.VarChar,150,cmdParms[10]),
                                        MakeInParam("@IDESCRIPTION",SqlDbType.NVarChar,200,cmdParms[11])
                                   };
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "S_Proc_Operate_Moudle", parameter) > 0;
    }

    //栏目类别表
    /// <summary>栏目类别表,</summary>
    /// <param name="data">[0]栏目ID[1]父级栏目ID[2]1栏目类型 0广告、1新闻、2文章、3产品[3]栏目名称[4]栏目等级[5]链接[6]排序编号[7]是否首页推荐[8]描述[9]预留</param>
    /// <returns>[1000]正常</returns>
    public bool A_Proc_Operate_Column(string[] data)
    {
        SqlParameter[] parameter = {
										MakeInParam("@ICOLUMNID",SqlDbType.Int,8,data[0]==""?"0":data[0]),
										MakeInParam("@IPARENTID",SqlDbType.Int,8,data[1]==""?"0":data[1]),
										MakeInParam("@ITYPE",SqlDbType.TinyInt,8,data[2]==""?"0":data[2]),
										MakeInParam("@INAME",SqlDbType.NVarChar,20,data[3]==""?"":data[3]),
										MakeInParam("@ILEVEL",SqlDbType.Int,8,data[4]==""?"0":data[4]),
										MakeInParam("@IURL",SqlDbType.VarChar,255,data[5]==""?"":data[5]),
										MakeInParam("@ISORTID",SqlDbType.Int,8,data[6]==""?"0":data[6]),
										MakeInParam("@ISINDEX",SqlDbType.Bit,1,data[7]=="1"?"True":"False"),
										MakeInParam("@IDESCRIPTION",SqlDbType.NVarChar,500,data[8])
										};
        return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "A_Proc_Operate_Column", parameter) > 0;
    }
    
    /// <summary>
    /// 批量插入权限
    /// </summary>
    /// <param name="dt">数据表</param>
    /// <param name="RoleID">角色标识</param>
    /// <returns></returns>
    public bool OperatePermission(DataTable dt, string RoleID)
    {
        //ExecuteBulkCopy(connectionString, dt, "S_Permission");
        SqlTransaction sqlTran = null;
        try
        {
            using (SqlConnection sqlConnection = new SqlConnection(connectionString))
            {
                sqlConnection.Open();
                using (sqlTran = sqlConnection.BeginTransaction())
                {
                    C_Operate("DELETE FROM S_Permission Where P_RoleID=" + RoleID);

                    using (SqlBulkCopy copy = new SqlBulkCopy(sqlConnection, SqlBulkCopyOptions.Default, sqlTran))
                    {
                        copy.DestinationTableName = "S_Permission";

                        copy.ColumnMappings.Add("ID", "ID");
                        copy.ColumnMappings.Add("P_RoleID", "P_RoleID");
                        copy.ColumnMappings.Add("P_ModuleID", "P_ModuleID");
                        copy.ColumnMappings.Add("P_Code", "P_Code");
                        copy.ColumnMappings.Add("AddDay", "AddDay");
                        copy.ColumnMappings.Add("AddTime", "AddTime");

                        copy.WriteToServer(dt);

                        sqlTran.Commit();
                        sqlConnection.Close();
                        return true;
                    }
                }
            }
        }
        catch
        {
            if (null != sqlTran)
                sqlTran.Rollback();
            return false;
        }
    }
    #endregion

    #region 数据库底层操作
    public bool CreateTable(string TableName, string TableDesc ,string PrimaryKey , string[] Identity  ,string[] FiledName, string[] FiledType , string[] FiledIsNull,string[] DefaultValue ,string[] FiledDesc)
    { 
        string sqlTemp = @"SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[{0}](
{1}
{2}
SET ANSI_PADDING OFF
GO

{3}
                        ";
        string FileList = string.Empty,
               DescList = string.Empty;

        string[] iArray = new string[3];

        DescList = string.Format("EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{0}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'{1}' \nGO\n", TableName, TableDesc);

        for (int i = 0, len = FiledName.Length; i < len; i++)
        {
            iArray = Identity[i].Split('|');

            FileList += string.Format("    [{0}] {1} {2} {3} {4},\n", 
            FiledName[i], 
            FiledType[i], 
            (iArray[0] == "1" ? ("IDENTITY(" + iArray[1] + "," + iArray[2] + ")") : ""), 
            FiledName[i]==PrimaryKey ? "" : (FiledIsNull[i] == "1" ? "NULL" : "NOT NULL"  ), 
            iArray[0] == "1" ? "" : ( !string.IsNullOrEmpty(DefaultValue[i]) ? "DEFAULT(" + DefaultValue[i] + ")" : ""));

            DescList +=  string.Format("EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{0}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'{1}', @level2type=N'COLUMN',@level2name=N'{2}' \nGO\n",
                         FiledDesc[i], TableName, FiledName[i]);
        }

        if (!string.IsNullOrEmpty(PrimaryKey)){
            PrimaryKey = string.Format(@"PRIMARY KEY CLUSTERED 
(
	[{0}] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO", PrimaryKey);
            FileList = FileList.TrimEnd("\n".ToCharArray());
        }
        else 
        {

            FileList = FileList.TrimEnd(",\n".ToCharArray());
            FileList += "\n) ON [PRIMARY]";
            PrimaryKey = "";
        }
            
        try
        {
            return true; //this.C_Operate(string.Format(sqlTemp, TableName, FileList, PrimaryKey, DescList));
        }
        catch
        {
            return false;
        }
    }
    #endregion

   

    #region 模块
    /// <summary>
    /// 查询新闻类别
    /// </summary>
    /// <param name="data">{string[]} 【0】标识</param>
    /// <returns>object[]</returns>
    public object[] sel_news_type_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0])//标识
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "sel_news_type_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 新闻类别添加修改删除
    /// </summary>
    /// <param name="data">{string[]} 【0】标识0增加1修改 【1】父类id 【2】名称 【3】- 1 删除操作</param>
    /// <returns>object[]</returns>
    public object[] proc_news_type_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//标识0增加1修改
										MakeInParam("@parentid",SqlDbType.Int,8,data[1]==""?"0":data[1]),//父类id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),//名称
										MakeInParam("@tag",SqlDbType.Int,8,data[3]==""?"0":data[3])//- 1 删除操作
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_news_type_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 添加修改新闻【0】id 【1】人数 【2】名称 【3】工作地点 【4】内容 【5】创建日期 【6】结束日期 
    /// </summary>
    /// <param name="data">{string[]} 【0】id 【1】人数 【2】名称 【3】工作地点 【4】内容 【5】创建日期 【6】结束日期 </param>
    /// <returns>object[]</returns>
    public object[] proc_news_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//id
										MakeInParam("@nid",SqlDbType.Int,8,data[1]==""?"0":data[1]),//类别id
										MakeInParam("@title",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),//新闻标题
										MakeInParam("@img",SqlDbType.NVarChar,100,data[3]==""?"":data[3]),//图片列表
										MakeInParam("@img_m",SqlDbType.NVarChar,100,data[4]==""?"":data[4]),//移动图片列表
										MakeInParam("@cnt",SqlDbType.NVarChar,-1,data[5]==""?"":data[5]),//内容
										MakeInParam("@dis",SqlDbType.NVarChar,100,data[6]==""?"":data[6]),//描述
										MakeInParam("@link",SqlDbType.NVarChar,100,data[7]==""?"":data[7])//超链
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_news_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 添加修改文章
    /// </summary>
    /// <param name="data">{string[]} 【0】id 【1】类别id 【2】新闻标题 【3】图片列表 【4】移动图片列表 【5】内容 【6】描述 【7】超链</param>
    /// <returns>object[]</returns>
    public object[] proc_article_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//id
										MakeInParam("@navId",SqlDbType.Int,8,data[1]==""?"0":data[1]),//类别id
										MakeInParam("@title",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),//新闻标题
										MakeInParam("@img",SqlDbType.NVarChar,-1,data[3]==""?"":data[3]),//图片列表
					
										MakeInParam("@cnt",SqlDbType.Text,-1,data[4]==""?"":data[4]),//内容
										MakeInParam("@dis",SqlDbType.NVarChar,100,data[5]==""?"":data[5]),//描述
										MakeInParam("@link",SqlDbType.NVarChar,100,data[6]==""?"":data[6])//超链
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_article_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// <Description,,>
    /// </summary>
    /// <param name="data">{string[]} 【0】 【1】 【2】 【3】 【4】 【5】</param>
    /// <returns>object[]</returns>
    public object[] proc_shop_infos(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),
                                        MakeInParam("@province",SqlDbType.NVarChar,50,data[1]==""?"":data[1]),
                                        MakeInParam("@county",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),
                                        MakeInParam("@address",SqlDbType.NVarChar,50,data[3]==""?"":data[3]),
                                        MakeInParam("@title",SqlDbType.NVarChar,50,data[4]==""?"":data[4]),
                                        MakeInParam("@phone",SqlDbType.NVarChar,20,data[5]==""?"":data[5])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_shop_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 添加招聘
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>    
    public object[] proc_advertise_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//id
										MakeInParam("@num",SqlDbType.Int,8,data[1]==""?"0":data[1]),
										MakeInParam("@title",SqlDbType.NVarChar,500,data[2]==""?"":data[2]),
										MakeInParam("@workadder",SqlDbType.NVarChar,100,data[3]==""?"":data[3]),
										MakeInParam("@cnt",SqlDbType.Text,-1,data[4]==""?"":data[4]),//内容
										MakeInParam("@modtime",SqlDbType.DateTime,8,data[5]==""?"":data[5]),//描述
										MakeInParam("@posttime",SqlDbType.DateTime,8,data[6]==""?"":data[6])//超链
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_advertise_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }

    public object[] proc_prdct_type(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[1]==""?"0":data[1]),
                                        MakeInParam("@type",SqlDbType.Int,8,data[2]==""?"0":data[2])

                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_prdct_type ", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 新闻
    /// </summary>
    /// <param name="data">{string[]} 【0】 【1】 【2】 【3】 【4】</param>
    /// <returns>object[]</returns>
    public object[] proc_news_infos(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),
                                        MakeInParam("@type",SqlDbType.Int,8,data[1]==""?"0":data[1]),
                                        MakeInParam("@title",SqlDbType.NVarChar,100,data[2]==""?"":data[2]),
                                        MakeInParam("@content",SqlDbType.Text,-1,data[3]==""?"0":data[3]),
                                        MakeInParam("@img",SqlDbType.NVarChar,1000,data[4]==""?"":data[4]),
                                        MakeInParam("@decsriptor",SqlDbType.NVarChar,200,data[5]==""?"":data[5]),
                                        MakeInParam("@IsHome",SqlDbType.Bit,2,data[6]=="0"?false:true)
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_news_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }

    /// <summary>
    ///  产品
    /// </summary>
    /// <param name="data">{string[]} 【0】 【1】prdctId 【2】 【3】 【4】 【5】 【6】 【7】 【8】 【9】 【10】</param>
    /// <returns>object[]</returns>
    public object[] proc_prdct_infos(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),
                                        MakeInParam("@prdctId",SqlDbType.Int,8,data[1]==""?"0":data[1]),
                                        MakeInParam("@title",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),
                                        MakeInParam("@decsriptor",SqlDbType.NVarChar,200,data[3]==""?"":data[3]),
                                        MakeInParam("@pingpai",SqlDbType.NVarChar,100,data[4]==""?"":data[4]),
                                        MakeInParam("@dingwei",SqlDbType.NVarChar,100,data[5]==""?"":data[5]),
                                        MakeInParam("@fengge",SqlDbType.NVarChar,100,data[6]==""?"":data[6]),
                                        MakeInParam("@yanse",SqlDbType.NVarChar,100,data[7]==""?"":data[7]),
                                        MakeInParam("@kongjian",SqlDbType.NVarChar,100,data[8]==""?"":data[8]),
                                        MakeInParam("@Img",SqlDbType.NVarChar,1000,data[9]==""?"":data[9]),
                                        MakeInParam("@content",SqlDbType.NText,-1,data[10]==""?"0":data[10]),
                                        MakeInParam("@IsHome",SqlDbType.Bit,2,data[11]=="0"?false:true),
                                        MakeInParam("@muzhong",SqlDbType.NVarChar,100,data[12]==""?"0":data[12])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_prdct_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 案例
    /// </summary>
    /// <param name="data">{string[]} 【0】 【1】 【2】 【3】</param>
    /// <returns>object[]</returns>
    public object[] proc_case_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),
                                        MakeInParam("@prdctId",SqlDbType.Int,8,data[1]==""?"0":data[1]),
                                        MakeInParam("@title",SqlDbType.NVarChar,100,data[2]==""?"":data[2]),
                                        MakeInParam("@content",SqlDbType.NText,-1,data[3]==""?"0":data[3]),
                                        MakeInParam("@img",SqlDbType.NVarChar,1000,data[4]==""?"":data[4])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_case_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 留言
    /// </summary>
    /// <param name="data">{string[]} 【0】 【1】 【2】 【3】 【4】</param>
    /// <returns>object[]</returns>
    public object[] proc_MessageUser(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@name",SqlDbType.NVarChar,50,data[0]==""?"":data[0]),
                                        MakeInParam("@phone",SqlDbType.NVarChar,11,data[1]==""?"":data[1]),
                                        MakeInParam("@email",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),
                                        MakeInParam("@addres",SqlDbType.NVarChar,50,data[3]==""?"":data[3]),
                                        MakeInParam("@cnt",SqlDbType.NVarChar,500,data[4]==""?"":data[4])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_MessageUser", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// <Description,,>
    /// </summary>
    /// <param name="data">{string[]} 【0】 【1】 【2】 【3】 【4】</param>
    /// <returns>object[]</returns>
    public object[] proc_Reservation(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@Name",SqlDbType.NVarChar,50,data[0]==""?"":data[0]),
                                        MakeInParam("@Phone",SqlDbType.NVarChar,11,data[1]==""?"":data[1]),
                                        MakeInParam("@province",SqlDbType.NVarChar,20,data[2]==""?"":data[2]),
                                        MakeInParam("@city",SqlDbType.NVarChar,20,data[3]==""?"":data[3]),
                                        MakeInParam("@county",SqlDbType.NVarChar,30,data[4]==""?"":data[4])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_Reservation", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    public object[] proc_addshop(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@name",SqlDbType.NVarChar,50,data[0]==""?"":data[0]),
                                        MakeInParam("@phone",SqlDbType.NVarChar,11,data[1]==""?"":data[1]),
                                        MakeInParam("@email",SqlDbType.NVarChar,20,data[2]==""?"":data[2]),
                                        MakeInParam("@addres",SqlDbType.NVarChar,20,data[3]==""?"":data[3]),
                                        MakeInParam("@cnt",SqlDbType.NVarChar,30,data[4]==""?"":data[4]),
                                              MakeInParam("@qq",SqlDbType.NVarChar,30,data[5]==""?"":data[5])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_addshop", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    
    /// <summary>
    /// <添加修改Article,,>
    /// </summary>
    /// <param name="data">{string[]} 【0】类别id 【1】标题 【2】图片列表 【3】内容 【4】描述 【5】超链</param>
    /// <returns>DataSet</returns>
    /// <summary>
    /// <添加修改Article,,>
    /// </summary>
    /// <param name="data">{string[]} 【0】类别id 【1】标题 【2】图片列表 【3】内容 【4】描述 【5】超链</param>
    /// <returns>object[]</returns>
    public object[] proc_article_infos(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@navId",SqlDbType.Int,8,data[0]==""?"0":data[0]),//类别id
										MakeInParam("@title",SqlDbType.NVarChar,300,data[1]==""?"":data[1]),//标题
										MakeInParam("@img",SqlDbType.NVarChar,-1,data[2]==""?"":data[2]),//图片列表
										MakeInParam("@cnt",SqlDbType.Text,-1,data[3]==""?"0":data[3]),//内容
										MakeInParam("@dis",SqlDbType.NVarChar,100,data[4]==""?"":data[4]),//描述
										MakeInParam("@link",SqlDbType.NVarChar,100,data[5]==""?"":data[5])//超链
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_article_infos", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion

    #region 商品模块
    /// <summary>
    /// 商品类别添加修改删除
    /// </summary>
    /// <param name="data">{string[]} 【0】标识0增加1修改 【1】父类id 【2】名称 【3】1删除操作</param>
    /// <returns>object[]</returns>
    public object[] proc_type_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//标识0增加1修改
										MakeInParam("@parentid",SqlDbType.Int,8,data[1]==""?"0":data[1]),//父类id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),//名称
										MakeInParam("@tag",SqlDbType.Int,8,data[3]==""?"0":data[3])//1删除操作
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_type_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 修改添加商品信息
    /// </summary>
    /// <param name="data">{string[]} 【0】id 【1】店铺id 【2】商品名称 【3】商品类别id 【4】图片列表 【5】移动图片列表 【6】pc banner 【7】app banner 【8】详情 【9】摘要 【10】品牌 【11】是否上架 0否1是 【12】推荐到首页 0否1是【13】标题【14】甜度【15】标签</param>
    /// <returns>object[]</returns>
    public object[] proc_prdct_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//id
										MakeInParam("@did",SqlDbType.Int,8,data[1]==""?"0":data[1]),//店铺id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),//商品名称
										MakeInParam("@tid",SqlDbType.Int,8,data[3]==""?"0":data[3]),//商品类别id
										MakeInParam("@img",SqlDbType.NVarChar,100,data[4]==""?"":data[4]),//图片列表
										MakeInParam("@img_m",SqlDbType.NVarChar,100,data[5]==""?"":data[5]),//移动图片列表
										MakeInParam("@imgpc",SqlDbType.NVarChar,100,data[6]==""?"":data[6]),//pc banner
										MakeInParam("@imgapp",SqlDbType.NVarChar,100,data[7]==""?"":data[7]),//app banner
										MakeInParam("@cnt",SqlDbType.NVarChar,-1,data[8]==""?"":data[8]),//详情
										MakeInParam("@intro",SqlDbType.NVarChar,100,data[9]==""?"":data[9]),//摘要
										MakeInParam("@brand",SqlDbType.NVarChar,50,data[10]==""?"":data[10]),//品牌
										MakeInParam("@isup",SqlDbType.Int,8,data[11]==""?"0":data[11]),//是否上架 0否1是
										MakeInParam("@istop",SqlDbType.Int,8,data[12]==""?"0":data[12]),//推荐到首页 0否1是
                                        MakeInParam("@title",SqlDbType.NVarChar,50,data[13]==""?"0":data[13]),//标题
										MakeInParam("@sweet",SqlDbType.Int,8,data[14]==""?"0":data[14]),//甜度
                                        MakeInParam("@lid",SqlDbType.NVarChar,100,data[15]==""?"0":data[15]),//甜度
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_prdct_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 商品标签id
    /// </summary>
    /// <param name="data">{string[]} 【0】标识id 【1】 【2】</param>
    /// <returns>object[]</returns>
    public object[] proc_lable_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//标识id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[1]==""?"":data[1]),
                                        MakeInParam("@tag",SqlDbType.Int,8,data[2]==""?"0":data[2])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_lable_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }

    /// <summary>
    /// 添加/修改规格
    /// </summary>
    /// <param name="data">{string[]} 【0】标识 【1】商品id 【2】规格名称 【3】原价 【4】现价 【5】库存</param>
    /// <returns>object[]</returns>
    public object[] proc_prdct_type_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//标识
										MakeInParam("@pid",SqlDbType.Int,8,data[1]==""?"0":data[1]),//商品id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),//规格名称
										MakeInParam("@omoney",SqlDbType.Decimal,8,data[3]==""?"0":data[3]),//原价
										MakeInParam("@nmoney",SqlDbType.Decimal,8,data[4]==""?"0":data[4]),//现价
										MakeInParam("@num",SqlDbType.Int,8,data[5]==""?"0":data[5])//库存
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_prdct_type_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion

    #region 导航模块
    /// <summary>
    /// <Description>
    /// </summary>
    /// <param name="data">{string[]} 【0】标识0增加1修改 【1】父类id 【2】名称 【3】图标 【4】链接 【5】1删除操作</param>
    /// <returns>object[]</returns>
    public object[] proc_nav_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//标识0增加1修改
										MakeInParam("@parentid",SqlDbType.Int,8,data[1]==""?"0":data[1]),//父类id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[2]==""?"":data[2]),//名称
										MakeInParam("@img",SqlDbType.NVarChar,50,data[3]==""?"":data[3]),//图标
										MakeInParam("@url",SqlDbType.NVarChar,50,data[4]==""?"":data[4]),//链接
										MakeInParam("@tag",SqlDbType.Int,8,data[5]==""?"0":data[5])//1删除操作
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_nav_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion

    #region 店铺模块
    /// <summary>
    /// 添加修改店铺
    /// </summary>
    /// <param name="data">{string[]} 【0】id 【1】店铺名称 【2】图片列表 【3】移动图片列表 【4】店铺简介 【5】店铺地址 【6】经度 【7】纬度</param>
    /// <returns>object[]</returns>
    public object[] proc_shop_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//id
										MakeInParam("@name",SqlDbType.NVarChar,50,data[1]==""?"":data[1]),//店铺名称
										MakeInParam("@img",SqlDbType.NVarChar,100,data[2]==""?"":data[2]),//图片列表
										MakeInParam("@img_m",SqlDbType.NVarChar,100,data[3]==""?"":data[3]),//移动图片列表
										MakeInParam("@intro",SqlDbType.NVarChar,100,data[4]==""?"":data[4]),//店铺简介
										MakeInParam("@address",SqlDbType.NVarChar,50,data[5]==""?"":data[5]),//店铺地址
										MakeInParam("@lng",SqlDbType.NVarChar,50,data[6]==""?"":data[6]),//经度
										MakeInParam("@lat",SqlDbType.NVarChar,50,data[7]==""?"":data[7])//纬度
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_shop_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    /// <summary>
    /// 查询店铺id
    /// </summary>
    /// <param name="data">{string[]} 【0】标识</param>
    /// <returns>object[]</returns>
    public object[] proc_sel_shop_info(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0])//标识
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_sel_shop_info", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion
    #region 通用查询
    /// <summary>
    /// 通用查询
    /// </summary>
    /// <param name="data">{string[]} 【0】查询类型 【1】查询条件</param>
    /// <returns>object[]</returns>
    public object[] c_proc_select(string[] data,int i)
    {
        object[] dt = new object[i];
        SqlParameter[] parameter = {
                                        MakeInParam("@icode",SqlDbType.Int,8,data[0]==""?"0":data[0]),//查询类型
										MakeInParam("@where",SqlDbType.NVarChar,50,data[1]==""?"":data[1])//查询条件
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "c_proc_select", parameter);
       
        if (mr.Read())
        {
            mr.GetValues(dt);
        }
        else
        {
            dt = null;
        }
       
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion
    #region 通用删除
    /// <summary>
    /// 通用查询
    /// </summary>
    /// <param name="data">{string[]} 【0】查询类型 【1】查询条件</param>
    /// <returns>object[]</returns>
    public object[] c_proc_delete(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@icode",SqlDbType.Int,8,data[0]==""?"0":data[0]),//查询类型
										MakeInParam("@where",SqlDbType.NVarChar,50,data[1]==""?"":data[1])//查询条件
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "c_proc_delete", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion
    #region  订单详情
    /// <summary>
    /// <后台查询订单详情--主表,,>
    /// </summary>
    /// <param name="data">{string[]} 【0】</param>
    /// <returns>object[]</returns>
    public object[] proc_sel_orderInfo(string[] data)
    {
        object[] dt = new object[11];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0])
                                        };
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_sel_orderInfo", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion
   
    #region  发货
    /// <summary>
    /// <订单发货>
    /// </summary>
    /// <param name="data">{string[]} 【0】订单id 【1】快递名称 【2】快递单号</param>
    /// <returns>object[]</returns>
    public object[] proc_uporder(string[] data)
    {
        object[] dt = new object[2];
        SqlParameter[] parameter = {
                                        MakeInParam("@id",SqlDbType.Int,8,data[0]==""?"0":data[0]),//订单id
										MakeInParam("@deiname",SqlDbType.NVarChar,50,data[1]==""?"":data[1]),//快递名称
										MakeInParam("@deino",SqlDbType.NVarChar,50,data[2]==""?"":data[2])//快递单号
										};
        SqlDataReader mr = ExecuteReader(connectionString, CommandType.StoredProcedure, "proc_uporder", parameter);
        mr.Read();
        mr.GetValues(dt);
        mr.Dispose();
        mr.Close();
        return dt;
    }
    #endregion
    public enum WebConfigType
    {
        Column,

        Application,

        Module
    }

}
