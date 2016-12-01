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
    public partial class Vestuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SelectVestuario();
        }

        public void SelectVestuario()
        {
            DataSet vestuario = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_SelectVestuario");
            this.gvVestuario.DataSource = vestuario;
            this.gvVestuario.DataBind();
            gvVestuario.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void gvVestuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#myModalUp').modal('show');</script>", false);
            this.txtNomUP.Text = this.gvVestuario.SelectedRow.Cells[2].Text;
            this.txtDesUP.Text = this.gvVestuario.SelectedRow.Cells[3].Text;
        }

        protected void plus_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#myModal').modal('show');</script>", false);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = this.txtNombre.Text;
            string descripcion = this.txtDescripcion.Text;
            SqlParameter pnom = new SqlParameter("@nombre", nombre);
            SqlParameter pdes = new SqlParameter("@descripcion", descripcion);
            Methods.SQLManager.Ejecutar_Query_Con_Sp("sp_InsertVestuario", pnom, pdes);
            Response.Redirect("Vestuario.aspx");
        }

        protected void eliminar_Click(object sender, EventArgs e)
        {
            string id = this.gvVestuario.SelectedRow.Cells[1].Text;
            SqlParameter pid = new SqlParameter("@id", id);
            Methods.SQLManager.Ejecutar_Query_Con_Sp("sp_deleteVestuario", pid);
            Response.Redirect("Vestuario.aspx");
        }

        protected void actualizar_Click(object sender, EventArgs e)
        {
            string nombre = this.txtNomUP.Text;
            string descripcion = this.txtDesUP.Text;
            SqlParameter pnom = new SqlParameter("@nombre", nombre);
            SqlParameter pdes = new SqlParameter("@descripcion", descripcion);
            SqlParameter pid = new SqlParameter("@ID",  this.gvVestuario.SelectedRow.Cells[1].Text);
            Methods.SQLManager.Ejecutar_Query_Con_Sp("sp_updateVestuario", pnom, pdes, pid);
            Response.Redirect("Vestuario.aspx");
        }
    }
}