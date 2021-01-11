using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Business;

namespace Presentation
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        int dongthem = 0;
        private void btnLietke_Click(object sender, EventArgs e)
        {
            Books book = new Books();
            //MessageBox.Show("Chao");
            comboBox1.DataSource = null;
            comboBox1.Items.Clear();
            DataTable tb=new DataTable ();
            tb.Columns.Add("BookID",typeof(int));
            tb.Columns.Add("BookName",typeof(string));
            tb.Columns.Add("Col3", typeof(string), "BookID + '  ' + BookName");
            for (int i = 0; i <book.CountBook() ; i++)
            {
                book.GetRecord(i);
                tb.Rows.Add(book.Bookid,book.Bookname);
            }
            
            //comboBox1.DataBindings.Add(new Binding("selectedvalue", tb, "BOOKid"));
            comboBox1.DataSource = tb;
            comboBox1.DisplayMember ="Col3";
            comboBox1.ValueMember = "BookID";
            
            dataGridView1.DataSource = book.GetTable();
            dataGridView1.Rows[0].Selected = true;
            //MessageBox.Show(dataGridView1[1,1].Value.ToString());
        }

        private void dataGridView1_UserDeletingRow(object sender, DataGridViewRowCancelEventArgs e)
        {
            DialogResult resut= MessageBox.Show("Bạn muốn xóa thật không?","Nhắc nhở!",MessageBoxButtons.OKCancel);
            if (resut == DialogResult.Cancel)
                e.Cancel = true;
            else
                if (e.Row.Cells[0].Value.ToString() != null)
                {
                    Books book = new Books();
                    book.DeleteRecord(int.Parse(e.Row.Cells[0].Value.ToString()));
                }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dataGridView1.RowCount != 0)
            {
                for (int i = 0; i < dataGridView1.RowCount; i++)
                    if (dataGridView1.Rows[i].Selected == true)
                        dataGridView1.Rows[i].Selected = false;

                for (int i = 0; i < dataGridView1.RowCount-1; i++)
                {
                    if (dataGridView1.Rows[i].Cells[0].Value.ToString() == comboBox1.SelectedValue.ToString())
                        dataGridView1.Rows[i].Selected = true; //chon dong
                        //dataGridView1.Rows[(int)comboBox1.SelectedValue].Cells[0].Selected = true;  //Chon o
                }
            }
        }

        private void dataGridView1_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            dongthem = e.RowIndex;

        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (dongthem != 0)
            {
                if (dataGridView1[0, dongthem - 1].Value!= null)
                {
                    Books b = new Books();
                    b.Bookid = (int)dataGridView1["bookid", dongthem - 1].Value;
                    b.Bookname = dataGridView1["bookname", dongthem - 1].Value.ToString();
                    b.Author = dataGridView1["author", dongthem - 1].Value.ToString();
                    b.Amount = (int)dataGridView1["amount", dongthem - 1].Value;
                    b.Price = (int)dataGridView1["price", dongthem - 1].Value;
                    b.AddRecord();
                    
                }

            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

     }
}
