using Microsoft.EntityFrameworkCore;

namespace Ecochef.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Usuario> Usuarios { get; set; }
    }

    public class Usuario
    {
        public int UsuarioID { get; set; }
        public string NombreCompleto { get; set; }
        public string Email { get; set; }
        public string Rol { get; set; } // e.g., 'Administrador', 'Chef', 'Analista'
        public DateTime FechaCreacion { get; set; }
        public string Contraseña { get; set; }
    }
}
