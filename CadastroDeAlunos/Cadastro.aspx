<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="CadastroDeAlunos.Cadastro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="js/jquery-3.5.1.slim.min.js"></script>
 <script src="js/jquery.maskedinput.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section>      
        <header class="main">
            <div class="row">
                <div class="col-6">
                    <h3>Cadastro de Alunos</h3>
                </div>
                <div class="col-6" style="text-align: right">
                    <asp:Button ID="btn" runat="server" Text="Cadastrar Aluno" OnClick="btn_Click" />
                </div>
            </div>
        </header>
       <div id="DivGrid" runat="server">
           <div class="form-row" id="BuscarAluno" runat="server" >
               <table  class="col-6">
                   <tr class="form-control">
                       <td style="width:380px;">
                           <asp:TextBox ID="Filtrar" runat="server" placeholder="Nome do Aluno"></asp:TextBox>
                       </td>
                       <td>    
                            <asp:Button ID="Btn2" runat="server" Text="Filtrar" OnClick="Btn2_Click"/>
                       </td>
                    </tr>  
               </table>
           </div>
            <asp:GridView ID="gridAlunos" runat="server" OnRowCommand="gridAlunos_RowCommand" AutoGenerateColumns="false" CssClass="table table-striped">
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="5px" ItemStyle-Width="5px">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnSelecionar" runat="server" CommandArgument='<%#Eval("IdAluno")%>' CommandName="Selecionar" ToolTip="Selecionar Aluno">
                            <span class="fa fa-user" style="color:cornflowerblue"></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AlunoRA" HeaderText="Aluno" />
                    <asp:BoundField DataField="AlunoNome" HeaderText="Nome" />
                    <asp:BoundField DataField="AlunoCurso" HeaderText="Curso" />
                    <asp:BoundField DataField="AlunoSexo" HeaderText="Sexo" />
                    <asp:BoundField DataField="AlunoEmail" HeaderText="Email" />
                    <asp:BoundField DataField="AlunoCPF" HeaderText="CPF" />
                    <asp:BoundField DataField="AlunoTelefone" HeaderText="Telefone" />
                    <asp:BoundField DataField="AlunoNascimento" HeaderText="Data de Nascimento" />
                    <asp:TemplateField HeaderStyle-Width="5px" ItemStyle-Width="5px">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnExcluir" runat="server" CommandArgument='<%#Eval("IdAluno")%>' CommandName="Excluir" ToolTip="Excluir Aluno" OnClientClick="return  ExcluirAluno();">
                                <span class="fa fa-trash" style="color:crimson"></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
       
    <div id="DivForm" runat="server" visible="false">
            
            <asp:HiddenField ID="txtUsuId" runat="server" />

            <table style="width:600px;border:1px solid #949393;margin-left:30px">
                <tr>
                    <td>RA: <span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtRA" runat="server" CssClass="Text"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Nome<span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtNome" runat="server" CssClass="Text"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Curso:<span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtCurso" runat="server" CssClass="Text"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Sexo: <span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtSexo" runat="server" CssClass="Text"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email:<span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="Text"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>CPF:<span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtCPF" runat="server" CssClass="Text" ClientIDMode="Static"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Telefone: <span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtTelefone" runat="server" CssClass="Text" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Data de Nascimento:<span style="color:red">*</span></td>
                    <td><asp:TextBox ID="txtNascimento" TextMode="DateTime" runat="server" CssClass="Text" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
              
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnGravar" runat="server" Text="Gravar" OnClick="btnGravar_Click" OnClientClick="return ValidarCampos()" />
                        <asp:Button ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" OnClientClick="return Cancelar()" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="DivErro" runat="server"></div>
                    </td>
                </tr>
            </table>
        </div>
    <script typeof="javascript">

        function ValidarCampos() {
            var IdAluno = $("#<%=txtUsuId.ClientID%>").val();

            var RA = $("#<%=txtRA.ClientID%>").val();

            if (RA == "") {
                alert("Campo RA é obrigatório");
                $("#<%=txtRA.ClientID%>").focus();
                return false;
            }

            var Nome = $("#<%=txtNome.ClientID%>").val();

             if (Nome == "") {
                 alert("Campo Nome é Obrigatório");
                 $("#<%=txtNome.ClientID%>").focus();
                 return false;
             }

             var CPF = $("#<%=txtCPF.ClientID%>").val().replace('.', '').replace('.', '').replace('-', '');

             if (CPF == "") {
                 alert("Campo CPF é Obrigatório");
                 $("#<%=txtCPF.ClientID%>").focus();
                 return false;
             }
             if (!validarCPF(CPF)) {
                 alert("CPF Inválido");
                 return false;

             }

             var Nascimento = $("#<%=txtNascimento.ClientID%>").val();

             if (Nascimento == "") {
                 alert("Campo Nascimento é Obrigatório");
                 $("#<%=txtNascimento.ClientID%>").focus();
                 return false;
             }
             var Email = $("#<%=txtEmail.ClientID%>").val();

             if (Email == "") {

                 alert("Campo Email é Obrigatório");
                 $("#<%=txtEmail.ClientID%>").focus();
                 return false;
             }
             var Curso = $("#<%=txtCurso.ClientID%>").val();

             if (Curso == "") {
                 alert("Campo Curso é Obrigatório");
                 $("#<%=txtCurso.ClientID%>").focus();
                 return false;
             }
             var Sexo = $("#<%=txtSexo.ClientID%>").val();

             if (Sexo == "") {
                 alert("Campo Sexo é Obrigatório");
                 $("#<%=txtSexo.ClientID%>").focus();
                 return false;
             }
             var Telefone = $("#<%=txtTelefone.ClientID%>").val();

             if (Telefone == "") {
                 alert("Campo Telefone é Obrigatório");
                 $("#<%=txtTelefone.ClientID%>").focus();
                 return false;
             }
             
            return true;
        }

        

        jQuery(function ($) {
            $("#txtNascimento").mask("99/99/9999");
            $("#txtTelefone").mask("(099) 9999-9999");
            $("#txtCPF").mask("999.999.999-99");
        });

        function Cancelar() {
                if (confirm("Deseja cancelar essa opção?")) {
                    return true;
                }
                else {
                    return false;
                }
            }
        function ExcluirAluno() {
            return (confirm("Deseja cancelar essa opção?"))

        }

        function validarEmail(Email) {
            return /^[\w+.]+@\w+\.\w{2,}(?:\.\w{2})?$/.test(Email)
        }

        function validarCPF(CPF) {
            CPF = CPF.replace(/[^\d]+/g, '');
            if (CPF == '') return false;
            	
            if (CPF.length != 11 ||
                CPF == "00000000000" ||
                CPF == "11111111111" ||
                CPF == "22222222222" ||
                CPF == "33333333333" ||
                CPF == "44444444444" ||
                CPF == "55555555555" ||
                CPF == "66666666666" ||
                CPF == "77777777777" ||
                CPF == "88888888888" ||
                CPF == "99999999999")
                return false;
            add = 0;
            for (i = 0; i < 9; i++)
                add += parseInt(CPF.charAt(i)) * (10 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != parseInt(CPF.charAt(9)))
                return false;
            add = 0;
            for (i = 0; i < 10; i++)
                add += parseInt(CPF.charAt(i)) * (11 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != parseInt(CPF.charAt(10)))
                return false;
            return true;
        }
    </script>
  </section>
</asp:Content>