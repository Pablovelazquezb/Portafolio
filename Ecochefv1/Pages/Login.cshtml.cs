using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Ecochef.Data;
using Microsoft.EntityFrameworkCore;


namespace Ecochef.Pages
{
    public class LoginModel : PageModel
    {
        private readonly AppDbContext _context;

        public LoginModel(AppDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public string Email { get; set; }

        [BindProperty]
        public string Password { get; set; }

        public bool LoginFailed { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            var user = await _context.Usuarios
                .FirstOrDefaultAsync(u => u.Email == Email);

            if (user != null && user.Contraseña == Password) // Compare plain text password
            {
                // Redirect to a page (e.g., the homepage) after successful login
                return RedirectToPage("/Index");
            }

            // Login failed
            LoginFailed = true;
            return Page();
        }
    }
}
