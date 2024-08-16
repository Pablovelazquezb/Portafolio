using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace awaq_backend.Controllers
{
    public class Question : Controller
    {
        private readonly IConfiguration _configuration;

        public Question(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public interface IQuestion
        {
            int ID { get; set; }
            string Explanation { get; set; }
        }

        public class CommunicationQuestion : IQuestion
        {
            public int ID { get; set; }
            public string Text { get; set; }
            public string CorrectAnswer { get; set; }
            public string Answer2 { get; set; }
            public string Answer3 { get; set; }
            public string Answer4 { get; set; }
            public string Explanation { get; set; }
        }

        public class EthicQuestion : IQuestion
        {
            public int ID { get; set; }
            public string Text { get; set; }
            public string CorrectAnswer { get; set; }
            public string Answer2 { get; set; }
            public string Answer3 { get; set; }
            public string Answer4 { get; set; }
            public string Explanation { get; set; }
        }

        public class TediQuestion : IQuestion
        {
            public int ID { get; set; }
            public string Html { get; set; }
            public string Css { get; set; }
            public string Result { get; set; }
            public string Explanation { get; set; }
            public string Result2 { get; set; }
            public string Result3 { get; set; }
        }

        public class SecurityQuestion : IQuestion
        {
            public int ID { get; set; }
            public string Text { get; set; }
            public bool IsCorrect { get; set; }
            public string Explanation { get; set; }
            public string Sender { get; set; }
            public string Subject { get; set; }
        }

        private async Task<CommunicationQuestion?> GetCommunicationQuestionHelper(int userId)
        {
            string? connectionString = _configuration.GetConnectionString("myDb1");
            using (var connection = new MySqlConnection(connectionString))
            {
                await connection.OpenAsync();
                using (var command = new MySqlCommand("getCommunicationQuestion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@user_id", userId);

                    var reader = await command.ExecuteReaderAsync();

                    if (await reader.ReadAsync())
                    {
                        return new CommunicationQuestion
                        {
                            ID = reader.GetInt32(0),
                            Text = reader.GetString(1),
                            CorrectAnswer = reader.GetString(2),
                            Answer2 = reader.GetString(3),
                            Answer3 = reader.GetString(4),
                            Answer4 = reader.GetString(5),
                            Explanation = reader.GetString(6)
                        };
                    }
                    else
                    {
                        return null;
                    }
                }
            }
        }

        private async Task<EthicQuestion?> GetEthicQuestionHelper(int userId)
        {
            string? connectionString = _configuration.GetConnectionString("myDb1");
            using (var connection = new MySqlConnection(connectionString))
            {
                await connection.OpenAsync();
                using (var command = new MySqlCommand("getEthicQuestion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@user_id", userId);

                    var reader = await command.ExecuteReaderAsync();

                    if (await reader.ReadAsync())
                    {
                        return new EthicQuestion
                        {
                            ID = reader.GetInt32(0),
                            Text = reader.GetString(1),
                            CorrectAnswer = reader.GetString(2),
                            Answer2 = reader.GetString(3),
                            Answer3 = reader.GetString(4),
                            Answer4 = reader.GetString(5),
                            Explanation = reader.GetString(6)
                        };
                    }
                    else
                    {
                        return null;
                    }
                }
            }
        }


        private bool IntToBool(int value)
        {
            return value != 0;
        }

        private async Task<SecurityQuestion?> GetSecurityQuestionHelper(int userId)
        {
            string? connectionString = _configuration.GetConnectionString("myDb1");
            using (var connection = new MySqlConnection(connectionString))
            {
                await connection.OpenAsync();
                using (var command = new MySqlCommand("getSecurityQuestion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@user_id", userId);

                    var reader = await command.ExecuteReaderAsync();

                    if (await reader.ReadAsync())
                    {
                        return new SecurityQuestion
                        {
                            ID = reader.GetInt32(0),
                            Text = reader.GetString(1),
                            IsCorrect = IntToBool(reader.GetInt32(2)),
                            Explanation = reader.GetString(3),
                            Sender = reader.GetString(4),
                            Subject = reader.GetString(5)
                        };
                    }
                    else
                    {
                        return null;
                    }
                }
            }
        }


        private async Task<TediQuestion?> GetTediQuestionHelper(int userId)
        {
            string? connectionString = _configuration.GetConnectionString("myDb1");
            using (var connection = new MySqlConnection(connectionString))
            {
                await connection.OpenAsync();
                using (var command = new MySqlCommand("getTediQuestion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@user_id", userId);

                    var reader = await command.ExecuteReaderAsync();

                    if (await reader.ReadAsync())
                    {
                        return new TediQuestion
                        {
                            ID = Convert.ToInt32(reader.GetDecimal(0)),
                            Html = reader.GetString(1),
                            Css = reader.GetString(2),
                            Result = reader.GetString(3),
                            Explanation = reader.GetString(4),
                            Result2 = reader.GetString(5),
                            Result3 = reader.GetString(6)
                        };
                    }
                    else
                    {
                        return null;
                    }
                }
            }
        }

        

        [HttpGet("api/question/category/{category}/user/{id}")]
        public async Task<IActionResult> GetQuestion(string category, int id)
        {
            try
            {
                if (category.Equals("communication", StringComparison.OrdinalIgnoreCase))
                {
                    var question = await GetCommunicationQuestionHelper(id);
                    if (question == null)
                    {
                        return NotFound();
                    }
                    return Ok(question);
                }
                else if (category.Equals("tedi", StringComparison.OrdinalIgnoreCase))
                {
                    var question = await GetTediQuestionHelper(id);
                    if (question == null)
                    {
                        return NotFound();
                    }
                    return Ok(question);
                }
                else if (category.Equals("security", StringComparison.OrdinalIgnoreCase))
                {
                    var question = await GetSecurityQuestionHelper(id);
                    if (question == null)
                    {
                        return NotFound();
                    }
                    return Ok(question);
                }
                else if (category.Equals("ethic", StringComparison.OrdinalIgnoreCase))
                {
                    var question = await GetEthicQuestionHelper(id);
                    if (question == null)
                    {
                        return NotFound();
                    }
                    return Ok(question);
                }
                else
                {
                    return BadRequest("Invalid category");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpPut("api/question/{questionID}/category/{category}/user/{userID}/{solved}")]
        public async Task<IActionResult> UpdateUserQuestion(int questionID, string category, int userID, int solved)
        {
            string? connectionString = _configuration.GetConnectionString("myDb1");
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    await connection.OpenAsync();
                    using (var command = new MySqlCommand())
                    {
                        command.Connection = connection;
                        command.CommandType = CommandType.StoredProcedure;

                        if (category.Equals("tedi", StringComparison.OrdinalIgnoreCase))
                        {
                            command.CommandText = "answerTediQuestion";
                            command.Parameters.AddWithValue("@p_user_id", userID);
                            command.Parameters.AddWithValue("@p_memorandum_id", questionID);
                            command.Parameters.AddWithValue("@p_solved", solved);
                        }
                        else if (category.Equals("security", StringComparison.OrdinalIgnoreCase))
                        {
                            command.CommandText = "answerSecurityQuestion";
                            command.Parameters.AddWithValue("@p_user_id", userID);
                            command.Parameters.AddWithValue("@p_true_false_id", questionID);
                            command.Parameters.AddWithValue("@p_solved", solved);
                        }
                        else if (category.Equals("ethic", StringComparison.OrdinalIgnoreCase) || category.Equals("communication", StringComparison.OrdinalIgnoreCase))
                        {
                            command.CommandText = "answerQuestion";
                            command.Parameters.AddWithValue("@p_user_id", userID);
                            command.Parameters.AddWithValue("@p_question_id", questionID);
                            command.Parameters.AddWithValue("@p_solved", solved);
                        }
                        else
                        {
                            return BadRequest("Invalid category");
                        }

                        await command.ExecuteNonQueryAsync();
                    }
                }

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

    }
}

