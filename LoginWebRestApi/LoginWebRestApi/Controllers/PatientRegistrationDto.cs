using System.ComponentModel.DataAnnotations;

namespace HospitalManagementSystem.DTOs
{
    public class PatientRegistrationDto
    {
        [Required(ErrorMessage = "First name is required")]
        [StringLength(50, ErrorMessage = "First name cannot be longer than 50 characters")]
        public string Fname { get; set; } = null!;

        [Required(ErrorMessage = "Last name is required")]
        [StringLength(50, ErrorMessage = "Last name cannot be longer than 50 characters")]
        public string Lname { get; set; } = null!;

        [Required(ErrorMessage = "Email address is required")]
        [EmailAddress(ErrorMessage = "Invalid email address format")]
        public string EmailAddress { get; set; } = null!;

        [Required(ErrorMessage = "Aadhar number is required")]
        [RegularExpression(@"^\d{12}$", ErrorMessage = "Aadhar number must be 12 digits")]
        public string AadharNo { get; set; } = null!;

        [Required(ErrorMessage = "Permanent address is required")]
        [StringLength(100, ErrorMessage = "Address cannot be longer than 100 characters")]
        public string PAddress { get; set; } = null!;

        [Required(ErrorMessage = "Gender is required")]
        [StringLength(10, ErrorMessage = "Gender cannot be longer than 10 characters")]
        public string Gender { get; set; } = null!;

        [Required(ErrorMessage = "Blood group is required")]
        [StringLength(3, ErrorMessage = "Blood group cannot be longer than 3 characters")]
        public string BloodGrp { get; set; } = null!;

        [Required(ErrorMessage = "Date of birth is required")]
        public DateOnly Dob { get; set; }

        [Required(ErrorMessage = "Area ID is required")]
        public int Areaid { get; set; }

        [Required(ErrorMessage = "Mobile number is required")]
        [RegularExpression(@"^\d{10}$", ErrorMessage = "Mobile number must be 10 digits")]
        public string MobNo { get; set; } = null!;

        [Required(ErrorMessage = "Username is required")]
        [StringLength(20, ErrorMessage = "Username cannot be longer than 20 characters")]
        public string Username { get; set; } = null!;

        [Required(ErrorMessage = "Password is required")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Password must be between 6 and 100 characters")]
        public string Password { get; set; } = null!;
    }
}
