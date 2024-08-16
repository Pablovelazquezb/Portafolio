using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using static awaq_frontend.Pages.DashboardModel;

namespace awaq_frontend.Pages
{
    public class DashboardAdminModel : PageModel
    {

        public class UsersMetrics
        {
            public int CapacitedUsers { get; set; }
            public int TotalUsers { get; set; }
        }

        public class UserProgress
        {
            public int TEDI { get; set; }
            public int Ciberseguridad { get; set; }
            public int Comunicaciones { get; set; }
            public int PautasDeConducta { get; set; }
        }

        public class CompleteUserMetrics
        {
            public int ID { get; set; }
            public required string Name { get; set; }
            public required string Email { get; set; }
            public string? PhoneNumber { get; set; }
            public DateTime JoinedAt { get; set; }
            public int TEDI { get; set; }
            public int Ciberseguridad { get; set; }
            public int Comunicaciones { get; set; }
            public int PautasDeConducta { get; set; }
        }

        public required UserProgress userProgress { get; set; }

        public required List<CompleteUserMetrics> Users { get; set; }

        public UsersMetrics BasicMetrics { get; set; }

        public async Task<IActionResult> OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserEmail")))
            {
                return RedirectToPage("/Index");
            }

            if (HttpContext.Session.GetString("UserRole") == "Miembro")
            {
                return RedirectToPage("/Dashboard");
            }
            string baseUrl = "https://localhost:7249/api/metrics";
            BasicMetrics = new UsersMetrics();
            using (var httpClient = new HttpClient())
            {
                try
                {
                    var response = await httpClient.GetAsync(baseUrl);
                    response.EnsureSuccessStatusCode();

                    var content = await response.Content.ReadAsStringAsync();
                    var r = JsonConvert.DeserializeObject<UsersMetrics>(content);
                    BasicMetrics.CapacitedUsers = r.CapacitedUsers;
                    BasicMetrics.TotalUsers = r.TotalUsers;
                    
                }
                catch (Exception ex)
                {
                    return StatusCode(500, "1");
                }

            }

            string baseUrl2 = "https://localhost:7249/api/metrics/subjects";
            userProgress = new UserProgress();
            using (var httpClient = new HttpClient())
            {
                try
                {
                    var response = await httpClient.GetAsync(baseUrl2);
                    response.EnsureSuccessStatusCode();

                    var content = await response.Content.ReadAsStringAsync();
                    var r = JsonConvert.DeserializeObject<Dictionary<string, int>>(content);
                    userProgress.TEDI = r["tedi"];
                    userProgress.Ciberseguridad = r["ciberseguridad"];
                    userProgress.Comunicaciones = r["comunicaciones"];
                    userProgress.PautasDeConducta = r["pautasDeConducta"];

                }
                catch (Exception ex)
                {
                    return StatusCode(500, "2");
                }

            }

            string baseUrl3 = "https://localhost:7249/api/metrics/users";
            Users = new List<CompleteUserMetrics>();
            using (var httpClient = new HttpClient())
            {
                try
                {
                    var response = await httpClient.GetAsync(baseUrl3);
                    response.EnsureSuccessStatusCode();

                    var content = await response.Content.ReadAsStringAsync();
                    Users = JsonConvert.DeserializeObject<List<CompleteUserMetrics>>(content);

                }
                catch (Exception ex)
                {
                    return StatusCode(500, "3");
                }

            }

            return Page();

        }
    }
}
