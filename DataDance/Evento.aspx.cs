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
    public partial class Evento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Carga datos en la Gridview 
            DataSet Evento = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_SelectEvento");
            if (Evento.Tables.Count > 0)
            {
                this.tablaEvento.DataSource = Evento;
                this.tablaEvento.DataBind();
                tablaEvento.HeaderRow.TableSection = TableRowSection.TableHeader;
                
            }

        
          
        }

        

        protected void edit_event_Click(object sender, EventArgs e)
        {

        }

        // Abre el Modal para  Agregar Registros 
        protected void plus_event_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#myModal').modal('show');</script>", false);            
        }

        // Alta de registros 
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            String NombreEvento = this.NombreEv.Text,
                   descripcion  = this.txtDescripcion.Text, 
                   fecha= this.txtFechaEv.Text,
                   Lugar = this.txtlugar.Text;
           

            SqlParameter pnombre = new SqlParameter("@nombre", NombreEvento);
            SqlParameter pdesc = new SqlParameter("@desc", descripcion);
            SqlParameter pfecha = new SqlParameter("@fecha",fecha);
            SqlParameter plugar = new SqlParameter("@lugar", Lugar);

            Methods.SQLManager.Ejecutar_Query_Con_Sp("sp_addEvento", pnombre, pdesc,  pfecha, plugar);


            this.Response.Redirect("Evento.aspx");
        }


        // Seleccionar Row
        protected void tablaEvento_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Llenar textbox
            this.editNombre.Text = this.tablaEvento.SelectedRow.Cells[2].Text;
            this.editDescripcion.Text = this.tablaEvento.SelectedRow.Cells[3].Text;
            this.editfecha.Text = this.tablaEvento.SelectedRow.Cells[4].Text;
            this.editlugar.Text = this.tablaEvento.SelectedRow.Cells[5].Text;
          
        
          
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#myModal2').modal('show');</script>", false);
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(this.tablaEvento.SelectedRow.Cells[1].Text);
            SqlParameter pid = new SqlParameter("@Id", id);

            Methods.SQLManager.Ejecutar_Query_Con_Sp("deleteEvento",  pid);
                     this.Response.Redirect("Evento.aspx");
        }
         // Boton Modificar
        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            //Variables
            String NombreEvento = this.editNombre.Text,
                   descripcion = this.editDescripcion.Text,
                   fecha = this.editfecha.Text,
                   Lugar = this.editlugar.Text;
            int id = Convert.ToInt32(this.tablaEvento.SelectedRow.Cells[1].Text);

            //Parametros
            SqlParameter pid = new SqlParameter("@Id", id);
            SqlParameter pnombre = new SqlParameter("@nombre", NombreEvento);
            SqlParameter pdesc = new SqlParameter("@desc", descripcion);
            SqlParameter pfecha = new SqlParameter("@fecha", fecha);
            SqlParameter plugar = new SqlParameter("@lugar", Lugar);

            // Query
            Methods.SQLManager.Ejecutar_Query_Con_Sp("updateEvento", pnombre, pdesc, pfecha, plugar,pid);


            this.Response.Redirect("Evento.aspx");
        }
    }
}