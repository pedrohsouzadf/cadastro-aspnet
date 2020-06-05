using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AcessosDadosDAO;

namespace CadastroDeAlunos
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MontarGrid()
        {
            AlunoDAO alunoDAO = new AlunoDAO();
            DataTable dtAluno = alunoDAO.ListarAlunos();
            gridAlunos.DataSource = dtAluno;
            gridAlunos.DataBind();
        }

        protected void gridAlunos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Programar o método de Selecionar o usuário
            if (e.CommandName == "Selecionar")
            {
                string IdAluno = e.CommandArgument.ToString();
                txtUsuId.Value = IdAluno;
                AlunoDAO alunoDAO = new AlunoDAO();
                DataTable dtAluno = alunoDAO.BuscarAlunos(Convert.ToInt32(IdAluno));

                if (dtAluno.Rows.Count > 0)
                {
                    string AlunoRA = dtAluno.Rows[0]["AlunoRA"].ToString();
                    string Nome = dtAluno.Rows[0]["AlunoNome"].ToString();
                    string Curso = dtAluno.Rows[0]["AlunoCurso"].ToString();
                    string Sexo = dtAluno.Rows[0]["AlunoSexo"].ToString();
                    string Email = dtAluno.Rows[0]["AlunoEmail"].ToString();
                    string CPF = dtAluno.Rows[0]["AlunoCPF"].ToString();
                    string Telefone = dtAluno.Rows[0]["AlunoTelefone"].ToString();
                    string Nascimento = dtAluno.Rows[0]["AlunoNascimento"].ToString();

                    txtUsuId.Value = IdAluno;
                    txtRA.Text = AlunoRA;
                    txtNome.Text = Nome;
                    txtCurso.Text = Curso;
                    txtSexo.Text = Sexo;
                    txtEmail.Text = Email;
                    txtCPF.Text = CPF;
                    txtTelefone.Text = Telefone;
                    txtNascimento.Text = Nascimento;


                    DivGrid.Visible = false;
                    DivForm.Visible = true;

                }
            }

            //Programar o método de Excluir o usuário
            if (e.CommandName == "Excluir")
            {
                string IdAluno = e.CommandArgument.ToString();

                AlunoDAO alunoDAO = new AlunoDAO();
                alunoDAO.ExcluirAlunos(Convert.ToInt32(IdAluno));
                MontarGrid();
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            DivGrid.Visible = false;
            DivForm.Visible = true;
        }
        protected void Cancelar_Click(object sender, EventArgs e)
        {
            DivGrid.Visible = true;
            DivForm.Visible = false;
        }
        protected void btnGravar_Click(object sender, EventArgs e)
        {
            string IdAluno = txtUsuId.Value;
            int AlunoRA = Convert.ToInt32(txtRA.Text);
            string Nome = txtNome.Text;
            string Curso = txtCurso.Text;
            string Sexo = txtSexo.Text;
            string Email = txtEmail.Text;
            string CPF = txtCPF.Text;
            string Telefone = txtTelefone.Text;
            string Nascimento = Convert.ToDateTime(txtNascimento.Text).ToString("yyyy-MM-dd");


            AlunoDAO alunoDAO = new AlunoDAO();

            if (IdAluno == "")
            {
                bool Validar = alunoDAO.ValidarEmail(Email);
                if (Validar)
                {
                    DivErro.InnerHtml = "Email já cadastrado para outro aluno";
                    return;

                }
                else
                {
                    alunoDAO.InserirAlunos(AlunoRA, Nome, Curso, Sexo, Email, CPF, Telefone, Nascimento);
                }
            }
            else
            {
                alunoDAO.AtualizarAlunos(Convert.ToInt32(IdAluno), AlunoRA, Nome, Curso, Sexo, Email, CPF, Telefone, Nascimento);
            }

            txtRA.Text = "";
            txtNome.Text = "";
            txtCurso.Text = "";
            txtSexo.Text = "";
            txtEmail.Text = "";
            txtCPF.Text = "";
            txtTelefone.Text = "";
            txtNascimento.Text = "";


            MontarGrid();
            DivGrid.Visible = true;
            DivForm.Visible = false;

            return;
        }
        protected void Btn2_Click(object sender, EventArgs e)
        {
            string Nome = Filtrar.Text;

            AlunoDAO alunoDAO = new AlunoDAO();
            DataTable dtAluno = alunoDAO.PesquisarNomeAluno(Nome);
            gridAlunos.DataSource = dtAluno;
            gridAlunos.DataBind();

        }
    }


}