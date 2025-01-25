using System;
using System.Collections.Generic;

namespace LoginWebRestApi.Models;

public partial class Doctor
{
    public int DoctorId { get; set; }

    public string DfName { get; set; } = null!;

    public string? DlName { get; set; }

    public string MobileNo { get; set; } = null!;

    public string EmailId { get; set; } = null!;

    public string DAddress { get; set; } = null!;

    public string RegistrationId { get; set; } = null!;

    public DateOnly Doj { get; set; }

    public string Specialization { get; set; } = null!;

    public int DeptId { get; set; }

    public int LoginId { get; set; }

    public virtual Department Dept { get; set; } = null!;

    public virtual Login Login { get; set; } = null!;
}
