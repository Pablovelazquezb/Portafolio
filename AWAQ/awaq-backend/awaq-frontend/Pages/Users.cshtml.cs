using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net.Http;
using System.Threading.Tasks;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Text;
using Google.Protobuf;
using static awaq_frontend.Pages.UsersModel;
using System.Data;

namespace awaq_frontend.Pages
{
    public class UsersModel : PageModel
    {

        private readonly ILogger<UsersModel> _logger;
        private readonly IHttpClientFactory _clientFactory;

        public UsersModel(ILogger<UsersModel> logger, IHttpClientFactory clientFactory)
        {
            _logger = logger;
            _clientFactory = clientFactory;
        }

        public new class User
        {
            public int? ID { get; set; }
            public string? Name { get; set; }
            public string? Email { get; set; }
            public string? Password { get; set; }
            public string? Role { get; set; }
            public string? JoinedAt { get; set; }
        }

        public string? PrevName { get; set; }
        public string? PrevEmail { get; set; }
        public string? PrevRole { get; set; }
        public string? PrevPassword { get; set; }
        public string? Error { get; set; }

        public class InputModel
        {
            public required string name { get; set; }
            public required string email { get; set; }
            public required string password { get; set; }
            public required string role { get; set; }
        }

        [BindProperty]
        public InputModel? Input { get; set; }


        
        public required IList<User> Users { get; set; }

        public async Task<IActionResult> OnGetAsync(string name, string email, string password, string error, string role = "3" )
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserEmail")))
            {
                return RedirectToPage("/Index");
            }

            if (HttpContext.Session.GetString("UserEmail") == "Miembro")
            {
                return RedirectToPage("/Dashboard");
            }

            Error = error;
            PrevName = name;
            PrevEmail = email;
            PrevPassword = password;
            PrevRole = role;
            Error = error;


            using (var httpClient = new HttpClient())
            {
                try
                {
                    using (var response = await httpClient.GetAsync("https://localhost:7249/api/users"))
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        Users = JsonConvert.DeserializeObject<List<User>>(apiResponse);
                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine($"Exception: {ex.Message}");
                }
            }

            return Page();
        }


        public async Task<IActionResult> OnPostCreateUser()
        {

            var client = _clientFactory.CreateClient();
            var loginUrl = "https://localhost:7249/api/user";
            var content = new StringContent(JsonConvert.SerializeObject(new
            {
                Email = Input.email,
                Password = Input.password,
                Role = int.Parse(Input.role),
                Name = Input.name
            }), Encoding.UTF8, "application/json");

            var response = await client.PostAsync(loginUrl, content);
            if (response.IsSuccessStatusCode)
            {
                // var responseData = await response.Content.ReadAsStringAsync();
                // var responseObject = JsonConvert.DeserializeObject<dynamic>(responseData);

                Error = "";
                PrevEmail = "";
                PrevName = "";
                PrevPassword = "";
                PrevRole = "3";

            }
            else
            {
                var errorResponse = await response.Content.ReadAsStringAsync();
                Error = errorResponse;
                PrevEmail = Input.email;
                PrevName = Input.name;
                PrevPassword = Input.password;
                PrevRole = Input.role;
            }

            using (var httpClient = new HttpClient())
            {
                try
                {
                    using (var r = await httpClient.GetAsync("https://localhost:7249/api/users"))
                    {
                        string apiResponse = await r.Content.ReadAsStringAsync();
                        Users = JsonConvert.DeserializeObject<List<User>>(apiResponse);
                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine($"Exception: {ex.Message}");
                }
            }

            return Page();
        }

        public async Task<IActionResult> OnPostRole(int UserId, string UserRole)
        {
            try
            {
                int intRole = (UserRole == "Administrador") ? 3 : 2;
                var client = new HttpClient();
                var url = $"https://localhost:7249/api/user/{UserId}/role";
                var content = new StringContent(JsonConvert.SerializeObject(new
                {
                    role = intRole
                }), Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PutAsync(url, content);

                using (var httpClient = new HttpClient())
                {
                    try
                    {
                        using (var r = await httpClient.GetAsync("https://localhost:7249/api/users"))
                        {
                            string apiResponse = await r.Content.ReadAsStringAsync();
                            Users = JsonConvert.DeserializeObject<List<User>>(apiResponse);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.Error.WriteLine($"Exception: {ex.Message}");
                    }
                }

                return Page();
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"Exception: {ex.Message}");
                return StatusCode(500, "Internal server error");
            }
        }

        public IActionResult OnPostLogout()
        {
            HttpContext.Session.Clear();
            return RedirectToPage("/Index");
        }
    }
}
