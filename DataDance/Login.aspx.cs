using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataDance
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            string correo = this.email.Text;
            string password = this.password.Text;

            SqlParameter spcorreo = new SqlParameter("@correo", correo);
            SqlParameter sppass = new SqlParameter("@pass", password);

            DataSet Datos = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_Login", spcorreo, sppass);

            if (Datos.Tables == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
}