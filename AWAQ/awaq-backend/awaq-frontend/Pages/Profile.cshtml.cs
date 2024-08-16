using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System.Data;

namespace awaq_frontend.Pages
{
    public class ProfileModel : PageModel
    {
        private readonly ILogger<ProfileModel> _logger;
        private readonly IWebHostEnvironment _environment;

        public ProfileModel(ILogger<ProfileModel> logger, IWebHostEnvironment environment)
        {
            _logger = logger;
            _environment = environment;
        }

        private readonly IHttpClientFactory _clientFactory;


        [BindProperty]
        public string? Name { get; set; }

        [BindProperty]
        public required string Email { get; set; }

        [BindProperty]
        public string? BirthDate { get; set; }

        [BindProperty]
        public string? PhoneNumber { get; set; }

        [BindProperty]
        public string? Image { get; set; }

        [BindProperty]
        public string? ProfilePicture { get; set; }

        public string ErrorMessage { get; set; }


        public class InputModel
        {
            public required string Name { get; set; }
            public required string Phone { get; set; }
            public required DateTime Date { get; set; }
        }

        public required InputModel Input { get; set; }

        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserEmail")))
            {
                return RedirectToPage("/Index");
            }

            Email = HttpContext.Session.GetString("UserEmail");

            try
            {
                string connectionString = "Server=mysql-bbb99b2-tec-d12c.k.aivencloud.com;Port=23783;Database=Awaq;Uid=avnadmin;password=AVNS_5-Tx0gpt5dim1pIaSYF;";
                using (MySqlConnection conexion = new MySqlConnection(connectionString))
                {
                    conexion.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = conexion;

                    cmd.CommandText = "SELECT name, birthDate, phoneNumber, profile_picture FROM users WHERE email = @Email";
                    cmd.Parameters.AddWithValue("@Email", Email);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Name = reader["name"].ToString();
                            DateTime birthDateTime = Convert.ToDateTime(reader["birthDate"]);
                            BirthDate = birthDateTime.ToString("yyyy-MM-dd");               
                            PhoneNumber = reader["phoneNumber"].ToString();
                        }
                      
                    }
                    
                }
            }
            catch (Exception ex)
            {
                _logger.LogError("Algo salio mal");
            }
            return Page();
        }

        public IActionResult OnPostLogout()
        {
            HttpContext.Session.Clear();
            return RedirectToPage("/Index");
        }



        public async Task<IActionResult> OnPostUpdateUser(string name, string phoneNumber, DateTime birthDate)
        {


            var url = $"https://localhost:7249/api/user/{HttpContext.Session.GetInt32("UserId")}";
            var client = new HttpClient();
            var content = new StringContent(JsonConvert.SerializeObject(new
            {
                name,
                phone = phoneNumber,
                date = birthDate
            }), Encoding.UTF8, "application/json");

            _ = await client.PutAsync(url, content);

            return Page();
        }




    }
}