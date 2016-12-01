<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Vestuario.aspx.cs" Inherits="DataDance.Vestuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Vestuario</h1>
        <div class="col-md-10">
            <asp:GridView ID="gvVestuario" runat="server" CellSpacing="0" Width="100%" CssClass="display table-bordered" ClientIDMode="Static" OnSelectedIndexChanged="gvVestuario_SelectedIndexChanged">
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
                                 <div class="col-md-8">
                                        <asp:Label runat="server"><b>Nombre:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtDescripcion" placeHolder="Descripcion"   CssClass="form-control"></asp:TextBox>
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
                               <div class="row form-group" id="row_nombre1">                            
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><b>Nombre:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtNomUP" placeHolder="Nombre"   CssClass="form-control"></asp:TextBox>
                                    </div> 
                                 <div class="col-md-8">
                                        <asp:Label runat="server"><b>Nombre:</b></asp:Label>
                                        <asp:TextBox runat="server" ID="txtDesUP" placeHolder="Descripcion"   CssClass="form-control"></asp:TextBox>
                                    </div>                                                                                                 
                             </div>   
                    </div>
                   </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" CssClass="btn btn-danger" ID="eliminar" OnClick="eliminar_Click" Text="Eliminar"/>
                      <asp:Button runat="server" CssClass="btn btn-info" ID="actualizar" OnClick="actualizar_Click" Text="Actualizar"/>
                    </div>
                  </div>      
                </div>
              </div>
              <!-- Modal end -->

        <script>
        $(document).ready(function () {
            $("#gvVestuario").dataTable({

            });
        });
    </script>
</asp:Content>
