using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class ConnectDB
    {
        #region 1. Khai báo các thành viên dữ liệu
        private SqlConnection conn;
        private SqlCommand cmd;
        #endregion //1

        #region 2. Phương thức khởi tạo
        public ConnectDB()
        {
            conn = new SqlConnection("Server=localhost; Database=BookShopDB; Integrated Security = True;");
            conn.Open();
        }
        #endregion //2

        #region 3. Các phương thức thao tác với CSDL

        public DataTable GetDataTable(string select)
        {
            SqlDataAdapter da = new SqlDataAdapter(select, conn);

            DataTable dt = new DataTable();

            da.Fill(dt);

            return dt;
        }

        public void ExecuteSQLInsertOrDelete(string select)
        { 
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = conn;
            cmd1.CommandText = select;
            cmd1.ExecuteReader();
        }

        #endregion //3
    }

}
