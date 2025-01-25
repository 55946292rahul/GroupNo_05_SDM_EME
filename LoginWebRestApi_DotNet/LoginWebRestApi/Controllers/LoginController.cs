using LoginWebRestApi.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HospitalManagementSystem.Controllers
{
    [Route("api/[controller]/[action]")]
    [EnableCors]
    [ApiController]
    public class PatientLoginController : ControllerBase
    {
        [HttpGet("getAllPatients")]
        public IActionResult GetAllPatients()
        {
            using (var db = new HospitalmanagementContext())
            {
                var users = db.Logins.Select(u => new
                {
                    u.LoginId,
                    u.Username,
                    u.Status,
                    Role = new { u.RIdNavigation.RName },
                    Patients = u.Patients.Select(p => new
                    {
                        p.PatientId,
                        p.Fname,
                        p.Lname,
                        p.Dob
                    }).ToList()
                }).ToList();

                return Ok(users);
            }
        }

        [HttpPost("validate")]
        public IActionResult Validate([FromBody] UidAndPwd credentials)
        {
            using (var db = new HospitalmanagementContext())
            {
                var user = db.Logins
                    .Include(u => u.RIdNavigation)
                    .Include(u => u.Patients)
                    .Include(u => u.Doctors)
                    .FirstOrDefault(u => u.Username.Equals(credentials.Username));

                if (user == null)
                {
                    return NotFound(new { Success = false, Message = "Enter valid username" });
                }

                if (user.Status == "Inactive")
                {
                    return Unauthorized(new { Success = false, Message = "This account is currently suspended" });
                }

                if (user.Pwd == credentials.Password)
                {
                    return Ok(new { Success = true, User = user });
                }

                
                if (BCrypt.Net.BCrypt.Verify(credentials.Password, user.Pwd))
                 {
                    return Ok(new { Success = true, User = user });
                }

                return Unauthorized(new { Success = false, Message = "Enter valid password" });
            }
        }
    }

    public class UidAndPwd
    {
        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;
    }

    public class Error
    {
        public string Message { get; set; }

        public Error(string message)
        {
            Message = message;
        }
    }
}
