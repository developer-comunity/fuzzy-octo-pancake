﻿using System;
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
            this.catdrop.DataSource = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_ConsultaCat");
            this.catdrop.DataValueField = "id_categoria";
            this.catdrop.DataTextField = "Nombre_cat";
            this.catdrop.DataBind();
            this.ddlTipo.DataSource = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_ConsultaTipo");
            this.ddlTipo.DataValueField = "id_tipo";
            this.ddlTipo.DataTextField = "Nombre_tipo";
            this.ddlTipo.DataBind();
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
            string foto = "images/"+this.FotoSelect.FileName;

            SqlParameter pnom = new SqlParameter("@nombre", nombre);
            SqlParameter papel = new SqlParameter("@apellido", apelld);
            SqlParameter pcorreo = new SqlParameter("@correo", correo);
            SqlParameter ptelefono = new SqlParameter("@telefono", telefone);
            SqlParameter ppassw = new SqlParameter("@password", passw);
            SqlParameter ptuser = new SqlParameter("@tipo_u", tuser);
            SqlParameter pfoto = new SqlParameter("@foto", foto);
            SqlParameter pfec = new SqlParameter("@fechaNac", fecNac);
            SqlParameter pCat = new SqlParameter("@Cat_id", Cat);

            Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_InsertUsuario", pnom, papel, pcorreo, ptelefono, ppassw, ptuser, pfoto, pfec, pCat);
            Response.Redirect("Usuario.aspx");

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void tablaUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#myModalUp').modal('show');</script>", false);
            this.editnom.Text = this.tablaUsuario.SelectedRow.Cells[2].Text;

        }
    }
}