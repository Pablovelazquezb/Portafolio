using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Ecochef.Data;
using Microsoft.EntityFrameworkCore;

namespace Ecochef.Pages
{
    public class SignupModel : PageModel
    {
        private readonly AppDbContext _context;

        public SignupModel(AppDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public string NombreCompleto { get; set; }

        [BindProperty]
        public string Email { get; set; }

        [BindProperty]
        public string Password { get; set; }

        public bool SignUpFailed { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            // Check if the email is already registered
            var existingUser = await _context.Usuarios
                .FirstOrDefaultAsync(u => u.Email == Email);

            if (existingUser == null)
            {
                // Create a new user
                var newUser = new Usuario
                {
                    NombreCompleto = NombreCompleto,
                    Email = Email,
                    Contraseña = Password, // Store plain text password
                    Rol = "Analista", // Default role, adjust as needed
                    FechaCreacion = DateTime.Now
                };

                // Add new user to the database
                _context.Usuarios.Add(newUser);
                await _context.SaveChangesAsync();

                // Redirect to the login page after successful signup
                return RedirectToPage("/Login");
            }

            // If email is already taken, set SignUpFailed to true
            SignUpFailed = true;
            return Page();
        }
    }
}
