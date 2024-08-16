using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using static awaq_frontend.Pages.DashboardAdminModel;

namespace awaq_frontend.Pages
{
	public class DashboardModel : PageModel
    {
        public class UserProgress
        {
            public int TEDI { get; set; }
            public int Ciberseguridad { get; set; }
            public int Comunicaciones { get; set; }
            public int PautasDeConducta { get; set; }
        }

        public class RankingUserMetrics
        {
            public string? Name { get; set; }
            public int? TEDI { get; set; }
            public int? Ciberseguridad { get; set; }
            public int? Comunicaciones { get; set; }
            public int? PautasDeConducta { get; set; }
        }


        public required List<RankingUserMetrics> rankingUsers { get; set; }


        public required UserProgress userProgress { get; set; }

        public async Task<IActionResult> OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserEmail")))
            {
                return RedirectToPage("/Index");
            }

            string baseUrl = $"https://localhost:7249/api/metrics/user/{HttpContext.Session.GetInt32("UserId")}";
            userProgress = new UserProgress();
            using (var httpClient = new HttpClient())
            {
                try
                {
                    var response = await httpClient.GetAsync(baseUrl);
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
                    return StatusCode(500, ex.Message);
                }

            }


            string baseUrl2 = "https://localhost:7249/api/metrics/users/5";
            rankingUsers = new List<RankingUserMetrics>();
            using (var httpClient = new HttpClient())
            {
                try
                {
                    var response = await httpClient.GetAsync(baseUrl2);
                    response.EnsureSuccessStatusCode();

                    var content = await response.Content.ReadAsStringAsync();
                    rankingUsers = JsonConvert.DeserializeObject<List<RankingUserMetrics>>(content);
                }
                catch (Exception ex)
                {
                    return StatusCode(500, ex.Message);
                }

            }


            return Page();

        }

        public IActionResult OnPostLogout()
        {
            HttpContext.Session.Clear();
            return RedirectToPage("/Index");
        }
    }
}
