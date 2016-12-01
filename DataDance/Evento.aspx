<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Evento.aspx.cs" Inherits="DataDance.Evento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
    <h1>Eventos</h1>
    <div class="col-md-10">
        <%--Inicio Gridview--%>
        <asp:GridView ID="tablaEvento" runat="server" CellSpacing="0" Width="100%" CssClass="display table-bordered" ClientIDMode="Static" OnSelectedIndexChanged="tablaEvento_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:LinkButton runat="server" ID="plus_event" OnClick="plus_event_Click" >
                        <i class="glyphicon glyphicon-plus" style="color:green;"></i>
                    </asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="edit_event" CommandName="Select">
                        <i class="glyphicon glyphicon-pencil" style="color:gray;"></i>
                    </asp:LinkButton>
                 
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        <%--Fin de Gridview--%>
    </div>
        </div>
        <!-- Modal Altas-->
              <div class="modal fade " id="myModal" role="dialog">
                <div class="modal-dialog">    
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>

                      <h4 class="modal-title">Alta</h4>
                    </div>
                    <div class="modal-body">
                      <div class="well login-box">
                             <div class="row form-group" id="row_nombre">                            
                                    <div class="col-md-5">
                                        <asp:Label runat="server"><b>Nombre del Evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="NombreEv" placeHolder="Nombre"   CssClass="form-control"></asp:TextBox>
                                    </div>                                                        
                             </div>   
             
                           
                       <%--   Fin row --%>
                             <div class="row form-group" id="row_tel">              
                                    <div class="col-md-5">
                                        <asp:Label runat="server"><b>Fecha del evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtFechaEv" placeHolder="Fecha Nacimiento" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Label runat="server"><b>Lugar del Evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtlugar" placeHolder="" CssClass="form-control" ></asp:TextBox>
                                    </div>     
                            </div>       
                          
                           <div class="row form-group">
                            <div class="col-md-12">
                                          <asp:Label runat="server"><b>Descripción: </b></asp:Label>
                                          <asp:TextBox runat="server" ID="txtDescripcion" placeHolder="" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                      </div>
                                           </div>  
                       <%--   Fin row --%>
                                   
                    </div>
                   </div>
                    <div class="modal-footer">
                      <asp:Button runat="server" CssClass="btn btn-success" ID="btnAgregar" OnClick="btnAgregar_Click" Text="Guardar"/>
                    </div>
                  </div>      
                </div>
              </div>
              <!-- Modal end -->

      <!-- Modal Cambios y bajas-->
              <div class="modal fade " id="myModal2" role="dialog">
                <div class="modal-dialog">    
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>

                      <h4 class="modal-title">Modificar</h4>
                    </div>
                    <div class="modal-body">
                      <div class="well login-box">
                             <div class="row form-group" >                            
                                    <div class="col-md-5">
                                        <asp:Label runat="server"><b>Nombre del Evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="editNombre" placeHolder="Nombre"   CssClass="form-control"></asp:TextBox>
                                    </div>                                                        
                             </div>   
                       <%--   Fin row --%>
                       
                             <div class="row form-group" >              
                                    <div class="col-md-5">
                                        <asp:Label runat="server"><b>Fecha del evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="editfecha" placeHolder="Fecha Nacimiento" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Label runat="server"><b>Lugar del Evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="editlugar" placeHolder="" CssClass="form-control" ></asp:TextBox>
                                    </div>     
                            </div>                
                       <%--   Fin row --%>
                              <div class="row form-group" >
                                      <div class="col-md-12">
                                          <asp:Label runat="server"><b>Descripción: </b></asp:Label>
                                          <asp:TextBox runat="server" ID="editDescripcion" placeHolder="" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                      </div> 
                            </div> 
                                   
                    </div>
                   </div>
                    <div class="modal-footer">
                      <asp:Button runat="server" CssClass="btn btn-danger" ID="btn_eliminar" OnClick="btn_eliminar_Click" Text="Eliminar"/>
                      <asp:Button runat="server" CssClass="btn btn-success" ID="btn_modificar" OnClick="btn_modificar_Click" Text="Actualizar"/>
                           
                    </div>
                  </div>      
                </div>
              </div>
              <!-- Modal end -->
        <script>
            $(document).ready(function () {
                $("#tablaEvento").dataTable({

                    "scrollX": true
                });


            });
    </script>
</asp:Content>
