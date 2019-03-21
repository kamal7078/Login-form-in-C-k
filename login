using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.OleDb;

namespace my_broject
{
    public partial class Form1 : Form
    {
        OleDbConnection co = new OleDbConnection();
        public Form1()
        {
            InitializeComponent();
             co.ConnectionString=@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\al arabi\Documents\Database1.accdb;Persist Security Info=False;" ;
        }

        private void bulogin_Click(object sender, EventArgs e)
        {


            co.Open();
            OleDbCommand cm = new OleDbCommand();
            cm.Connection = co;
            cm.CommandText = "select * from mybro where Username='" + textBox1.Text + "' and Passwerd= '" + textBox2.Text + "'";
           OleDbDataReader r = cm.ExecuteReader();
           if (r.Read())
           {
               Form2 f2 = new Form2();
               f2.Show();
           }
           else
           {
               MessageBox.Show("error");
           }

            co.Close();
           

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try{
             co.Open();
            test.Text="connection suuessful";
            co.Close();
        }catch(Exception m)
            {
             MessageBox.Show("error");
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {
        
        }

        private void label1_Click(object sender, EventArgs e)
        {
              

        }

        private void buexit_Click(object sender, EventArgs e)
        {
            Form3 k = new Form3();
            k.Show();
        }
    }
}
