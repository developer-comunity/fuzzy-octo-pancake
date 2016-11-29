using System;
using System.Collections.Generic;
using System.Data;
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
            DataSet Evento = Methods.SQLManager.Ejecutar_Query_Con_Sp("SP_SelectEvento");
            if (Evento.Tables.Count > 0)
            {
                this.tablaEvento.DataSource = Evento;
                this.tablaEvento.DataBind();
                tablaEvento.HeaderRow.TableSection = TableRowSection.TableHeader;
                
            }
          
        }

        protected void remove_event_Click(object sender, EventArgs e)
        {

        }

        protected void edit_event_Click(object sender, EventArgs e)
        {

        }

        protected void plus_event_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }


        // Funcion de los botones   Modificar y Eliminar
        protected void tablaEvento_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Response.Write("Modificar");
        }
    }
}