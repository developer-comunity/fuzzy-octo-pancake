<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="DataDance.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1>Usuario</h1>
    <div class="col-md-10">
        <asp:GridView ID="tablaUsuario" runat="server" CellSpacing="0" Width="100%" CssClass="display table-bordered" ClientIDMode="Static" OnSelectedIndexChanged="tablaUsuario_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:LinkButton runat="server" ID="plus" OnClick="plus_Click">
                        <i class="glyphicon glyphicon-plus" style="color:green;"></i>
                    </asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="pencil" CommandName="Select">
                        <i class="glyphicon glyphicon-pencil" style="color:gray;"></i>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
        </div>
    <!-- Modal add -->
              <div class="modal fade " id="myModal" role="dialog">
                <div class="modal-dialog">    
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>

                      <h4 class="modal-title">Agregar Usuario</h4>
                    </div>
                    <div class="modal-body">
                      <div class="well login-box">
                             <div class="row form-group" id="row_nombre">                            
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Nombre:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtNombre" placeHolder="Nombre"   CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Apellidos:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtAp" placeHolder="Apellidos" CssClass="form-control"></asp:TextBox>
                                    </div>
                                                                                                  
                             </div>   
                             <div class="row form-group" id="row_nombre1">
                                      <div class="col-md-4">
                                          <asp:Label runat="server"><b>Contraseña:</b></asp:Label>
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
                                        <asp:Label runat="server"><b>Fecha de Nacimiento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtFechaNa" placeHolder="Fecha Nacimiento" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Correo:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtCorreo" placeHolder="Correo Electronico" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                          <asp:Label runat="server"><b>Categoría:</b></asp:Label>
                                          <asp:DropDownList runat="server" ID="catdrop" CssClass="form-control"><asp:ListItem>Categoría...</asp:ListItem></asp:DropDownList>
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
    <!-- Modal update-->
              <div class="modal fade " id="myModalUp" role="dialog">
                <div class="modal-dialog">    
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>

                      <h4 class="modal-title">Editar Usuario</h4>
                    </div>
                    <div class="modal-body">
                      <div class="well login-box">
                             <div class="row form-group" id="row_nombreup">                            
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Nombre:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="editnom" placeHolder="Nombre"   CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Apellidos:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="editapel" placeHolder="Apellidos" CssClass="form-control"></asp:TextBox>
                                    </div>
                                                                                                  
                             </div>   
                             <div class="row form-group" id="row_nombre1up">
                                      <div class="col-md-4">
                                          <asp:Label runat="server"><b>Tipo Usuario:</b></asp:Label>
                                          <asp:DropDownList runat="server" ID="edittipo" CssClass="form-control"><asp:ListItem>Tipo de usuario...</asp:ListItem></asp:DropDownList>
                                      </div>
                                      <div class="col-md-4">
                                          <asp:Label runat="server"><b>Telefono:</b></asp:Label>
                                          <asp:TextBox runat="server" ID="edittel" placeHolder="Telefono" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                      </div>
                                     
                            </div> 
                            <div class="row form-group" id="row_telup">              
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Fecha de Nacimiento:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="editfecnac" placeHolder="Fecha Nacimiento" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Correo:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="editcorreo" placeHolder="Correo Electronico" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                          <asp:Label runat="server"><b>Categoría:</b></asp:Label>
                                          <asp:DropDownList runat="server" ID="editcat" CssClass="form-control"><asp:ListItem>Categoría...</asp:ListItem></asp:DropDownList>
                                      </div>                
                            </div>                      
                    </div>
                   </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" CssClass="btn btn-danger" ID="Button2" OnClick="Button2_Click" Text="Eliminar"/>
                      <asp:Button runat="server" CssClass="btn btn-info" ID="Button1" OnClick="Button1_Click" Text="Actualizar"/>
                    </div>
                  </div>      
                </div>
              </div>
              <!-- Modal end -->

    <script>
        $(document).ready(function () {
            $("#tablaUsuario").dataTable({

                "scrollX": true
            });
        });
    </script>
</asp:Content>
