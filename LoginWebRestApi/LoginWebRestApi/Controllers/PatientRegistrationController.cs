using LoginWebRestApi.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using HospitalManagementSystem.DTOs; 

namespace HospitalManagementSystem.Controllers
{
    [Route("api/[controller]/[action]")]
    [EnableCors]
    [ApiController]
    public class PatientRegistrationController : ControllerBase
    {
        private readonly HospitalmanagementContext _context;

        public PatientRegistrationController(HospitalmanagementContext context)
        {
            _context = context;
        }

        [HttpPost("register")]
        public IActionResult Register([FromBody] PatientRegistrationDto patientDto)
        {
            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors)
                    .Select(e => e.ErrorMessage)
                    .ToList();
                return BadRequest(new { Success = false, Message = "Invalid registration data", Errors = errors });
            }

            try
            {
                var existingPatient = _context.Patients
                    .FirstOrDefault(p => p.EmailAddress == patientDto.EmailAddress || p.AadharNo == patientDto.AadharNo);

                if (existingPatient != null)
                {
                    return Conflict(new { Success = false, Message = "Patient with the same email or Aadhar number already exists" });
                }

                var existingLogin = _context.Logins
                    .FirstOrDefault(l => l.Username == patientDto.Username);

                if (existingLogin != null)
                {
                    return Conflict(new { Success = false, Message = "Username already exists" });
                }

                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(patientDto.Password);

                var newLogin = new Login
                {
                    Username = patientDto.Username,
                    Pwd = hashedPassword,
                    RId = 3,
                    Status = "Active"
                };

                _context.Logins.Add(newLogin);
                _context.SaveChanges();

                var newPatient = new Patient
                {
                    Fname = patientDto.Fname,
                    Lname = patientDto.Lname,
                    MobNo = patientDto.MobNo,
                    EmailAddress = patientDto.EmailAddress,
                    AadharNo = patientDto.AadharNo,
                    PAddress = patientDto.PAddress,
                    Gender = patientDto.Gender,
                    BloodGrp = patientDto.BloodGrp,
                    Dob = patientDto.Dob,
                    Areaid = patientDto.Areaid,
                    Loginid = newLogin.LoginId
                };

                _context.Patients.Add(newPatient);
                _context.SaveChanges();

                return Ok(new { Success = true, Patient = newPatient });
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(500, new { Success = false, Message = "An error occurred while saving the patient data", Details = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Success = false, Message = "An unexpected error occurred", Details = ex.Message });
            }
        }

        [HttpGet("getPatients")]
        public IActionResult GetPatients()
        {
            var patients = _context.Patients
                .Include(p => p.Area)
                .Include(p => p.Login)
                .ToList();

            if (patients == null || !patients.Any())
            {
                return NotFound(new { Success = false, Message = "No patients found" });
            }

            return Ok(patients.Select(patient => new
            {
                patient.PatientId,
                patient.Fname,
                patient.Lname,
                patient.MobNo,
                patient.EmailAddress,
                patient.AadharNo,
                patient.PAddress,
                patient.Gender,
                patient.BloodGrp,
                patient.Dob,
                Area = new { patient.Area.Aid, patient.Area.Name },
                Login = new { patient.Login.LoginId, patient.Login.Username }
            }));
        }
    }
}
