using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Text;
using System.Threading.Tasks;

namespace awaq_frontend.Pages
{
    public class FormModel : PageModel
    {
        private readonly ILogger<FormModel> _logger;
        private readonly IHttpClientFactory _clientFactory;

        public FormModel(ILogger<FormModel> logger, IHttpClientFactory clientFactory)
        {
            _logger = logger;
            _clientFactory = clientFactory;
        }

        [BindProperty]
        public InputModel Input { get; set; }



        public string Status { get; set; }
        public string ButtonStatus { get; set; }

        public IActionResult OnGet(string prevStatus)
        {

            Status = prevStatus;
            return Page();
        }


        public class InputModel
        {
            public string Suggestions { get; set; }
            public string Remove { get; set; }
            public string Questions { get; set; }
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var client = _clientFactory.CreateClient();
            var apiUrl = "https://localhost:7249/api/feedback";
            var content = new StringContent(JsonConvert.SerializeObject(new
            {
                UserId = HttpContext.Session.GetInt32("UserId"),
                Suggestions = Input.Suggestions,
                Remove = Input.Remove,
                Questions = Input.Questions

            }), Encoding.UTF8, "application/json");



            var response = await client.PostAsync(apiUrl, content);
            if (response.IsSuccessStatusCode)
            {
                Status = "EL formulario se ha enviado";
                ButtonStatus = "alert-success";
                Input = new InputModel();
            }
            else
            {
                Status = "El formulario no se ha enviado";
                ButtonStatus = "alert-danger";

            }

            return Page();
        }
    }
}
