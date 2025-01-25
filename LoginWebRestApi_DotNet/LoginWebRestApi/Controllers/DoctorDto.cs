public class DoctorDto
{
    public string DfName { get; set; } = null!;
    public string? DlName { get; set; }
    public string MobileNo { get; set; } = null!;
    public string EmailId { get; set; } = null!;
    public string DAddress { get; set; } = null!;
    public string RegistrationId { get; set; } = null!;
    public DateOnly Doj { get; set; } // Changed to DateTime for better compatibility
    public string Specialization { get; set; } = null!;
    public int DeptId { get; set; }
    public string Username { get; set; } = null!; // Added Username
    public string Password { get; set; } = null!; // Added Password
}
