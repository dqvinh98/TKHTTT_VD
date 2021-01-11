using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataLayer;

namespace Business
{
    public class Books
    {
        #region 1. Khai báo các thành viên dữ liệu
        private int _bookid;

        public int Bookid
        {
            get { return _bookid; }
            set { _bookid = value; }
        }
        private string _bookname;

        public string Bookname
        {
            get { return _bookname; }
            set { _bookname = value; }
        }
        private string _author;

        public string Author
        {
            get { return _author; }
            set { _author = value; }
        }
        private int _amount;

        public int Amount
        {
            get { return _amount; }
            set { _amount = value; }
        }
        private int _price;

        public int Price
        {
            get { return _price; }
            set { _price = value; }
        }

        #endregion //1

        #region 2. Các phương thức khởi tạo
        public Books()  //Phuong thuc khoi tao, khi tao doi tuong la chay phuong thuc nay ngay
        {
            Bookid = 0;
            Bookname = "";
            Author = "";
            Amount = 0;
            Price = 0;
            ReadTable(); // doc de co dt
        }
        #endregion //2
        
        #region 3. Các phương thức thao tác với CSDL
        private ConnectDB cn = new ConnectDB();
        private DataTable dt = new DataTable();

        private void ReadTable()
        {
            dt = cn.GetDataTable("select * from books");
        }

        public int CountBook()
        { 
            return dt.Rows.Count;
        }

        public void GetRecord(int i)
        {
            Bookid=int.Parse(dt.Rows[i]["bookid"].ToString());
            Bookname=dt.Rows[i]["bookname"].ToString();
            Author=dt.Rows[i]["author"].ToString();
            Amount=int.Parse(dt.Rows[i]["amount"].ToString());
            Price=int.Parse(dt.Rows[i]["price"].ToString());
        }

        public DataTable GetTable()
        {
            return dt;
        }

        public void AddRecord()
        {
            string Caulenh = null;
            Caulenh = "INSERT INTO BOOKS VALUES (" + Bookid + ", N'" + Bookname + "', N'" + Author + "', " + Amount + ", " + Price + ")";
            //MessageBox.Show(Caulenh);
            cn.ExecuteSQLInsertOrDelete(Caulenh);
        }

        public void DeleteRecord(int Masach)
        {
            string Caulenh=null;
            Caulenh= "DELETE FROM BOOKS WHERE BOOKID=" + Masach.ToString();
            //MessageBox.Show(Caulenh);
            cn.ExecuteSQLInsertOrDelete(Caulenh);
        }

        public void UpdateRecord(int Masach)
        {
            string Caulenh = null;
            Caulenh = "UPDATE BOOKS SET BookID=" + Bookid + ", BookName=" + Bookname + ", Author=" + Author + ", Amount=" +Amount+ ", Price=" + Price +" WHERE BOOKID=" + Masach.ToString();
            //MessageBox.Show(Caulenh);
            cn.ExecuteSQLInsertOrDelete(Caulenh);
        }

        #endregion //3
    }

}

