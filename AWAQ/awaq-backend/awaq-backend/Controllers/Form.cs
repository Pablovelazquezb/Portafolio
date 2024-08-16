using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using awaq_backend.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http;
using awaq_backend.Controllers;

namespace awaq_backend.Models.Controllers
{
   
    public class FeedbackController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public FeedbackController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public class CreateFeedback
        {
            public required int UserId { get; set; }
            public required string Suggestions { get; set; }
            public required string Remove { get; set; }
            public required string Questions { get; set; }
        }

        [HttpPost]
        [Route("api/feedback")]
        public async Task<IActionResult> CreateFeedBack([FromBody] CreateFeedback request)
        {
            try
            {


                List<User> users = new List<User>();
                string? connectionString = _configuration.GetConnectionString("myDb1");


                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    await connection.OpenAsync();

                
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "INSERT INTO Feedback(UserId, Suggestions, Remove, Questions) VALUES(@UserId, @Suggestions, @Remove, @Questions)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@UserId", request.UserId);
                    cmd.Parameters.AddWithValue("@Suggestions", request.Suggestions);
                    cmd.Parameters.AddWithValue("@Remove", request.Remove);
                    cmd.Parameters.AddWithValue("@Questions", request.Questions);

                    int rowsAffected = await cmd.ExecuteNonQueryAsync();

                    connection.Dispose();

                    return Ok();

                }

            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
