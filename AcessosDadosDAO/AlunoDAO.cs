using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessosDadosDAO
{
    public class AlunoDAO : ConexaoDAO
    {
        public AlunoDAO()
        {

        }



        public DataTable ListarAlunos()
        {
            string query = "Select * from cadastroaluno ";
                           
            return ExecuteQuery(query);
        }

        public bool ValidarEmail(string Email)
        {
            string query = "Select * from cadastroaluno where AlunoEmail = '" + Email + "'";
            DataTable dtAluno = ExecuteQuery(query);
            if (dtAluno.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataTable BuscarAlunos(int IdAluno)
        {
            string query = "Select * from cadastroaluno where IdAluno = " + IdAluno;
            return ExecuteQuery(query);
        }

        public bool InserirAlunos(int AlunoRA, string Nome, string Curso, string Sexo, string Email, string CPF, string Telefone, string Nascimento)
        {
            string query = "insert into cadastroaluno(AlunoNome, AlunoRA, AlunoCurso, AlunoSexo, AlunoEmail, AlunoCPF, AlunoTelefone, AlunoNascimento) " +
                            " values('" + Nome + "','" + AlunoRA + "','" + Curso + "','" + Sexo + "' ,'" + Email + "','" + CPF + "','" + Telefone + "' ,'" + Nascimento + "')";
            return ExecuteNonQuery(query);
        }
        public bool AtualizarAlunos(int IdAluno, int AlunoRA, string Nome, string Curso, string Sexo, string Email, string CPF, string Telefone, string Nascimento)
        {
            string query = " Update cadastroaluno set " +
                           " AlunoNome = '" + Nome + "', " +
                           " AlunoRA='" + AlunoRA + "', " +
                           " AlunoCurso = '" + Curso + "', " +
                           " AlunoSexo = '" + Sexo + "', " +
                           " AlunoEmail='" + Email + "', " +
                           " AlunoCPF = '" + CPF + "', " +
                           " AlunoTelefone = '" + Telefone + "', " +
                           " AlunoNascimento = '" + Nascimento + "'";


            query = query + " Where IdAluno = " + IdAluno;

            return ExecuteNonQuery(query);
        }

        public bool ExcluirAlunos(int Id)
        {
            string query = " Delete from cadastroaluno where IdAluno = " + Id;
            return ExecuteNonQuery(query);
        }

        public DataTable PesquisarNomeAluno(string Nome)
        {
            string query = "Select * from cadastroaluno " +
                           "where AlunoNome LIKE '%" + Nome + "%';";


            return ExecuteQuery(query);

        }

    }
}


