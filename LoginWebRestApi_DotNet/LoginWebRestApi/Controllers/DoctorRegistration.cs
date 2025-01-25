using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using LoginWebRestApi.Models;
using BCrypt.Net;

namespace HospitalManagementSystem.Controllers
{
    [Route("api/[controller]/[action]")]
    [EnableCors]
    [ApiController]
    public class DoctorRegistrationController : ControllerBase
    {
        private readonly HospitalmanagementContext _context;

        public DoctorRegistrationController(HospitalmanagementContext context)
        {
            _context = context;
        }

        [HttpPost("register")]
        public IActionResult Register([FromBody] DoctorRegistrationDto doctorDto)
        {
            // Validate the DoctorRegistrationDto
            if (!IsValidDoctorDto(doctorDto, out var validationErrors))
            {
                return BadRequest(new { Success = false, Message = "Invalid registration data", Errors = validationErrors });
            }

            try
            {
                // Check if the doctor with the same email already exists
                var existingDoctor = _context.Doctors
                    .FirstOrDefault(d => d.EmailId == doctorDto.EmailId);

                if (existingDoctor != null)
                {
                    return Conflict(new { Success = false, Message = "Doctor with the same email already exists" });
                }

                // Check if the username is already taken
                var existingLogin = _context.Logins
                    .FirstOrDefault(l => l.Username == doctorDto.Username);

                if (existingLogin != null)
                {
                    return Conflict(new { Success = false, Message = "Username already taken" });
                }

                // Hash the password
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(doctorDto.Password);

                var newLogin = new Login
                {
                    Username = doctorDto.Username,
                    Pwd = hashedPassword,
                    RId = 2, // Assuming '2' is for doctor role; adjust as needed
                    Status = "Active"
                };

                _context.Logins.Add(newLogin);
                _context.SaveChanges();

                var newDoctor = new Doctor
                {
                    DfName = doctorDto.DfName,
                    DlName = doctorDto.DlName,
                    MobileNo = doctorDto.MobileNo,
                    EmailId = doctorDto.EmailId,
                    DAddress = doctorDto.DAddress,
                    RegistrationId = doctorDto.RegistrationId,
                    Doj = doctorDto.Doj,
                    Specialization = doctorDto.Specialization,
                    DeptId = doctorDto.DeptId,
                    LoginId = newLogin.LoginId
                };

                _context.Doctors.Add(newDoctor);
                _context.SaveChanges();

                return Ok(new { Success = true, Doctor = newDoctor });
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(500, new { Success = false, Message = "An error occurred while saving the doctor data", Details = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Success = false, Message = "An unexpected error occurred", Details = ex.Message });
            }
        }

        [HttpGet("getDoctors")]
        public IActionResult GetDoctors()
        {
            var doctors = _context.Doctors
                .Include(d => d.Dept)
                .Include(d => d.Login)
                .ToList();

            if (doctors == null || !doctors.Any())
            {
                return NotFound(new { Success = false, Message = "No doctors found" });
            }

            return Ok(doctors.Select(doctor => new
            {
                doctor.DoctorId,
                doctor.DfName,
                doctor.DlName,
                doctor.MobileNo,
                doctor.EmailId,
                doctor.DAddress,
                doctor.RegistrationId,
                doctor.Doj,
                doctor.Specialization,
                Department = new { doctor.Dept.DeptId, doctor.Dept.DeptName },
                Login = new { doctor.Login.LoginId, doctor.Login.Username }
            }));
        }

        private bool IsValidDoctorDto(DoctorRegistrationDto doctorDto, out Dictionary<string, string> errors)
        {
            errors = new Dictionary<string, string>();

            if (string.IsNullOrWhiteSpace(doctorDto.DfName))
                errors["DfName"] = "First name is required";

            if (string.IsNullOrWhiteSpace(doctorDto.MobileNo) || !System.Text.RegularExpressions.Regex.IsMatch(doctorDto.MobileNo, @"^[6-9]\d{9}$"))
                errors["MobileNo"] = "Invalid mobile number";

            if (string.IsNullOrWhiteSpace(doctorDto.EmailId) || !System.Text.RegularExpressions.Regex.IsMatch(doctorDto.EmailId, @"^[^\s@]+@[^\s@]+\.[^\s@]+$"))
                errors["EmailId"] = "Invalid email address";

            if (string.IsNullOrWhiteSpace(doctorDto.RegistrationId))
                errors["RegistrationId"] = "Registration ID is required";

            if (string.IsNullOrWhiteSpace(doctorDto.DAddress))
                errors["DAddress"] = "Address is required";

            if (string.IsNullOrWhiteSpace(doctorDto.Specialization))
                errors["Specialization"] = "Specialization is required";

            if (doctorDto.Doj == default)
                errors["Doj"] = "Date of joining is required";

            if (doctorDto.DeptId <= 0)
                errors["DeptId"] = "Valid department ID is required";

            if (string.IsNullOrWhiteSpace(doctorDto.Username))
                errors["Username"] = "Username is required";

            if (string.IsNullOrWhiteSpace(doctorDto.Password) || doctorDto.Password.Length < 8)
                errors["Password"] = "Password is required and must be at least 8 characters long";

            return errors.Count == 0;
        }
    }

    public class DoctorRegistrationDto
    {
        public string DfName { get; set; } = null!;
        public string? DlName { get; set; }
        public string MobileNo { get; set; } = null!;
        public string EmailId { get; set; } = null!;
        public string DAddress { get; set; } = null!;
        public string RegistrationId { get; set; } = null!;
        public DateOnly Doj { get; set; }
        public string Specialization { get; set; } = null!;
        public int DeptId { get; set; }
        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;
    }
}
