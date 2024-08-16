using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Ocsp;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Data;


namespace awaq_frontend.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly IHttpClientFactory _clientFactory;

        public IndexModel(ILogger<IndexModel> logger, IHttpClientFactory clientFactory)
        {
            _logger = logger;
            _clientFactory = clientFactory;
        }

        [BindProperty]
        public InputModel Input { get; set; }

        public string Error { get; set; }
        public string PrevEmail { get; set; }
        public string PrevPassword { get; set; }
        public bool RedirectToDashboard { get; set; }

        public class InputModel
        {
            public required string email { get; set; }
            public required string password { get; set; }
        }

        public IActionResult OnGet(string error, string email, string password)
        {

            if (!string.IsNullOrEmpty(HttpContext.Session.GetString("UserEmail")))
            {
                return RedirectToPage("/Dashboard");
            }
            Error = error;
            PrevEmail = email;
            PrevPassword = password;
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var client = _clientFactory.CreateClient();
            var loginUrl = "https://localhost:7249/api/signIn";
            var content = new StringContent(JsonConvert.SerializeObject(new
            {
                Email = Input.email,
                Password = Input.password,
            }), Encoding.UTF8, "application/json");



            var response = await client.PostAsync(loginUrl, content);
            if (response.IsSuccessStatusCode)
            {
                var responseData = await response.Content.ReadAsStringAsync();
                var responseObject = JsonConvert.DeserializeObject<dynamic>(responseData);
                string role = responseObject.role;
                int id = responseObject.id;

                HttpContext.Session.SetString("UserEmail", Input.email);
                HttpContext.Session.SetString("UserRole", role);
                HttpContext.Session.SetInt32("UserId", id);

                return RedirectToPage("/dashboard");
            }
            else
            {
                var errorResponse = await response.Content.ReadAsStringAsync();
                Error = errorResponse;
                PrevEmail = Input.email;
                PrevPassword = Input.password;
                return Page();
            }
        }
    }
}
