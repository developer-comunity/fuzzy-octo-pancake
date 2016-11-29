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
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SelectUsuario();
            if (!IsPostBack)
            {
                
                DataSet DatosCat = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_ConsultaCat");
                DataSet DatosTipo = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_ConsultaTipo");

                this.catdrop.DataSource = DatosCat;
                this.catdrop.DataValueField = "id_categoria";
                this.catdrop.DataTextField = "Nombre_cat";
                this.catdrop.DataBind();
                this.ddlTipo.DataSource = DatosTipo;
                this.ddlTipo.DataValueField = "id_tipo";
                this.ddlTipo.DataTextField = "Nombre_tipo";
                this.ddlTipo.DataBind();

                this.editcat.DataSource = DatosCat;
                this.editcat.DataValueField = "id_categoria";
                this.editcat.DataTextField = "Nombre_cat";
                this.editcat.DataBind();
                this.edittipo.DataSource = DatosTipo;
                this.edittipo.DataValueField = "id_tipo";
                this.edittipo.DataTextField = "Nombre_tipo";
                this.edittipo.DataBind();
            }
        }

        public void SelectUsuario()
        {
            DataSet Usuario = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_SelectUsuario");
            if (Usuario.Tables.Count > 0) {
            this.tablaUsuario.DataSource = Usuario;
            this.tablaUsuario.DataBind();
            tablaUsuario.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            else
            {
                Response.Write("NO FUNCIONA");
            }
            
        }

        protected void plus_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#myModal').modal('show');</script>", false);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = this.txtNombre.Text;
            string apelld = this.txtAp.Text;
            string correo = this.txtCorreo.Text;
            string telefone = this.txtTel.Text;
            string passw = this.txtPW.Text;
            string tuser = this.ddlTipo.SelectedValue;
            string fecNac = this.txtFechaNa.Text;
            string Cat = this.catdrop.Text;

            SqlParameter pnom = new SqlParameter("@nombre", nombre);
            SqlParameter papel = new SqlParameter("@apellido", apelld);
            SqlParameter pcorreo = new SqlParameter("@correo", correo);
            SqlParameter ptelefono = new SqlParameter("@telefono", telefone);
            SqlParameter ppassw = new SqlParameter("@password", passw);
            SqlParameter ptuser = new SqlParameter("@tipo_u", tuser);
            SqlParameter pfec = new SqlParameter("@fechaNac", fecNac);
            SqlParameter pCat = new SqlParameter("@Cat_id", Cat);
            

            Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_InsertUsuario", pnom, papel, pcorreo, ptelefono, ppassw, ptuser, pfec, pCat);
            Response.Redirect("Usuario.aspx");

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string id = this.tablaUsuario.SelectedRow.Cells[1].Text;

            SqlParameter pid = new SqlParameter("@id", id);

            Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_DelUsuario", pid);
            Response.Redirect("Usuario.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre = this.editnom.Text;
            string apelld = this.editapel.Text;
            string correo = this.editcorreo.Text;
            string telefone = this.edittel.Text;
            string tuser = this.edittipo.SelectedValue;
            string fecNac = this.editfecnac.Text;
            string Cat = this.editcat.SelectedValue;
            string id = this.tablaUsuario.SelectedRow.Cells[1].Text;

            SqlParameter pnom = new SqlParameter("@nombre", nombre);
            SqlParameter papel = new SqlParameter("@apellido", apelld);
            SqlParameter pcorreo = new SqlParameter("@correo", correo);
            SqlParameter ptelefono = new SqlParameter("@telefono", telefone);
            SqlParameter ptuser = new SqlParameter("@tipo_u", tuser);
            SqlParameter pfec = new SqlParameter("@fechaNac", fecNac);
            SqlParameter pCat = new SqlParameter("@Cat_id", Cat);
            SqlParameter pId = new SqlParameter("@id", id);

            Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_ActUsuario", pnom, papel, pcorreo, ptelefono, ptuser, pfec, pCat, pId);
            Response.Redirect("Usuario.aspx");
        }

        protected void tablaUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#myModalUp').modal('show');</script>", false);
            this.editnom.Text = this.tablaUsuario.SelectedRow.Cells[2].Text;
            this.editapel.Text = this.tablaUsuario.SelectedRow.Cells[3].Text;
            this.editfecnac.Text = this.tablaUsuario.SelectedRow.Cells[4].Text;
            this.edittel.Text = this.tablaUsuario.SelectedRow.Cells[5].Text;
            this.editcorreo.Text = this.tablaUsuario.SelectedRow.Cells[6].Text;
            this.edittipo.SelectedIndex = this.edittipo.Items.IndexOf(edittipo.Items.FindByText(this.tablaUsuario.SelectedRow.Cells[7].Text));
            this.editcat.SelectedIndex = this.editcat.Items.IndexOf(editcat.Items.FindByText(this.tablaUsuario.SelectedRow.Cells[8].Text));
        }
    }
}