<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Evento.aspx.cs" Inherits="DataDance.Evento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
    <h1>Eventos</h1>
    <div class="col-md-10">
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
                    <asp:LinkButton runat="server" ID="remove_event" CommandName="Select">
                        <i class="glyphicon glyphicon-remove" style="color:red;"></i>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
        </div>
        <!-- Modal add and update-->
              <div class="modal fade " id="myModal" role="dialog">
                <div class="modal-dialog">    
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>

                      <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                      <div class="well login-box">
                             <div class="row form-group" id="row_nombre">                            
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Nombre del Evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="NombreEv" placeHolder="Nombre"   CssClass="form-control"></asp:TextBox>
                                    </div>
                                    
                                                                                                  
                             </div>   
                             <div class="row form-group" id="row_nombre1">
                                      <div class="col-md-4">
                                          <asp:Label runat="server"><b>Descripción: </b></asp:Label>
                                          <asp:TextBox runat="server" ID="txtPW" placeHolder="Contraseña" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                      </div>
                                      <div class="col-md-4">
                                          <asp:Label runat="server"><b>Tipo Usuario:</b></asp:Label>
                                          <asp:DropDownList runat="server" ID="ddlTipo" CssClass="form-control"><asp:ListItem>Tipo de usuario...</asp:ListItem></asp:DropDownList>
                                      </div>
                                      <div class="col-md-4">
                                          <asp:Label runat="server"><b>Telefono:</b></asp:Label>
                                          <asp:TextBox runat="server" ID="txtTel" placeHolder="Telefono" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                      </div>
                                     
                            </div> 
                            <div class="row form-group" id="row_tel">              
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Fecha del evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtFechaEv" placeHolder="Fecha Nacimiento" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Lugar del Evento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="" placeHolder="Correo Electronico" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>     
                            </div>                         
                    </div>
                   </div>
                    <div class="modal-footer">
                      <asp:Button runat="server" CssClass="btn btn-success" ID="btnAgregar" OnClick="btnAgregar_Click" Text="Guardar"/>
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
